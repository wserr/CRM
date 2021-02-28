import 'package:flutter/material.dart';

class HeaderInfo extends StatefulWidget {
  final String email;
  HeaderInfo(this.email);

  @override
  _HeaderInfoState createState() => _HeaderInfoState();
}

class _HeaderInfoState extends State<HeaderInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5.0),
        height: 100.0,
        child: Card(
            elevation: 2.0,
            child: Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
              Container(
                  margin: EdgeInsets.all(20.0),
                  child: CircleAvatar(
                            child: Icon(Icons.check),
                            backgroundColor: Colors.lightGreen),
                        alignment: Alignment.center),
              Expanded(
                  child: TextFormField(
                    initialValue: this.widget.email,
                    decoration: InputDecoration(
                        labelText: "E-mail",
                        enabled: false,
                        disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.white70,
                                style: BorderStyle.solid))),
                  )),
            ])));
  }
}
