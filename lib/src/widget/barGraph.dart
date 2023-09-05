import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarGraph extends StatefulWidget {
  const BarGraph({super.key});

  @override
  State<BarGraph> createState() => _BarGraphState();
}

class _BarGraphState extends State<BarGraph> {
  List<_ChartData>? chartData;

  TooltipBehavior? _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true, canShowMarker: true);
    chartData = <_ChartData>[
      _ChartData(
        'Joy',
        30,
        70,
      ),
      _ChartData(
        'Ramen',
        20,
        80,
      ),
      _ChartData(
        'tfg',
        2,
        98,
      ),
      _ChartData(
        'Srijan',
        10,
        90,
      ),
      _ChartData(
        'ABC',
        15,
        85,
      ),
      _ChartData(
        'Test',
        25,
        75,
      ),
      _ChartData(
        'EFG',
        5,
        95,
      ),
      _ChartData(
        'test 1',
        10,
        90,
      ),
    ];
    super.initState();
  }

  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(
        text: 'Team Task',
        textStyle: Theme.of(context).textTheme.titleLarge,
        alignment: ChartAlignment.near,
      ),
      legend:
          Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
      primaryXAxis: CategoryAxis(
        majorGridLines: const MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
          rangePadding: ChartRangePadding.none,
          axisLine: const AxisLine(width: 0),
          majorTickLines: const MajorTickLines(size: 0)),
      series: _getStackedColumnSeries(),
      tooltipBehavior: _tooltipBehavior,
    );
  }

  List<ChartSeries<_ChartData, String>> _getStackedColumnSeries() {
    return <ChartSeries<_ChartData, String>>[
      
      StackedColumn100Series<_ChartData, String>(
        dataSource: chartData!,
        dataLabelSettings: const DataLabelSettings(
          isVisible: false,
        ),
        xValueMapper: (_ChartData sales, _) => sales.x,
        color: Colors.amberAccent,
        yValueMapper: (_ChartData sales, _) => sales.y1,
        name: 'Remaning',
      ),
      StackedColumn100Series<_ChartData, String>(
        dataSource: chartData!,
        dataLabelSettings: const DataLabelSettings(isVisible: false),
        xValueMapper: (_ChartData sales, _) => sales.x,
        color: Colors.greenAccent,
        yValueMapper: (_ChartData sales, _) => sales.y2,
        name: 'Done',
      ),
    ];
  }

  @override
  void dispose() {
    chartData!.clear();
    super.dispose();
  }
}

class _ChartData {
  _ChartData(
    this.x,
    this.y1,
    this.y2,
  );
  final String x;
  final num y1;
  final num y2;
}
