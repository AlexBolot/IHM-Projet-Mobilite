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
  TextEditingController _shopNameController = TextEditingController();
  SimpleAutoCompleteTextField textField;

  @override
  void initState() {
    super.initState();
    _listName = prefs.getStringList('shoppingLists');

    (_listName ?? []).forEach((name) {
      _shoppingLists.putIfAbsent(name, () => prefs.getStringList(name));
    });
  }

  _ShopViewState() {
    textField = SimpleAutoCompleteTextField(
      key: key,
      decoration: new InputDecoration(hintText: "Entrer un Magasin"),
      controller: _shopNameController,
      suggestions: suggestions,
      textChanged: (text) => currentText = text,
      clearOnSubmit: false,
      textSubmitted: (text) => setState(() {
        print(text);
      }),
    );
  }

  List<String> suggestions = [
    "Apple",
    "Armidillo",
    "Actual",
    "Actuary",
    "America",
    "Argentina",
    "Australia",
    "Antarctica",
    "Blueberry",
    "Cheese",
    "Danish",
    "Eclair",
    "Fudge",
    "Granola",
    "Hazelnut",
    "Ice Cream",
    "Jely",
    "Kiwi Fruit",
    "Lamb",
    "Macadamia",
    "Nachos",
    "Oatmeal",
    "Palm Oil",
    "Quail",
    "Rabbit",
    "Salad",
    "T-Bone Steak",
    "Urid Dal",
    "Vanilla",
    "Waffles",
    "Yam",
    "Zest"
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: ListView(
      children: <Widget>[
        Text("Sélection Magasin"),
        ListTile(
          title: textField,
        ),
        Text("Sélection Liste"),
        DropdownButton<String>(
          hint: Text("Choisir liste"),
          value: _shoppingListName,
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 24,
          elevation: 16,
          underline: Container(
            height: 2,
            color: Colors.blue,
          ),
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
        Image.asset('./images/plan_magasin.jpg', fit: BoxFit.cover),
      ],
    ));
  }
}
