import 'package:flutter/material.dart';

class HeaderInfo extends StatefulWidget {
  @override
  _HeaderInfoState createState() => _HeaderInfoState();
}

class _HeaderInfoState extends State<HeaderInfo> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
        margin: EdgeInsets.all(5.0),
        height: height / 5,
        child: Card(
            elevation: 4.0,
            child: Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
              Spacer(),
              Container(
                  margin: EdgeInsets.all(10.0),
                  width: width / 10,
                  height: height / 5,
                  child: Stack(fit: StackFit.expand, children: [
                    Icon(Icons.person, color: Colors.grey, size: height/10),
                    Align(
                        child: CircleAvatar(
                            child: Icon(Icons.check, size: height/40, color: Colors.black),
                            backgroundColor: Colors.lightGreen,
                            radius: height / 40),
                        alignment: Alignment.topRight)
                  ])),
              Spacer(),
              Container(
                  width: width/3*2,
                  height: height / 7,
                  child: TextFormField(
                    initialValue: "serruys.willem@hotmail.com",
                    decoration: InputDecoration(
                        labelText: "E-mail",
                        enabled: false,
                        disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.white70,
                                style: BorderStyle.solid))),
                  )),
              Spacer(flex: 8)
            ])));
  }
}
