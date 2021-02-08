import 'package:crm/models/contact.dart';
import 'package:flutter/material.dart';

import 'contactListViewCreator.dart';

/**
 * This class implements the search functionality on the contacts overview page
 */
class ContactOverviewSearch extends SearchDelegate {
  final List<Contact> contacts;
  ContactOverviewSearch(this.contacts);

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  String selectedResult;
  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Center(
        child: Text(selectedResult??"Search provided no results."),
      ),
    );
  }

  List<Contact> recentList = [];
  @override
  Widget buildSuggestions(BuildContext context) {
    List<Contact> suggestionList = [];
    query.isEmpty
        ? suggestionList = this.contacts
        : suggestionList.addAll(contacts.where(
            (element) => element.name.contains(query)));

    return suggestionList.isEmpty ? Text("Search provided no results."):ContactListViewCreator.create(suggestionList);
  }
}
