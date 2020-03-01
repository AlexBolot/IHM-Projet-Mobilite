import 'dart:async';
import 'dart:collection';

import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:ihm_projet_mobilite/model/ShopData.dart';
import 'package:ihm_projet_mobilite/shared.dart';

import '../widgets/ShopInfos.dart';

class MapView extends StatefulWidget {
  static const String routeName = "/MapView";

  final String title;
  final Function(int) bottomTapped;

  const MapView({this.title = 'Magasin', this.bottomTapped});

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  GoogleMapsPlaces _places =
      GoogleMapsPlaces(apiKey: "AIzaSyApEnhQoSvcowDisHAGJAh5HyXCOXNo8fQ");
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = Set();
  Map<String, Marker> _markersMap = HashMap();
  Map<String, ShopData> _shopsData = HashMap();
  Location _location;
  CameraPosition _userPosition;
  TextEditingController _shopNameController = TextEditingController();
  GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();

  @override
  void initState() {
    super.initState();
    this._getUserPosition().whenComplete(() => this._lookingForShops());
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
      resizeToAvoidBottomInset: false,
      body: (_userPosition != null)
          ? Center(child:
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children : <Widget>[
                  (shops.isNotEmpty)?
                  SimpleAutoCompleteTextField(
                    key: key,
                    decoration: new InputDecoration(hintText: "Rechercher Magasin"),
                    controller: _shopNameController,
                    suggestions: shops,
                    clearOnSubmit: false,
                    textSubmitted: (text) => setState(() {
                      _showShop(text);
                    }),
                  ) : Container(),
                  SizedBox(
                    height: 528,
                    child:
                    GoogleMap(
                        mapType: MapType.normal,
                        initialCameraPosition: _userPosition,
                        myLocationEnabled: true,
                        onMapCreated: (GoogleMapController controller) {
                          _controller.complete(controller);
                        },
                        markers: _markers,
                      )
                  )
                ]
            )
        )
          : Container(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showShops,
        label: Text("À Proximité"),
        icon: Icon(Icons.add_location),
      ),
    );
  }

  Future<void> _lookingForShops() async {
    final result = await _places.searchNearbyWithRadius(_location, 2500,
        type: "grocery_or_supermarket");
    result.results.forEach((f) {
      if (!_shopsData.containsKey(f.id)) {
        _shopsData.putIfAbsent(
          f.id,
          () => ShopData(f.id, f.name, f.vicinity, true, f.types,
              f.openingHours, f.photos, f.rating, true, true),
        );
        Marker marker = Marker(
          markerId: MarkerId(f.id),
          position: LatLng(f.geometry.location.lat, f.geometry.location.lng),
          onTap: () => showDialog(
            context: context,
            child: ShopInfos(
              _shopsData[f.id],
              "AIzaSyApEnhQoSvcowDisHAGJAh5HyXCOXNo8fQ",
              widget.bottomTapped,
            ),
          ),
        );
        _markersMap.putIfAbsent(f.name, () => marker);
        if(!shops.contains(f.name)){
          shops.add(f.name);
        }
      }
    });
    setState(() {});
  }


  Future<void> _showShops() async {
    if(_markersMap.isEmpty) {
      await this._lookingForShops();
    }
    _markers.clear();
    for(Marker marker in _markersMap.values.toList()){
      _markers.add(marker);
    }
    _shopNameController.clear();
    setState(() {});
  }

  Future<void> _showShop(String name) async {
    if(_markersMap.isEmpty) {
      await this._lookingForShops();
    }
    _markers.clear();
    if(_markersMap[name] != null) {
      _markers.add(_markersMap[name]);
    }
    setState(() {});
  }
}
