import 'package:crm/helpers/routeChanger.dart';
import 'package:crm/models/student.dart';
import 'package:flutter/material.dart';

class ContactListViewCreator
{
  static ListView create(List<Student> students)
  {
    return ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(
            students[index].firstName + " " + students[index].name,
          ),
          leading: Icon(Icons.person),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () => {RouteChanger.change(context, students[index].id, students[index].firstName)},
        ),
      );
  }
}