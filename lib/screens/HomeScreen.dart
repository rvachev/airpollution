import 'package:airpollution/bloc/BlocProvider.dart';
import 'package:airpollution/bloc/PollutionBloc.dart';
import 'package:airpollution/entities/Pollution.dart';
import 'package:airpollution/utils/colors.dart';
import 'package:airpollution/utils/constants.dart';
import 'package:airpollution/widgets/CustomBottomSheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  PersistentBottomSheetController bottomSheetController;
  PollutionBloc _pollutionBloc;
  GoogleMapController _controller;
  Color appBarColor = Colors.transparent;
  Position currentPosition;
  Set<Marker> _markers = Set();
  Set<Circle> _circles = Set();
  Pollution _pollution;

  @override
  void initState() {
    super.initState();
    _pollutionBloc = BlocProvider.of(context);
    getLocation();
  }

  getLocation() async {
    final latLng = await Geolocator().getCurrentPosition();
    currentPosition = latLng;
  }

  Widget buildGoogleMap(Pollution pollution) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(target: INITIAL_POSITION, zoom: 5),
      onMapCreated: (controller) {
        _controller = controller;
        getMarkerSetAndCircleSet(pollution);
      },
      mapType: MapType.normal,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      zoomControlsEnabled: true,
      markers: _markers,
      circles: _circles,
      minMaxZoomPreference: MinMaxZoomPreference(0, 10),
      onTap: (LatLng latLng) => onMapTap(),
      onLongPress: (LatLng latLng) => onMapLongPress(latLng),
    );
  }

  onMapLongPress(LatLng latLng) async {
    final pollution = await _pollutionBloc.getData(latLng);
    getMarkerSetAndCircleSet(pollution);
    bottomSheetController.close();
    _controller.hideMarkerInfoWindow(MarkerId('1'));
  }

  onMapTap() {
    bottomSheetController.close();
    _controller.hideMarkerInfoWindow(MarkerId('1'));
  }

  getMarkerSetAndCircleSet(Pollution pollution) async {
    Set<Marker> markersSet = Set();
    Set<Circle> circleSet = Set();
    List<double> geocoords = pollution.data.city.geo;
    LatLng position = LatLng(geocoords[0], geocoords[1]);
    int pollutionIndex = pollution.data.aqi;
    String cityName = pollution.data.city.name;
    markersSet.add(Marker(
        markerId: MarkerId('1'),
        position: position,
        infoWindow: InfoWindow(title: '$pollutionIndex', snippet: '$cityName'),
        icon: getIconByIndex(pollutionIndex),
        onTap: onMarkerTap));
    circleSet.add(Circle(
        circleId: CircleId('1'),
        center: position,
        radius: 100000.0,
        strokeWidth: 0,
        fillColor: getColorByIndex(pollutionIndex).withAlpha(127)));
    setState(() {
      appBarColor = getColorByIndex(pollutionIndex);
      _markers = markersSet;
      _circles = circleSet;
    });
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: position, zoom: await _controller.getZoomLevel())));
  }

  onMarkerTap() {
    bottomSheetController = scaffoldKey.currentState.showBottomSheet(
      (context) => CustomBottomSheet(pollution: _pollution),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: appBarColor,
        centerTitle: true,
        title: Text('Pollution'),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.info,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/info');
              })
        ],
      ),
      body: StreamBuilder(
        stream: _pollutionBloc.allData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final data = snapshot.data as Pollution;
            _pollution = data;
            return buildGoogleMap(data);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
