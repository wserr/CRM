import 'package:crm/helpers/contactListViewCreator.dart';
import 'package:crm/helpers/contactOverviewBuilder.dart';
import 'package:crm/helpers/contactOverviewSearch.dart';
import 'package:crm/models/contact.dart';
import 'package:flutter/material.dart';

class ContactListOverview extends StatefulWidget {
  //TODO this list should be replaced by API call
  final List<Contact> contacts = ContactOverviewBuilder.buildContacts();
  @override
  _ContactListOverviewState createState() => _ContactListOverviewState();
}

class _ContactListOverviewState extends State<ContactListOverview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Contacts"),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: ContactOverviewSearch(widget.contacts));
              },
              icon: Icon(Icons.search),
            )
          ]),
      body: ContactListViewCreator.create(widget.contacts),
    );
  }
}
