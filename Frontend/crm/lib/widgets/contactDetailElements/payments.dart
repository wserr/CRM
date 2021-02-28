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

  Widget noPayments()
  {
    return Center(child: Text("No Payments found."));
  }

  Widget paymentTable()
  {
    return SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: DataTable(columns: [
                                DataColumn(label: Text("Date",
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1)),
                                DataColumn(label: Text("Amount",
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1))
                              ], rows: this.getPayments()));
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
        margin: EdgeInsets.all(5.0),
        width: width,
        child: Card(
            elevation: 2.0,
            child: Container(
                margin: EdgeInsets.fromLTRB(60.0,10.0,40.0,60.0),
                child: Container(
                    child: 
                      Container(
                          width: width,
                          child: (this.widget.payments.length==0?noPayments():paymentTable()))
                    ))));
  }
}
