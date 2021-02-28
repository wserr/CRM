import 'package:crm/widgets/contactDetail.dart';
import 'package:flutter/material.dart';

class RouteChanger {
  static void change(BuildContext context, int id, String name) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ContactDetail(id, name)));
  }
}
