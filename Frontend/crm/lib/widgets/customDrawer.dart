import 'package:crm/services/webAuthService.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WebAuthService service = WebAuthService();
    return Drawer(
        child: ListView(children: <Widget>[
      DrawerHeader(
        child: Text('Actions'),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        ),
      ),
      ListTile(title: Text("Logout"), onTap: () => {service.logout()})
    ]));
  }
}
