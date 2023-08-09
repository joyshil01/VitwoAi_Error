// ignore_for_file: camel_case_types, use_build_context_synchronously

import 'dart:convert';
import 'package:error/constans.dart';
import 'package:error/src/features/todo/domain/todoModel.dart';
import 'package:error/src/features/todo/presentation/todoDetails.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/api_urls.dart';
import '../../../utils/media-query.dart';
import '../../../widget/containerStyle.dart';
import 'package:http/http.dart' as http;

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final scrollController = ScrollController();
  var _isLoadingMore = false;
  var _page = 0;
  String assigned = 'todo';
  var _isLoading = true;
  var comments = [];
  List<TodoModel> todoBugList = [];
  var _scrolling = false;
  String? userName;
  String? userType;
  String? userImage;

  @override
  void initState() {
    scrollController.addListener(_scrollListener);
    _fetchTodobug();
    callSharedPrefs();
    super.initState();
  }

  void callSharedPrefs() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    setState(() {
      userName = sharedPreferences.getString('userName')!;
      userType = sharedPreferences.getString('userType')!;
      userImage = sharedPreferences.getString('userImage')!;
    });
  }

  Future<void> _fetchTodobug() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var uri = Uri.parse(todoList);

    var request = http.MultipartRequest('POST', uri);

    request.fields['pageNo'] = _page.toString();
    request.fields['limit'] = 8.toString();
    request.fields['status'] = assigned;
    print('Request Parameters: pageNo=$_page, limit=6, status=$assigned');

    String? token = sharedPreferences.getString('token');
    if (token != null) {
      request.headers.addAll({'Authorization': 'Bearer $token'});
    } else {
      print('Token is null');
    }

    var response = await request.send();

    if (response.statusCode == 200) {
      var response2 = await http.Response.fromStream(response);
      var responseDecoded = json.decode(response2.body);
      print({'responseeeeeeeeeeeee': responseDecoded});

      setState(() {
        comments = comments + responseDecoded['data'];
        _isLoading = false;
      });

      todoBugList = comments
          .map<TodoModel>(
            (item) => TodoModel(
              id: item['id'],
              bugCode: item['bug_code'],
              title: item['page_name'],
              description: item['bug_description'],
              image: item['image_url'] ?? '',
              postigDate: item['created_at'],
              status: item['status'],
              pageUrl: item['page_url'],
            ),
          )
          .toList();
    } else {
      if (_page > 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            elevation: 4,
            behavior: SnackBarBehavior.floating,
            content: Text(
              'Reached the end of the list',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        );
        return;
      } else {
        setState(() {
          _isLoading = false;
          comments = [];
          todoBugList = [];
        });
      }
      print('no data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        automaticallyImplyLeading: false,
        title: Text(
          'Todo list',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).hintColor,
                fontSize: 20,
              ),
        ),
      ),
      body: (_isLoading)
          ? const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.amber,
              ),
            )
          : (todoBugList.isEmpty)
              ? const Center(
                  child: Text('No Todo Bug List'),
                )
              : ListView.builder(
                  controller: scrollController,
                  itemCount: (_isLoadingMore)
                      ? todoBugList.length + 1
                      : todoBugList.length,
                  itemBuilder: (context, index) {
                    if (index < todoBugList.length) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => TodoDetails(
                                  postigDate: todoBugList[index].postigDate,
                                  title: todoBugList[index].title,
                                  bugCode: todoBugList[index].bugCode,
                                  pageUrl: todoBugList[index].pageUrl,
                                  description: todoBugList[index].description,
                                  image: todoBugList[index].image,
                                ),
                              ),
                            );
                          },
                          child: ContainerStyle(
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 22,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Status:  ',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                          ),
                                          Text(
                                            todoBugList[index]
                                                .status
                                                .toUpperCase(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                  color: Colors.amber,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        todoBugList[index].postigDate,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: SizeVariables.getHeight(context) *
                                        0.004,
                                  ),
                                  Text(
                                    todoBugList[index].bugCode,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                          fontSize: 16,
                                          color: titletextColor,
                                        ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(
                                    height: SizeVariables.getHeight(context) *
                                        0.006,
                                  ),
                                  Text(
                                    todoBugList[index].description,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          fontSize: 16,
                                        ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  }),
    );
  }

  Future<void> _scrollListener() async {
    if (_isLoadingMore) return;
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      _scrolling = true;
      setState(() {
        _isLoadingMore = true;
      });
      _page = _page + 1;
      await _fetchTodobug();
      setState(() {
        _isLoadingMore = false;
      });
      print('call');
    } else {
      print('don\'t scrollllll');
    }
  }
}
