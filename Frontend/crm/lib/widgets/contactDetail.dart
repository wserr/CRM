import 'package:crm/widgets/contactDetailElements/headerInfo.dart';
import 'package:flutter/material.dart';

import 'contactDetailElements/payments.dart';

class ContactDetail extends StatefulWidget {
  @override
  _ContactDetailState createState() => _ContactDetailState();
}

class _ContactDetailState extends State<ContactDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Details for contact"),
        ),
        body: Center(child: ListView(children: [HeaderInfo(), Payments()])));
  }
}
