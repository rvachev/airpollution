import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class PollutionRepositoryProvider{

  Future<String> getJsonBody(LatLng latLng) async{
    double lat = latLng.latitude;
    double lng = latLng.longitude;
    String url = 'https://api.waqi.info/feed/geo:$lat;$lng/?token=041a15689f0b177c90e92f1dd1910e2470a09e6b';
    http.Response response = await http.post(url);
    return response.body;
  }

}