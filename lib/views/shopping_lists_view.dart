import 'package:flutter/material.dart';
import 'package:ihm_projet_mobilite/views/add_list_view.dart';
import 'package:ihm_projet_mobilite/widgets/ListItem.dart';

class ShoppingListsView extends StatefulWidget {
  static const String routeName = "/ShoppingListsView";

  final String title;

  const ShoppingListsView({this.title = 'ShoppingListsView'});

  @override
  _ShoppingListsViewState createState() => _ShoppingListsViewState();
}

class _ShoppingListsViewState extends State<ShoppingListsView> {
  Map<String, bool> _activeItems = {
    'Liste de Jean': true,
    'Courses de réveillon': true,
    'Liste temporaire': true,
  };

  @override
  void initState() {
    super.initState();
  }

  onChange(text, value) => setState(() => _activeItems[text] = value);

  onDelete(text) => setState(() => _activeItems.remove(text));

  @override
  Widget build(BuildContext context) {
    var sortedItems = _activeItems.keys.toList()..sort();
    var activeItems = sortedItems.map(
      (String f) => ListItem(
        text: f,
        value: _activeItems[f],
        onChange: onChange,
        onDelete: onDelete,
      ),
    );

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'createList',
        label: Text('Ajouter'),
        icon: Icon(Icons.playlist_add, size: 30),
        onPressed: () => showDialog(context: context, child: AddListView()),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(height: 16),
            Text('Mes listes de courses'),
            Container(height: 16),
          ]..addAll(activeItems),
        ),
      ),
    );
  }
}
