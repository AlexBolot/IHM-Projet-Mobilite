import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopInfos extends StatefulWidget {
  final String name;
  final String address;
  final bool dedicatedStaff;
  final bool isOpen;

  ShopInfos(
      {Key key, this.name = "name", this.address = "address", this.dedicatedStaff = true, this.isOpen = true})
      : super(key: key);

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
        title: new Text(widget.name),
        content: new ListView(
          children: <Widget>[
            new Text(widget.isOpen ? "Ouvert" : "Fermé"),
            new Image.asset('./images/carrefour.jpg', fit: BoxFit.cover),
            new Text(widget.address),
            new Text("Personnel dédié :" +
                (widget.dedicatedStaff ? "Disponible" : "Indisponible")),
          ],
        ));
  }
}
