import 'package:flutter/material.dart';

class ListItem extends StatefulWidget {
  final bool active;
  final bool value;
  final String text;
  final Function(String, bool) onChange;
  final Function(String) onDelete;
  final Function(String) onActivate;

  const ListItem({
    Key key,
    this.value = false,
    this.text = '',
    this.active = true,
    this.onChange,
    this.onDelete,
    this.onActivate,
  }) : super(key: key);

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  onChange(text, val) {
    if (widget.onChange == null)
      print('checkBox $text has no OnChange callback');
    else
      widget.onChange(text, val);
  }

  onDelete(text) {
    if (widget.onDelete == null)
      print('checkBox $text has no OnDelete callback');
    else
      widget.onDelete(text);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChange(widget.text, !widget.value),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
        elevation: 8,
        child: Container(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Checkbox(
                    value: widget.value ?? false,
                    onChanged: (value) => onChange(widget.text, value),
                  ),
                  Container(width: 10), // Space separator
                  Text(widget.text),
                ],
              ),
              IconButton(
                icon: Icon(widget.active ? Icons.delete : Icons.refresh),
                onPressed: () => onDelete(widget.text),
              )
            ],
          ),
        ),
      ),
    );
  }
}
