import 'package:flutter/material.dart';
import 'package:ihm_projet_mobilite/shared.dart';
import 'package:ihm_projet_mobilite/widgets/create_list.dart';
import 'package:ihm_projet_mobilite/widgets/delete_list.dart';
import 'package:ihm_projet_mobilite/widgets/list_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShoppingListsView extends StatefulWidget {
  static const String routeName = "/ShoppingListsView";

  final String title;

  const ShoppingListsView({this.title = 'ShoppingListsView'});

  @override
  _ShoppingListsViewState createState() => _ShoppingListsViewState();
}

class _ShoppingListsViewState extends State<ShoppingListsView> {
  Map<String, List<String>> _shoppingLists = {};

  @override
  void initState() async {
    super.initState();
    List<String> listNames = prefs.getStringList('shoppingLists');

    listNames.forEach((name) {
      _shoppingLists.putIfAbsent(name, () => prefs.getStringList(name));
    });
  }

  onSelected(text) => setState(() => print('selected $text'));

  onDelete(text) async {
    if (await showDialog(context: context, child: DeleteList()) ?? false) {
      setState(() => _shoppingLists.remove(text));
    }
  }

  @override
  Widget build(BuildContext context) {
    var sortedItems = _shoppingLists.keys.toList()..sort();
    var activeItems = sortedItems.map(
      (name) => ListItem(
        text: name,
        onSelected: onSelected,
        onDelete: onDelete,
      ),
    );

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'createList',
        label: Text('Ajouter'),
        icon: Icon(Icons.playlist_add, size: 30),
        onPressed: addList,
      ),
      appBar: AppBar(
        title: Text('Mes listes de courses', textAlign: TextAlign.center),
      ),
      body: Container(
        child: Column(children: <Widget>[]..addAll(activeItems)),
      ),
    );
  }

  addList() async {
    var result = await showDialog(context: context, child: AddList());
    setState(() {
      _shoppingLists.putIfAbsent(result.title, () => result.items);
      prefs.setStringList('shoppingLists', _shoppingLists.keys);
      prefs.setStringList(result.title, result.items);
    });
  }
}
