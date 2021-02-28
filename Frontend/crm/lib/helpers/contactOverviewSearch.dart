import 'package:crm/models/student.dart';
import 'package:flutter/material.dart';

import 'contactListViewCreator.dart';

/**
 * This class implements the search functionality on the contacts overview page
 */
class ContactOverviewSearch extends SearchDelegate {
  final List<Student> students;
  ContactOverviewSearch(this.students);

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

  List<Student> recentList = [];
  @override
  Widget buildSuggestions(BuildContext context) {
    List<Student> suggestionList = [];
    query.isEmpty
        ? suggestionList = this.students
        : suggestionList.addAll(students.where(
            (element) => element.name.contains(query) || element.firstName.contains(query)));

    return suggestionList.isEmpty ? Text("Search provided no results."):ContactListViewCreator.create(suggestionList);
  }
}
