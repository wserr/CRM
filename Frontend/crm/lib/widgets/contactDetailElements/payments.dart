import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Payments extends StatefulWidget {
  @override
  _PaymentsState createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
        margin: EdgeInsets.all(5.0),
        height: height / 5 * 3,
        width: width,
        child: Card(
            elevation: 4.0,
            child: Container(
                margin: EdgeInsets.all(20.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Payments",
                          style: Theme.of(context).textTheme.headline4),
                      Container(
                          width: width,
                          child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: DataTable(
                                columns: [
                                DataColumn(label: Text("Date")),
                                DataColumn(label: Text("Amount"))
                              ], rows: const <DataRow>[
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text('Sarah')),
                                    DataCell(Text('19')),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text('Janine')),
                                    DataCell(Text('43')),
                                  ],
                                )
                              ])))
                    ]))));
  }
}
