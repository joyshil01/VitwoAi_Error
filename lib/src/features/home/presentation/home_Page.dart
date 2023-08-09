// ignore_for_file: camel_case_types, use_build_context_synchronously, file_names

import 'dart:convert';
import 'package:error/constans.dart';
import 'package:error/src/features/home/domain/assignModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../routing/app_router.dart';
import '../../../utils/api_urls.dart';
import '../../../utils/media-query.dart';
import '../../../widget/containerStyle.dart';
import 'package:http/http.dart' as http;
import 'assignDetails.dart';
import 'logoutController.dart';

class Home_Page extends ConsumerStatefulWidget {
  const Home_Page({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _Home_PageState();
}

class _Home_PageState extends ConsumerState<Home_Page> {
  final scrollController = ScrollController();
  var _isLoadingMore = false;
  var _page = 0;
  String assigned = 'assigned';
  var _isLoading = true;
  var comments = [];
  List<AssignModel> assignBugList = [];
  String? userName;
  String? userType;
  String? userImage;

  @override
  void initState() {
    scrollController.addListener(_scrollListener);
    _fetchAssignbug();
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

  Future<void> _fetchAssignbug() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var uri = Uri.parse(assignList);

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

      assignBugList = comments
          .map<AssignModel>(
            (item) => AssignModel(
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
          assignBugList = [];
        });
      }
      print('no data');
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue>(logoutVendorControllerProvider,
        (previousState, state) {
      if (!state.isLoading && state.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(state.error.toString()),
          backgroundColor: Colors.red,
        ));
      }
    });

    final state = ref.watch(logoutVendorControllerProvider);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        automaticallyImplyLeading: false,
        title: Text(
          'Assigned list',
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
                    leading: const Icon(Icons.logout_outlined),
                    title: Text('Log_out'.toUpperCase()),
                    onTap: () async {
                      final success = await ref
                          .read(logoutVendorControllerProvider.notifier)
                          .logoutVendor();
                      if (success) {
                        print('sucess---------------');
                        SharedPreferences sharedPrefs =
                            await SharedPreferences.getInstance();
                        sharedPrefs.clear().then((value) {
                          print(
                              'ROLEEEEEE: ${sharedPrefs.getString('userType')}');
                        });
                        context.goNamed(AppRoute.login.name);
                      }
                    },
                  ),
                ),
              );
            },
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
                  backgroundImage: NetworkImage(
                    userImage ?? '',
                  ),
                ),
                const SizedBox(width: 5),
              ],
            ),
          ),
        ],
      ),
      body: (_isLoading)
          ? const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.blueGrey,
              ),
            )
          : (assignBugList.isEmpty)
              ? const Center(
                  child: Text('No Assign Bug List'),
                )
              : ListView.builder(
                  controller: scrollController,
                  itemCount: (_isLoadingMore)
                      ? assignBugList.length + 1
                      : assignBugList.length,
                  itemBuilder: (context, index) {
                    if (index < assignBugList.length) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => AssignDetails(
                                  postigDate: assignBugList[index].postigDate,
                                  bugCode: assignBugList[index].bugCode,
                                  title: assignBugList[index].title,
                                  pageUrl: assignBugList[index].pageUrl,
                                  description: assignBugList[index].description,
                                  image: assignBugList[index].image,
                                  id: assignBugList[index].id,
                                  status: assignBugList[index].status,
                                  assignBugList: assignBugList,
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
                                            assignBugList[index]
                                                .status
                                                .toUpperCase(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                  color: Colors.blueGrey,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        assignBugList[index].postigDate,
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
                                    assignBugList[index].bugCode,
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
                                    assignBugList[index].description,
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
                  },
                ),
    );
  }

  Future<void> _scrollListener() async {
    if (_isLoadingMore) return;
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      setState(() {
        _isLoadingMore = true;
      });
      _page = _page + 1;
      await _fetchAssignbug();
      setState(() {
        _isLoadingMore = false;
      });
      print('call');
    } else {
      print('don\'t scrollllll');
    }
  }
}
