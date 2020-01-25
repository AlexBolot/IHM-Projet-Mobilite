import 'package:flutter/material.dart';
import 'package:ihm_projet_mobilite/shared.dart';

class DeleteList extends StatefulWidget {
  @override
  _DeleteListState createState() => _DeleteListState();
}

class _DeleteListState extends State<DeleteList> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      title: Text('Supprimer une liste', textAlign: TextAlign.center),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Text('Voulez vous supprimer cette liste ?'),
          ),
          Container(
            padding: EdgeInsets.only(top: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RaisedButton(
                  color: Colors.lightGreen,
                  child: Text(
                    'Oui',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () => Navigator.of(context).pop(true),
                ),
                RaisedButton(
                  color: Colors.red[900],
                  child: Text(
                    'Non',
                    style: TextStyle(color: contrastOf(Colors.red[900])),
                  ),
                  onPressed: () => Navigator.of(context).pop(false),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
