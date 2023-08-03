// ignore_for_file: file_names, use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:get/get.dart';
import '../../../../constans.dart';
// import '../../../routing/app_router.dart';
import '../../../utils/api_urls.dart';
import '../../../utils/media-query.dart';
import '../../../widget/containerStyle.dart';
import 'package:http/http.dart' as http;
import '../domain/openModel.dart';
import 'openDetails.dart';

class OpenScreen extends ConsumerStatefulWidget {
  const OpenScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OpenScreenState();
}

class _OpenScreenState extends ConsumerState<OpenScreen> {
  final scrollController = ScrollController();
  var _isLoadingMore = false;
  var _page = 0;
  var _isLoading = true;
  var comments = [];
  List<OpenModel> openbugList = [];
  var _scrolling = false;
  String? userName;
  String? userType;
  String? userImage;

  @override
  void initState() {
    scrollController.addListener(_scrollListener);
    _fetchOpenbug();
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

  Future<void> _fetchOpenbug() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var uri = Uri.parse(openList);

    var request = http.MultipartRequest('POST', uri);

    request.fields['pageNo'] = _page.toString();
    request.fields['limit'] = 6.toString();
    request.fields['status'] = 'open';

    request.headers.addAll(
        {'Authorization': 'Bearer ${sharedPreferences.getString('token')}'});
    var response = await request.send();

    if (response.statusCode == 200) {
      var response2 = await http.Response.fromStream(response);
      var responseDecoded = json.decode(response2.body);
      print({'responseeeeeeeeeeeee': responseDecoded});

      setState(() {
        comments = comments + responseDecoded['data']['data'];
        _isLoading = false;
      });

      openbugList = comments
          .map<OpenModel>(
            (item) => OpenModel(
              id: item['id'],
              bugCode: item['bug_code'],
              title: item['page_name'],
              description: item['bug_description'],
              image: item['image_url'],
              postigDate: item['created_at'],
              status: item['status'],
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
          openbugList = [];
        });
      }
      print('failure');
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
          'Open List',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).hintColor,
                fontSize: 20,
              ),
        ),
        actions: [
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  content: ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.logout_outlined),
                    title: const Text('Log_out'),
                  ),
                ),
              );
            },
            child: Container(
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(userName ?? 'Your name'),
                    ],
                  ),
                  const SizedBox(width: 4),
                  CircleAvatar(
                    radius: SizeVariables.getHeight(context) * 0.02,
                    // backgroundColor: Colors.yellow,
                    // backgroundImage: AssetImage(userImage! ?? ''),
                  ),
                  const SizedBox(width: 5),
                ],
              ),
            ),
          ),
        ],
      ),
      body: (_isLoading)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : (openbugList.isEmpty)
              ? const Center(
                  child: Text('No Open Bug List'),
                )
              : ListView.builder(
                  controller: scrollController,
                  itemCount: (_isLoadingMore)
                      ? openbugList.length + 1
                      : openbugList.length,
                  itemBuilder: (context, index) {
                    if (index < openbugList.length) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const OpenDetails(),
                              ),
                            );
                          },
                          child: ContainerStyle(
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 20,
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
                                            openbugList[index].status,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                  fontSize: 16,
                                                  color: Colors.redAccent,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            openbugList[index].postigDate,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: SizeVariables.getHeight(context) *
                                        0.004,
                                  ),
                                  Text(
                                    openbugList[index].bugCode,
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
                                    openbugList[index].description,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          fontSize: 16,
                                        ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  // Align(
                                  //   alignment: Alignment.bottomRight,
                                  //   child: InkWell(
                                  //     onTap: () {
                                  //       showDialog(
                                  //         context: context,
                                  //         builder: (BuildContext context) =>
                                  //             AlertDialog(
                                  //           content: Container(
                                  //             decoration: BoxDecoration(
                                  //               borderRadius:
                                  //                   BorderRadius.circular(20),
                                  //             ),
                                  //             width: double.infinity,
                                  //             height: 200,
                                  //           ),
                                  //         ),
                                  //       );
                                  //     },
                                  //     child: const Icon(
                                  //       Icons.assignment_ind_sharp,
                                  //       size: 30,
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
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
      await _fetchOpenbug();
      setState(() {
        _isLoadingMore = false;
      });
      print('call');
    } else {
      print('don\'t scrollllll');
    }
  }
}
