import 'package:flutter/material.dart';
import 'package:ihm_projet_mobilite/widgets/create_list.dart';
import 'package:ihm_projet_mobilite/widgets/delete_list.dart';
import 'package:ihm_projet_mobilite/widgets/list_item.dart';

class ShoppingListsView extends StatefulWidget {
  static const String routeName = "/ShoppingListsView";

  final String title;

  const ShoppingListsView({this.title = 'ShoppingListsView'});

  @override
  _ShoppingListsViewState createState() => _ShoppingListsViewState();
}

class _ShoppingListsViewState extends State<ShoppingListsView> {
  List<String> _activeItems = [
    'Liste de Jean',
    'Courses de réveillon',
    'Liste temporaire'
  ];

  @override
  void initState() {
    super.initState();
  }

  onSelected(text) => setState(() => print('selected $text'));

  onDelete(text) async {
    if (await showDialog(context: context, child: DeleteList()) ?? false) {
      setState(() => _activeItems.remove(text));
    }
  }

  @override
  Widget build(BuildContext context) {
    var sortedItems = _activeItems..sort();
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
        onPressed: () => showDialog(context: context, child: AddList()),
      ),
      appBar: AppBar(
        title: Text('Mes listes de courses', textAlign: TextAlign.center),
      ),
      body: Container(
        child: Column(children: <Widget>[]..addAll(activeItems)),
      ),
    );
  }
}
