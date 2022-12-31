import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraHomeScreen extends StatefulWidget {
  const CameraHomeScreen({super.key});

  @override
  State<CameraHomeScreen> createState() => _CameraHomeScreenState();
}

class _CameraHomeScreenState extends State<CameraHomeScreen> {
  File? _imageFile;
  List<File> _imageImageFile = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (_imageFile != null) Image.file(_imageFile!),
            Container(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _imageImageFile.length,
                itemBuilder: (context, index) {
                  return Image.file(_imageImageFile[index]);
                },
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  final pickFileImage = await ImagePicker().pickImage(
                    source: ImageSource.camera,
                    imageQuality: 10,
                    maxWidth: 1080,
                    maxHeight: 1920,
                  );

                  if (pickFileImage != null) {
                    setState(() {
                      _imageFile = File(pickFileImage.path);
                    });
                  }
                },
                child: Text('Buka kamera')),
            ElevatedButton(
                onPressed: () async {
                  final pickFileImage = await ImagePicker().pickMultiImage();
                  if (pickFileImage != null) {
                    setState(() {
                      pickFileImage.forEach((element) {
                        _imageImageFile.add(File(element.path));
                      });
                    });
                  }
                },
                child: Text('Buka gallery'))
          ],
        ),
      ),
    );
  }
}
