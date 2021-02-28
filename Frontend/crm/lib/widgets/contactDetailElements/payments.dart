import 'package:crm/models/payment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

class Payments extends StatefulWidget {
  final List<Payment> payments;

  Payments(this.payments);

  @override
  _PaymentsState createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  List<DataRow> getPayments() {
    List<DataRow> payments = [];
    var formatter = NumberFormat('#,##,##0.00');

    for (Payment item in this.widget.payments) {
      payments.add(DataRow(cells: <DataCell>[
        DataCell(Text(item.timeStamp.toIso8601String().split('T').first)),
        DataCell(Text(formatter.format(item.amount),textAlign: TextAlign.right,))
      ]));
    }
    return payments;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
        margin: EdgeInsets.all(5.0),
        width: width,
        child: Card(
            elevation: 2.0,
            child: Container(
                margin: EdgeInsets.fromLTRB(60.0,10.0,40.0,60.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: width,
                          child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: DataTable(columns: [
                                DataColumn(label: Text("Date")),
                                DataColumn(label: Text("Amount"))
                              ], rows: this.getPayments())))
                    ]))));
  }
}
