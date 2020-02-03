import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ihm_projet_mobilite/model/ShopData.dart';
import 'package:ihm_projet_mobilite/widgets/shop_schedule.dart';

class ShopInfos extends StatefulWidget {
  final ShopData shopData;
  final String googleApiKey;
  final Function(int) bottomTapped;

  ShopInfos(this.shopData, this.googleApiKey, this.bottomTapped);

  @override
  _ShopInfosState createState() => _ShopInfosState();

  String buildPhotoURL(String photoReference) {
    return "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=${photoReference}&key=${this.googleApiKey}";
  }
}

class _ShopInfosState extends State<ShopInfos> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        title: Text(widget.shopData.name),
        content: Column(
          children: <Widget>[
            Text(widget.shopData.open ? "Ouvert" : "Fermé"),
            /*Container(
              width: 230,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.shopData.photos.length,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: EdgeInsets.only(right: 1.0),
                        child: SizedBox(
                          height: 100,
                          child: Image.network(widget.buildPhotoURL(
                              widget.shopData.photos[index].photoReference)),
                        ));
                  }),
            ),*/
            Text(widget.shopData.address),
            Text("Personnel dédié : " +
                (widget.shopData.dedicatedStaff
                    ? "Disponible"
                    : "Indisponible")),
            ShopSchedule(widget.shopData),
            RaisedButton(
              color: Colors.lightGreen,
              child: Text(
                'Itinéraire au sein du magasin',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () =>
                  {Navigator.of(context).pop(false), widget.bottomTapped(1)},
            ),
            RaisedButton(
              color: Colors.lightGreen,
              child: Text(
                'Fermer',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => Navigator.of(context).pop(false),
            )
          ],
        ));
  }
}
