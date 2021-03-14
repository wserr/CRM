import 'package:crm/helpers/contactListViewCreator.dart';
import 'package:crm/helpers/contactOverviewSearch.dart';
import 'package:crm/models/student.dart';
import 'package:crm/services/studentService.dart';
import 'package:crm/services/webAuthService.dart';
import 'package:flutter/material.dart';

class ContactListOverview extends StatefulWidget {
  @override
  _ContactListOverviewState createState() => _ContactListOverviewState();
}

class _ContactListOverviewState extends State<ContactListOverview> {
  WebAuthService service = WebAuthService();
  List<Student> students = [];

  Future<List<Student>> getStudents() async {
    StudentService studentService = StudentService();
    var response = await studentService.getStudents();

    if (response != null) {
      students = response;
    }

    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
            child: ListView(children: <Widget>[
          DrawerHeader(
            child: Text('Actions'),
            decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
          ),
          ListTile(title: Text("Logout"), onTap: () => {service.logout()})
        ])),
        appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Text("Contacts"),
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  showSearch(
                      context: context,
                      delegate: ContactOverviewSearch(students));
                },
                icon: Icon(Icons.search),
              )
            ]),
        body: FutureBuilder(
          future: getStudents(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data == 'unauthorized') {
              } else {
                return ContactListViewCreator.create(students);
              }
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }, //ContactListViewCreator.create(widget.contacts),
        ));
  }
}
