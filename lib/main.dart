import 'package:flutter/material.dart';
import 'package:menggunakan_fitur_perangkat_bawaan/screens/camera_home_screen.dart';
import 'package:menggunakan_fitur_perangkat_bawaan/screens/location_home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LocationHomeScreen(),
    );
  }
}
