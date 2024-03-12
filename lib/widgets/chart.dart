import 'package:flutter/material.dart';
import 'package:managment/data/utlity.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
class Chart extends StatefulWidget {
  final int indexx;

  const Chart({Key? key, required this.indexx}) : super(key: key);

  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  List<Chartdata>? a;
  bool b = true;
  bool j = true;

  @override
  Widget build(BuildContext context) {
    switch (widget.indexx) {
      case 0:
        a = today().map((addData) => Chartdata(
          categories: addData.name,
          amount: double.parse(addData.amount), // Assuming amount is a String
        )).toList();
        b = true;
        j = true;
        break;
      case 1:
        a = week().map((addData) => Chartdata(
          categories: addData.name,
          amount: double.parse(addData.amount),
        )).toList();
        b = false;
        j = true;
        break;
      case 2:
        a = month().map((addData) => Chartdata(
          categories: addData.name,
          amount: double.parse(addData.amount),
        )).toList();
        b = false;
        j = true;
        break;
      case 3:
        a = year().map((addData) => Chartdata(
          categories: addData.name,
          amount: double.parse(addData.amount),
        )).toList();
        j = false;
        break;
      default:
    }

   return Container(
  width: double.infinity,
  height: 300,
  child: SfCircularChart(
    legend: Legend(isVisible: true, position: LegendPosition.left),
    series: <PieSeries<Chartdata, String>>[
      PieSeries<Chartdata, String>(
        dataSource: a ?? [],
        xValueMapper: (Chartdata data, _) => data.categories,
        yValueMapper: (Chartdata data, _) => data.amount,
        dataLabelSettings: DataLabelSettings(
          isVisible: true,
        ),
      ),
    ],
  ),
);
  }
}



class Chartdata {
  final String categories;
  final double amount;

  Chartdata({
    required this.categories,
    required this.amount,
  });
}