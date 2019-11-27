import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartDemo extends StatefulWidget {
  ChartDemo({Key key}) : super(key: key);

  @override
  _ChartDemoState createState() => _ChartDemoState();
}

class _ChartDemoState extends State<ChartDemo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 460.0,
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        // Chart title
        title: ChartTitle(text: '年销售情况分析'),
        // Enable legend
        legend: Legend(isVisible: true),
        // Enable tooltip
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <ChartSeries<SalesData, String>>[
          // ?折线图 => LineSeries
          // ?柱状体 => ColumnSeries
          StackedAreaSeries<SalesData, String>(
            dataSource: <SalesData>[
              SalesData('1月', 35),
              SalesData('2月', 22),
              SalesData('3月', 34),
              SalesData('4月', 33),
              SalesData('5月', 40),
              SalesData('6月', 98),
              SalesData('7月', 70),
              SalesData('8月', 60),
              SalesData('9月', 40),
              SalesData('10月', 70),
              SalesData('11月', 90),
              SalesData('12月', 60),
            ],
            xValueMapper: (SalesData sales, _) => sales.year,
            yValueMapper: (SalesData sales, _) => sales.sales,
            // Enable data label
            dataLabelSettings: DataLabelSettings(isVisible: true),
          )
        ],
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
