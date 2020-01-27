import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../widgets/ShopInfos.dart';

class MapView extends StatefulWidget {
  static const String routeName = "/MapView";

  final String title;

  const MapView({this.title = 'Magasin'});

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = Set();

  @override
  void initState() {
    super.initState();
  }

  static final CameraPosition _saintPhillipe = CameraPosition(
    target: LatLng(43.61, 7.0775),
    zoom: 13.9,
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _saintPhillipe,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: _markers,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _lookingForShops,
        label: Text("Search"),
        icon: Icon(Icons.add_location),
      ),
    );
  }

  Future<void> _lookingForShops() async {
    _markers.add(Marker(
        markerId: MarkerId('Casino'),
        position: LatLng(43.617795, 7.075082),
        onTap: () => showDialog(context: context, child: ShopInfos("Supermarché casino", "Saint Philippe", true, true))));
    _markers.add(Marker(
        markerId: MarkerId('Carrefour'),
        position: LatLng(43.603854, 7.089324),
        onTap: () => showDialog(context: context, child: ShopInfos("Carrefour", "Antibes", false, true))));
    setState(() {});
  }
}
