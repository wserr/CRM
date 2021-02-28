import 'package:crm/models/studentDetail.dart';
import 'package:crm/services/studentService.dart';
import 'package:crm/widgets/contactDetailElements/headerInfo.dart';
import 'package:flutter/material.dart';

import 'contactDetailElements/payments.dart';

class ContactDetail extends StatefulWidget {
  final int id;
  final String name;
  ContactDetail(this.id, this.name);

  @override
  _ContactDetailState createState() => _ContactDetailState();
}

class _ContactDetailState extends State<ContactDetail> {
  StudentDetail detail;

  Future<StudentDetail> getStudentDetail(int id) async {
    StudentService studentService = StudentService();
    var response = await studentService.getStudentDetail(id);

    if (response != null) {
      detail = response;
    }

    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Text(this.widget.name)),
        body: //Center(child: ListView(children: [HeaderInfo(), Payments()])));
            FutureBuilder(
                future: getStudentDetail(this.widget.id),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Center(
                        child: Container(
                            margin: EdgeInsets.only(top: 10.0),
                            width: 600.0,
                            child: ListView(children: [
                              Container(
                                  margin: EdgeInsets.only(left:5.0),
                                  child: Text("General Info",
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1)),
                              HeaderInfo(this.detail.email),
                              SizedBox(height: 10.0),
                              Container(
                                  margin: EdgeInsets.only(left:5.0),
                                  child: Text("Payments",
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1)),
                              Payments(this.detail.payments ?? [])
                            ])));
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }));
  }
}
