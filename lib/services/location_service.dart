import 'dart:convert';

import 'package:http/http.dart' as https;

String googleApiKey = 'AIzaSyAdM3ym1qoI-eWVpAoSOfJdsk6z5Gdfco0';

class LocationService {
  static String generateStaticMapUrl({
    required double latitude,
    required double longitude,
  }) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=15&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C$latitude,$longitude&key=$googleApiKey';
  }

  static Future<String> getCoordinateAddress(
      {required double latitude, required double longitude}) async {
    final uri = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$googleApiKey');

    final response = await https.get(uri);

    final results = json.decode(response.body);

    return results['results'][0]['formatted_address'];
  }
}
