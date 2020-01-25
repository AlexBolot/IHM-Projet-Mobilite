import 'package:google_maps_webservice/places.dart';

class ShopData {

  String id;
  String name;
  String address;
  List<String> types;
  OpeningHours openingHours;
  List<Photo> photos;
  num rating;

  ShopData(String id, String name, String address, List<String> types, OpeningHours openingHours, List<Photo> photos, num rating) {
    this.id = id;
    this.name = name;
    this.address = address;
    this.types = types;
    this.openingHours = openingHours;
    this.photos = photos;
    this.rating = rating;
  }

  @override
  String toString() {
    return 'ShopData{id: $id, name: $name, address: $address, types: $types, openingHours: $openingHours, photos: $photos, rating: $rating}';
  }


}