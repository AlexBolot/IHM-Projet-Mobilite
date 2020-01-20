import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ihm_projet_mobilite/shared.dart';

class AddList extends StatefulWidget {
  @override
  _AddListState createState() => _AddListState();
}

class _AddListState extends State<AddList> {
  TextEditingController listNameController = TextEditingController();
  TextEditingController productNameController = TextEditingController();

  List<String> savedItems = [];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      title: Text('Ajouter une liste', textAlign: TextAlign.center),
      content: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    textCapitalization: TextCapitalization.words,
                    controller: listNameController,
                    decoration: InputDecoration.collapsed(
                      hintText: 'Nom de la liste',
                    ),
                  ),
                  Divider(),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Flexible(
                        child: TextField(
                          textCapitalization: TextCapitalization.words,
                          controller: productNameController,
                          decoration: InputDecoration(hintText: 'Produit'),
                          onSubmitted: (_) => addItem(),
                        ),
                      ),
                      IconButton(icon: Icon(Icons.add), onPressed: addItem)
                    ],
                  ),
                ],
              ),
            ),
            Divider(),
            Flexible(
              child: Container(
                width: 300,
                child: ListView(
                  children: savedItems.reversed.map((item) {
                    return Card(
                      elevation: 3,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Flexible(
                            child: Container(
                              padding: EdgeInsets.only(left: 16),
                              width: double.infinity,
                              child: Text(item),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () => removeItem(item),
                          )
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            RaisedButton.icon(
              color: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.of(context).pop({
                  'title': listNameController.text.trim(),
                  'items': savedItems
                });
              },
              icon: Icon(
                Icons.check,
                color: contrastOf(Theme.of(context).primaryColor),
              ),
              label: Text(
                'Créer',
                style: TextStyle(
                  color: contrastOf(Theme.of(context).primaryColor),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  addItem() {
    String text = productNameController.text.trim();
    if (text.isNotEmpty) {
      setState(() => savedItems.add(text));
    }

    productNameController.text = '';
  }

  removeItem(name) {
    setState(() {
      savedItems.remove(name);
    });
  }
}
