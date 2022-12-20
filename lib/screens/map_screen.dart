import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:menggunakan_fitur_perangkat_bawaan/models/place_location.dart';
import 'package:menggunakan_fitur_perangkat_bawaan/services/location_service.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key, required this.setLocationFn});
  final Function(PlaceLocation placeLocation) setLocationFn;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  PlaceLocation _placeLocation =
      PlaceLocation(latitude: -6.2019367, longitude: 106.2019367);

  void setLocation(LatLng position) async {
    String address = await LocationService.getCoordinateAddress(
        latitude: position.latitude, longitude: position.longitude);
    setState(() {
      _placeLocation = PlaceLocation(
          latitude: position.latitude,
          longitude: position.longitude,
          address: address);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_placeLocation.address),
      ),
      body: Stack(
        children: [
          GoogleMap(
              initialCameraPosition: CameraPosition(
                  target: LatLng(
                    _placeLocation.latitude,
                    _placeLocation.longitude,
                  ),
                  zoom: 15),
              markers: {
                Marker(
                  markerId: MarkerId('userLocation'),
                  position:
                      LatLng(_placeLocation.latitude, _placeLocation.longitude),
                ),
              },
              onTap: setLocation),
          Positioned(
              bottom: 0,
              left: 50,
              right: 50,
              child: ElevatedButton(
                onPressed: () {
                  widget.setLocationFn(_placeLocation);
                  Navigator.pop(context);
                },
                child: Text('Set Lokasi'),
              ))
        ],
      ),
    );
  }
}
