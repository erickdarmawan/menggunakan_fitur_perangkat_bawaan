import 'dart:convert';

import 'package:http/http.dart' as http;

const google_api_key = "AIzaSyAewObC4AwKmUWUzedixKm9C4912Wqj9uI";

class LocationService {
  static String generateStaticMapUrl({
    required double latitude,
    required double longitude,
  }) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=15&size=600x400&maptype=roadmap&markers=color:blue%7Clabel:S%7C$latitude,$longitude&key=$google_api_key';
    //TODO ganti url dari google cloud platform (GCP)
  }

  static Future<String> getCoordinateAddress(
      {required double latitude, required double longitude}) async {
    final uri = Uri.parse(
        'http://maps.googleapis.com/maps/geocode/outputFormat?lating=$latitude, $longitude&key$google_api_key');
    //TODO ganti url dari google cloud platform (GCP)
    print(uri);
    final response = await http.get(uri);
    final results = json.decode(response.body);

    // print((response.body));

    return results['results'][0]['formatted_address'];
  }
}
