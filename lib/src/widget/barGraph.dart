import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../features/dashBoard/domain/barGraphModel.dart';
import '../utils/api_urls.dart';
import 'package:http/http.dart' as http;

class BarGraph extends StatefulWidget {
  const BarGraph({super.key});

  @override
  State<BarGraph> createState() => _BarGraphState();
}

class _BarGraphState extends State<BarGraph> {
  TooltipBehavior? _tooltipBehavior;
  var _isLoading = true;
  var comments = [];
  List<ChartData> barGraphData = [];

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true, canShowMarker: true);
    _fetchBarGraphDetails();
    super.initState();
  }

  Future<void> _fetchBarGraphDetails() async {
    var uri = Uri.parse(barGraph);

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? tokenUser = sharedPreferences.getString('token');

    var headersUser = {
      'Authorization': 'Bearer $tokenUser',
    };

    var response = await http.get(uri, headers: headersUser);

    if (response.statusCode == 200) {
      var responseDecoded = json.decode(response.body);
      print({'responseeeeeeeeeeeee': responseDecoded});

      setState(() {
        comments = comments + responseDecoded['data'];
        _isLoading = false;
      });

      barGraphData = comments
          .map<ChartData>(
            (item) => ChartData(
              name: item['fldAdminName'],
              todoP: num.parse(item['todo_assign_percentage']),
              doneP: num.parse(item['solved_percentage']),
              todoCount: item['total_todo_assign'],
              doneCount: item['total_solved'],
            ),
          )
          .toList();
    } else {
      setState(() {
        _isLoading = false;
        comments = [];
        barGraphData = [];
      });
      print('failure');
      throw Exception('Could not fetch Pie data');
    }
  }

  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.black,
            ),
          )
        : SfCartesianChart(
            plotAreaBorderWidth: 0,
            title: ChartTitle(
              text: 'Team Task',
              textStyle: Theme.of(context).textTheme.titleLarge,
              alignment: ChartAlignment.near,
            ),
            legend: Legend(
                isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
            primaryXAxis: CategoryAxis(
              majorGridLines: const MajorGridLines(width: 0),
              labelRotation: 60,
            ),
            primaryYAxis: NumericAxis(
                rangePadding: ChartRangePadding.none,
                axisLine: const AxisLine(width: 0),
                majorTickLines: const MajorTickLines(size: 0)),
            series: _getStackedColumnSeries(),
            tooltipBehavior: _tooltipBehavior,
          );
  }

  List<ChartSeries<ChartData, String>> _getStackedColumnSeries() {
    return <ChartSeries<ChartData, String>>[
      StackedColumn100Series<ChartData, String>(
        dataSource: barGraphData,
        dataLabelSettings: const DataLabelSettings(
          isVisible: true,
        ),
        xValueMapper: (ChartData sales, _) => sales.name.split(' ')[0],
        dataLabelMapper: (ChartData sales, _) => sales.todoCount,
        color: Colors.amber,
        yValueMapper: (ChartData sales, _) => sales.todoP,
        name: 'Remaning',
      ),
      StackedColumn100Series<ChartData, String>(
        dataSource: barGraphData,
        dataLabelSettings: const DataLabelSettings(isVisible: true),
        xValueMapper: (ChartData sales, _) => sales.name.split(' ')[0],
        dataLabelMapper: (ChartData sales, _) => sales.doneCount,
        color: Colors.green,
        yValueMapper: (ChartData sales, _) => sales.doneP,
        name: 'Done',
      ),
    ];
  }

  @override
  void dispose() {
    super.dispose();
  }
}
