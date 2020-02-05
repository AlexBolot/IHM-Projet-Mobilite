import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:ihm_projet_mobilite/shared.dart';

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
            Flexible(
              child: Center(
                child:
                    Image.asset('./images/plan_magasin.jpg', fit: BoxFit.cover),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
