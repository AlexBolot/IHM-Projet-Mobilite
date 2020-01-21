import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ihm_projet_mobilite/shared.dart';

class UpdateList extends StatefulWidget {
  final Map map;

  UpdateList(this.map);

  @override
  _UpdateListState createState() => _UpdateListState();
}

class _UpdateListState extends State<UpdateList> {
  TextEditingController _listNameController = TextEditingController();
  TextEditingController _productNameController = TextEditingController();

  List<String> _savedItems = [];

  @override
  void initState() {
    super.initState();
    _listNameController.text = widget.map['title'];
    _savedItems = widget.map['items'];
  }

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
                    controller: _listNameController,
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
                          controller: _productNameController,
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
                  children: _savedItems.reversed.map((item) {
                    return Card(
                      elevation: 4,
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
                  'title': _listNameController.text.trim(),
                  'items': _savedItems
                });
              },
              icon: Icon(
                Icons.check,
                color: contrastOf(Theme.of(context).primaryColor),
              ),
              label: Text(
                'Mettre à jour',
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
    String text = _productNameController.text.trim();
    if (text.isNotEmpty) {
      setState(() => _savedItems.add(text));
    }

    _productNameController.text = '';
  }

  removeItem(name) {
    setState(() {
      _savedItems.remove(name);
    });
  }
}
