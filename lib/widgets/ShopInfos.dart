import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopInfos extends StatefulWidget {
  final String name;
  final String address;
  final bool dedicatedStaff;
  final bool isOpen;

  ShopInfos(this.name, this.address, this.dedicatedStaff, this.isOpen);

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
        title: Text(widget.name),
        content: Column(
          children: <Widget>[
            Text(widget.isOpen ? "Ouvert" : "Fermé"),
            Image.asset('./images/carrefour.jpg', fit: BoxFit.cover),
            Text(widget.address),
            Text("Personnel dédié :" +
                (widget.dedicatedStaff ? "Disponible" : "Indisponible")),
          ],
        ));
  }
}
