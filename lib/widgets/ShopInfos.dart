import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ihm_projet_mobilite/model/ShopData.dart';
import 'package:ihm_projet_mobilite/widgets/shop_schedule.dart';
import 'package:ihm_projet_mobilite/shared.dart';


class ShopInfos extends StatefulWidget {
  final ShopData shopData;
  final String googleApiKey;
  final Function(int) bottomTapped;

  ShopInfos(this.shopData, this.googleApiKey, this.bottomTapped);

  @override
  _ShopInfosState createState() => _ShopInfosState();

  String buildPhotoURL(String photoReference) {
    return "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=$photoReference&key=${this.googleApiKey}";
  }
}

class _ShopInfosState extends State<ShopInfos> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        title: Center(
          child: Text(widget.shopData.name, textAlign: TextAlign.center),
        ),
        content: ListView(
          children: <Widget>[
            Center(
              child: Text(widget.shopData.open ? "Ouvert" : "Fermé",
                  style: TextStyle(color: Colors.lightGreen),
                  textAlign: TextAlign.center),
            ),
            Container(
              width: 230,
              height: 200,
              child: Center(
                  child: SizedBox(
                height: 180,
                child: Image.network(widget
                    .buildPhotoURL(widget.shopData.photos[0].photoReference)),
              )),
            ),
            Text(widget.shopData.address),
            Text("Personnel dédié : " +
                (widget.shopData.dedicatedStaff
                    ? "Disponible"
                    : "Indisponible")),
            Divider(),
            ShopSchedule(widget.shopData),
            Divider(),
            RaisedButton(
              color: Colors.lightBlue,
              child: Text(
                'Itinéraire au sein du magasin',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () =>
                  {Navigator.of(context).pop(false), widget.bottomTapped(1)},
            )
          ],
        ));
  }
}
