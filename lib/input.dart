import 'package:flutter/material.dart';

class item extends StatefulWidget {
  const item({Key? key}) : super(key: key);

  @override
  _itemState createState() => _itemState();
}

class _itemState extends State<item> {
  @override
  TextEditingController items = TextEditingController();
  TextEditingController qty = TextEditingController();
  TextEditingController rate = TextEditingController();
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        new Flexible(
          child: new TextField(
              controller: items,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1.0),
                  ),
                  labelText: 'Item',
                  contentPadding: EdgeInsets.all(10))),
        ),
        SizedBox(width: 10),
        new Flexible(
          child: new TextField(
              controller: qty,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1.0),
                  ),
                  labelText: 'Qty',
                  contentPadding: EdgeInsets.all(10))),
        ),
        SizedBox(width: 10),
        new Flexible(
          child: new TextField(
              controller: rate,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1.0),
                  ),
                  labelText: 'Rate',
                  contentPadding: EdgeInsets.all(10))),
        ),
      ],
    );
  }
}
