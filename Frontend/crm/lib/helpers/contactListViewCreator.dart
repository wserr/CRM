import 'package:crm/helpers/routeChanger.dart';
import 'package:crm/models/contact.dart';
import 'package:flutter/material.dart';

class ContactListViewCreator
{
  static ListView create(List<Contact> contacts)
  {
    return ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(
            contacts[index].name,
          ),
          leading: Icon(Icons.person),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () => {RouteChanger.change(context)},
        ),
      );
  }
}