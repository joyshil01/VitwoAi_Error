// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constans.dart';
import '../utils/api_urls.dart';
import 'package:http/http.dart' as http;

class PieChartSample2 extends ConsumerStatefulWidget {
  const PieChartSample2({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PieChartSample2State();
}

class _PieChartSample2State extends ConsumerState<PieChartSample2> {
  String? userName;
  String? userType;
  String? userImage;
  dynamic data;
  var _isLoading = true;

  String pieChartData = '';

  void callSharedPrefs() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    setState(() {
      userName = sharedPreferences.getString('userName')!;
      userType = sharedPreferences.getString('userType')!;
      userImage = sharedPreferences.getString('userImage')!;
    });
  }

  bool role = false;

  void userRole() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    setState(() {
      role = localStorage.getString('userType') == 'Approver'
          ? true
          : localStorage.getString('userType') == 'Viewer'
              ? true
              : false;
    });
  }

  @override
  void initState() {
    callSharedPrefs();
    userRole();
    _fetchPieDetails();
    super.initState();
  }

  Future<List<String>> _fetchPieDetails() async {
    var uri = Uri.parse(pieChart);

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? tokenUser = sharedPreferences.getString('token');

    var headersUser = {
      'Authorization': 'Bearer $tokenUser',
    };

    var response = await http.get(uri, headers: headersUser);

    if (response.statusCode == 200) {
      print('success');
      data = json.decode(response.body);

      print('pieee dataaaaaaaaaaa:  ${data}');
      setState(() {
        _isLoading = false;
      });
      return [];
    } else {
      print('failure');
      throw Exception('Could not fetch Pie data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return role == true
        ? _isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.black,
                ),
              )
            : PieChart(
                PieChartData(
                  borderData: FlBorderData(show: false),
                  startDegreeOffset: 140,
                  sectionsSpace: 1,
                  centerSpaceRadius: 50,
                  sections: [
                    PieChartSectionData(
                      color: Colors.redAccent.shade100,
                      showTitle: true,
                      title: data['data']['value']['open'].toString(),
                      titleStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.white),
                      value: double.parse(
                          data['data']['persentage']['open'].toString()),
                    ),
                    PieChartSectionData(
                      color: Colors.green,
                      showTitle: true,
                      title: data['data']['value']['solved'].toString(),
                      titleStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.white),
                      value: double.parse(
                          data['data']['persentage']['solved'].toString()),
                    ),
                    PieChartSectionData(
                      color: Colors.amber,
                      showTitle: true,
                      title: data['data']['value']['todo'].toString(),
                      titleStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.white),
                      value: double.parse(
                          data['data']['persentage']['todo'].toString()),
                    ),
                    PieChartSectionData(
                      color: mainColor,
                      showTitle: true,
                      title: data['data']['value']['assigned'].toString(),
                      titleStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.white),
                      value: double.parse(
                          data['data']['persentage']['assigned'].toString()),
                    ),
                  ],
                ),
              )
        : _isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.black,
                ),
              )
            : PieChart(
                PieChartData(
                  borderData: FlBorderData(show: false),
                  startDegreeOffset: 190,
                  sectionsSpace: 1,
                  centerSpaceRadius: 50,
                  sections: [
                    PieChartSectionData(
                      color: mainColor,
                      showTitle: true,
                      title: data['data']['value']['assigned'].toString(),
                      titleStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.white),
                      value: double.parse(
                          data['data']['persentage']['assigned'].toString()),
                    ),
                    PieChartSectionData(
                      color: Colors.green,
                      showTitle: true,
                      title: data['data']['value']['solved'].toString(),
                      titleStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.white),
                      value: double.parse(
                          data['data']['persentage']['solved'].toString()),
                    ),
                    PieChartSectionData(
                      color: Colors.amber,
                      showTitle: true,
                      title: data['data']['value']['todo'].toString(),
                      titleStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.white),
                      value: double.parse(
                          data['data']['persentage']['todo'].toString()),
                    ),
                  ],
                ),
              );
  }
}
