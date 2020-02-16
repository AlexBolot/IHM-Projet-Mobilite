import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:ihm_projet_mobilite/shared.dart';
import 'package:ihm_projet_mobilite/utils/painter.dart';

class ShopView extends StatefulWidget {
  static const String routeName = "/ShopView";

  final String title;

  const ShopView({this.title = 'Magasin'});

  @override
  _ShopViewState createState() => _ShopViewState();
}

class _ShopViewState extends State<ShopView> {
  String currentText = "";
  String _shoppingListName;
  Map<String, List<String>> _shoppingLists = {};
  List<String> _listName;
  GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();
  TextEditingController _shopNameController =
      TextEditingController(text: selectedShop);
  SimpleAutoCompleteTextField textField;
  bool showPath = false;
  List<List<Offset>> pathList;

  @override
  void initState() {
    super.initState();
    _listName = prefs.getStringList('shoppingLists') ?? [];

    _listName.forEach((name) {
      _shoppingLists.putIfAbsent(name, () => prefs.getStringList(name));
    });

    textField = SimpleAutoCompleteTextField(
      key: key,
      decoration: new InputDecoration(hintText: "Saisir le nom du Magasin"),
      controller: _shopNameController,
      suggestions: shops,
      textChanged: (text) => currentText = text,
      clearOnSubmit: false,
      textSubmitted: (text) => setState(() {
        print(text);
      }),
    );
    pathList = this.createPathList();
  }

  @override
  Widget build(BuildContext context) {
    selectedShop = "";
    return new Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:24.0, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            textField,
            DropdownButton<String>(
              hint: Text("Choisir liste de courses"),
              value: _shoppingListName,
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 16,
              underline: Container(height: 2, color: Colors.blue),
              onChanged: (String newValue) {
                setState(() {
                  _shoppingListName = newValue;
                  print(_shoppingListName);
                  print(_shoppingLists[_shoppingListName]);
                });
              },
              items: _listName.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            RaisedButton.icon(
              color: Theme.of(context).primaryColor,
              onPressed: () {
                if(_shoppingListName != null){
                  this.setState(() {this.showPath = !this.showPath;});
                }
              },
              icon: Icon(
                Icons.explore,
                color: contrastOf(Theme.of(context).primaryColor),
              ),
              label: Text(
                'Afficher chemin le plus court',
                style: TextStyle(
                  color: contrastOf(Theme.of(context).primaryColor),
                ),
              ),
            ),
            Flexible(
              child: Center(
                child: Stack(
                  children:[
                    Image.asset('./images/plan_magasin.jpg', fit: BoxFit.cover),
                    showPath ?
                    CustomPaint(
                      painter: Painter(
                        size: MediaQuery.of(context).size,
                        points: pathList[_listName.indexOf(_shoppingListName)]
                      ),
                    ) : Container()
                  ]
                )
              )
            ),
          ]
        ),
      )
    );
  }


  List<List<Offset>> createPathList() {
    List<List<Offset>> paths = [];
    paths.add([Offset(20, 160),
               Offset(40, 160),
               Offset(40, 55),
               Offset(220, 55),
               Offset(220, 72),
               Offset(260, 72),
               Offset(260, 85),
               Offset(220, 85),
               Offset(220, 135),
               Offset(110, 135),
               Offset(110, 180),
               Offset(40, 180),
               Offset(40, 170),
               Offset(20, 170)]);
    paths.add([Offset(20, 160),
               Offset(40, 160),
               Offset(40, 85),
               Offset(140, 85),
               Offset(140, 50),
               Offset(220, 50),
               Offset(220, 15),
               Offset(310, 15),
               Offset(310, 75),
               Offset(225, 75),
               Offset(225, 120),
               Offset(170, 120),
               Offset(170, 140),
               Offset(220, 140),
               Offset(220, 185),
               Offset(280, 185),
               Offset(280, 195),
               Offset(100, 195),
               Offset(100, 180),
               Offset(40, 180),
               Offset(40, 170),
               Offset(20, 170),
    ]);
    return paths;
  }
}
