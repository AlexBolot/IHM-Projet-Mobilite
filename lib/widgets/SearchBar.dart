import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text("Rechercher un magasin"),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(context: context, delegate: DataSearch());
                })
          ]),
      drawer: Drawer(),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(icon: AnimatedIcons.menu_arrow, progress: null),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some results base on the selection
    return Center(
      child: Container(
          height: 100.0,
          width: 100.0,
          child: Card(
            color: Colors.red,
            shape: StadiumBorder(),
            child: Center(
              child: Text(query),
            ),
          )),
    );
  }

  final recentShops = ['Carrefour antibes', 'Supermarché casino'];

  final shopList = [
    'Carrefour antibes',
    'Supermarché casino',
    'Lidl',
    'Leclerc',
    'Géant Casino',
    'Carrefour market',
    'Casino shop'
  ];

  @override
  Widget buildSuggestions(BuildContext context) {
    //show suggestions based on the selection
    final suggestionList = query.isEmpty
        ? recentShops
        : shopList.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
          onTap: () {
            showResults(context);
          },
          leading: Icon(Icons.location_city),
          title: RichText(
            text: TextSpan(
                text: suggestionList[index].substring(0, query.length),
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: suggestionList[index].substring(query.length),
                    style: TextStyle(color: Colors.grey),
                  ),
                ]),
          )),
      itemCount: suggestionList.length,
    );
  }
}
