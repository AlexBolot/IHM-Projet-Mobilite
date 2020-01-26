import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:ihm_projet_mobilite/model/ShopData.dart';

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
  Map<String, ShopData> _shopsData = HashMap();
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

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: (_userPosition != null)
          ? GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _userPosition,
              //myLocationButtonEnabled: true,
              myLocationEnabled: true,
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
    final result = await _places.searchNearbyWithRadius(_location, 2500, type: "grocery_or_supermarket");
    Set<Marker> markersTmp = _markers;
    Map<String, ShopData> dataTmp = _shopsData;
    result.results.forEach((f) {
      if(f.types.contains("grocery_or_supermarket") || f.types.contains("store")){
        Marker marker = Marker(
            markerId: MarkerId(f.name),
            position: LatLng(f.geometry.location.lat, f.geometry.location.lng));
        dataTmp.putIfAbsent(f.id, () => new ShopData(f.id, f.name, f.vicinity, f.types, f.openingHours, f.photos, f.rating));
        markersTmp.add(marker);
      }
    });
    setState(() {
      _markers = markersTmp;
      _shopsData = dataTmp;
    });
    _shopsData.values.toSet().forEach((f) {
      print(f.toString());
    });
  }
}
