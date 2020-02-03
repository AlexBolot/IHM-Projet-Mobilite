import 'package:flutter/cupertino.dart';
import 'package:ihm_projet_mobilite/model/ShopData.dart';

class ShopSchedule extends StatefulWidget {
  final ShopData shopData;

  ShopSchedule(this.shopData);

  @override
  _ShopScheduleState createState() => _ShopScheduleState();
}

class _ShopScheduleState extends State<ShopSchedule> {
  @override
  Widget build(BuildContext context) {
    return Table(children: [
      TableRow(children: [
        TableCell(
          child: Row(children: [Text('lundi : '), Text('8h30-20h30')]),
        )
      ]),
      TableRow(children: [
        TableCell(
          child: Row(children: [Text('mardi : '), Text('8h30-20h30')]),
        )
      ]),
      TableRow(children: [
        TableCell(
          child: Row(children: [Text('mercredi : '), Text('8h30-20h30')]),
        )
      ]),
      TableRow(children: [
        TableCell(
          child: Row(children: [Text('jeudi : '), Text('8h30-20h30')]),
        )
      ]),
      TableRow(children: [
        TableCell(
          child: Row(children: [Text('vendredi : '), Text('8h30-20h30')]),
        )
      ]),
      TableRow(children: [
        TableCell(
          child: Row(children: [Text('samedi : '), Text('8h30-21h30')]),
        )
      ]),
      TableRow(children: [
        TableCell(
          child: Row(children: [Text('dimanche : '), Text('Fermé')]),
        )
      ]),
    ]);
  }
}
