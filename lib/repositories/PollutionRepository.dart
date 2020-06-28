import 'dart:convert';

import 'package:airpollution/entities/Pollution.dart';
import 'package:airpollution/repositories/PollutionRepositoryProvider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PollutionRepository {
  final pollutionRepositoryProvider = PollutionRepositoryProvider();

  Future<Pollution> fetchData(LatLng latLng) async {
    String body = await pollutionRepositoryProvider.getJsonBody(latLng);
    return await getData(body);
  }

  Future<Pollution> getData(String jsonBody) async {
    var parsedJson = json.decode(jsonBody);
    return Pollution.fromJson(parsedJson);
  }
}
