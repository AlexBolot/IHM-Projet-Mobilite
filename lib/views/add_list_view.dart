import 'package:flutter/material.dart';

class AddListView extends StatefulWidget {
  static const String routeName = "/AddListView";

  final String title;

  const AddListView({this.title = 'AddListView'});

  @override
  _AddListViewState createState() => _AddListViewState();
}

class _AddListViewState extends State<AddListView> {
  TextEditingController listNameController = TextEditingController();

  Map itemControllers = {};

  @override
  void initState() {
    super.initState();
    itemControllers.putIfAbsent(1, () => TextEditingController());
  }

  @override
  Widget build(BuildContext context) {
    var items = itemControllers.keys.toList()..map((i) => itemControllers[i]);

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      title: Text('Ajouter une liste', textAlign: TextAlign.center),
      content: Container(
        margin: EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: 'Nom de la liste'),
              controller: listNameController,
            ),
          ],
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RaisedButton(
            color: Theme.of(context).primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.save),
                Container(width: 5),
                Text('Valider'),
              ],
            ),
            onPressed: Navigator.of(context).pop,
          ),
        ),
      ],
    );
  }
}
