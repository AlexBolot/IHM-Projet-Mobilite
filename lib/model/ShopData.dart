import 'package:google_maps_webservice/places.dart';

class ShopData {
  String id;
  String name;
  String address;
  bool open;
  List<String> types;
  OpeningHours openingHours;
  List<Photo> photos;
  num rating;
  bool dedicatedStaff;
  bool accessible;

  ShopData(
      String id,
      String name,
      String address,
      bool open,
      List<String> types,
      OpeningHours openingHours,
      List<Photo> photos,
      num rating,
      bool dedicatedStaff,
      bool accessible) {
    this.id = id;
    this.name = name;
    this.address = address;
    this.open = open;
    this.types = types;
    this.openingHours = openingHours;
    this.photos = photos;
    this.rating = rating;
    this.dedicatedStaff = dedicatedStaff;
    this.accessible = accessible;
  }

  @override
  String toString() {
    return 'ShopData{id: $id, name: $name, address: $address, open: $open, types: $types, openingHours: $openingHours, photos: $photos, rating: $rating, dedicatedStaff: $dedicatedStaff}';
  }
}
