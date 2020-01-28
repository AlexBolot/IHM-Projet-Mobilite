import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ihm_projet_mobilite/model/ShopData.dart';

class ShopInfos extends StatefulWidget {
  final ShopData shopData;

  ShopInfos(this.shopData);

  @override
  _ShopInfosState createState() => _ShopInfosState();
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
            Image.asset('./images/carrefour.jpg', fit: BoxFit.cover),
            Text(widget.shopData.address),
            Text("Personnel dédié :" +
                (widget.shopData.dedicatedStaff ? "Disponible" : "Indisponible")),
          ],
        ));
  }
}
