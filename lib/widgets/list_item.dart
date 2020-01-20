import 'package:flutter/material.dart';

class ListItem extends StatefulWidget {
  final String text;
  final Function(String) onSelected;
  final Function(String) onDelete;
  final Function(String) onEdit;

  const ListItem({
    Key key,
    this.text = '',
    this.onSelected,
    this.onDelete,
    this.onEdit,
  }) : super(key: key);

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    var round = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(100.0),
    );

    return GestureDetector(
      onTap: () => widget.onSelected(widget.text),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 8,
                child: Container(
                  height: 48,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.shopping_cart,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Text(widget.text),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              elevation: 8,
              shape: round,
              child: IconButton(
                icon: Icon(Icons.edit, color: Colors.lightGreen),
                onPressed: () => widget.onEdit(widget.text),
              ),
            ),
            Card(
              elevation: 8,
              shape: round,
              child: IconButton(
                icon: Icon(Icons.delete, color: Colors.red[900]),
                onPressed: () => widget.onDelete(widget.text),
              ),
            )
          ],
        ),
      ),
    );
  }
}
