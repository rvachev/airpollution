import 'dart:async';

import 'package:airpollution/bloc/Bloc.dart';
import 'package:airpollution/entities/Pollution.dart';
import 'package:airpollution/repositories/PollutionRepository.dart';
import 'package:airpollution/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rxdart/rxdart.dart';

class PollutionBloc implements Bloc{
  final PollutionRepository _pollutionRepository;
  Pollution pollution;

  PollutionBloc({@required PollutionRepository pollutionRepository}) : _pollutionRepository = pollutionRepository;

  final _pollutionStateController = PublishSubject<Pollution>();

  StreamSink<Pollution> get _data => _pollutionStateController.sink;
  Stream<Pollution> get allData => _pollutionStateController.stream;

  @override
  init() {
    if(pollution == null) loadData(INITIAL_POSITION);
  }

  Future<Pollution> getData(LatLng latLng) async{
    return loadData(latLng);
  }

  Future<Pollution> loadData(LatLng latLng) async {
    pollution = await _pollutionRepository.fetchData(latLng);
    _data.add(pollution);
    return pollution;
  }

  @override
  dispose() {
    _pollutionStateController.close();
  }
}