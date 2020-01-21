import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';

class MapView extends StatefulWidget {
  static const String routeName = "/MapView";

  final String title;

  const MapView({this.title = 'Magasin'});

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: "AIzaSyApEnhQoSvcowDisHAGJAh5HyXCOXNo8fQ");
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = Set();
  Location _location;
  CameraPosition _userPosition;

  @override
  void initState() {
    super.initState();
    this._getUserPosition();
  }

  Future<void> _getUserPosition() async {
    await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((result) {
      _location = Location(result.latitude, result.longitude);
      _userPosition = CameraPosition(
        target: LatLng(result.latitude, result.longitude),
        zoom: 13.9,
      );
    });

    setState(() {});
  }

  static final CameraPosition _saintPhillipe = CameraPosition(
    target: LatLng(43.61, 7.0775),
    zoom: 13.9,
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: (_userPosition != null)
          ? GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _userPosition,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              markers: _markers,
            )
          : Container(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _lookingForShops,
        label: Text("Search"),
        icon: Icon(Icons.add_location),
      ),
    );
  }

  Future<void> _lookingForShops() async {
    //print(_location);
    final result = await _places.searchNearbyWithRadius(_location, 2500);
    print(result.results.toString());
    Set<Marker> tmp = _markers;
    result.results.forEach((f) {
      //print(f.geometry.location.toString());
      Marker marker = Marker(
          markerId: MarkerId(f.name),
          position: LatLng(f.geometry.location.lat, f.geometry.location.lng));
      tmp.add(marker);
    });
    /*_markers.add(Marker(
      markerId: MarkerId('Casino'),
      position: LatLng(43.617795, 7.075082),
    ));
    _markers.add(Marker(
      markerId: MarkerId('Carrefour'),
      position: LatLng(43.603854, 7.089324),
    ));*/
    //print(tmp.length);
    setState(() { _markers = tmp; });
  }
}
