import 'dart:convert';

import 'package:http/http.dart' as https;

String googleApiKey = 'AIzaSyAdM3ym1qoI-eWVpAoSOfJdsk6z5Gdfco0';
// "AIzaSyAewObC4AwKmUWUzedixKm9C4912Wqj9uI";

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
    //TODO ganti url dari google cloud platform (GCP)
    print(uri);
    final response = await https.get(uri);
    // var encodeFirst = json.encode(response.body);
    final results = json.decode(response.body);

    print((response.body));

    return results['results'][0]['formatted_address'];
  }
}
