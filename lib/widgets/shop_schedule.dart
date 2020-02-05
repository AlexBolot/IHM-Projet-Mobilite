import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    Map timespans = {
      'lundi': ['8h30', '20h30'],
      'mardi': ['8h30', '20h30'],
      'mercredi': ['8h30', '20h30'],
      'jeudi': ['8h30', '20h30'],
      'vendredi': ['8h30', '20h30'],
      'samedi': ['8h30', '21h30'],
      'dimanche': ['fermé', 'fermé']
    };

    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: timespans.keys.map((key) {
          return Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Text('$key:'),
              )
            ]..addAll(getExpanded(timespans[key])),
          );
        }).toList(),
      ),
    );
  }

  getExpanded(List<String> list) {
    return list.map((val) {
      return Expanded(flex: 2, child: Text(val));
    }).toList();
  }
}
