// ignore_for_file: file_names, must_be_immutable, use_key_in_widget_constructors, use_build_context_synchronously, deprecated_member_use, unnecessary_null_comparison

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../constans.dart';
import '../../../utils/api_urls.dart';
import '../../../utils/media-query.dart';
import '../../../widget/containerStyle.dart';
import '../../../widget/navBottom.dart';
import 'package:http/http.dart' as http;

class TodoDetails extends StatefulWidget {
  String postigDate;
  String title;
  String bugCode;
  String pageUrl;
  String description;
  String image;
  String id;
  String status;
  String createUser;
  String todoName;

  TodoDetails({
    required this.postigDate,
    required this.title,
    required this.bugCode,
    required this.pageUrl,
    required this.description,
    required this.image,
    required this.id,
    required this.status,
    required this.createUser,
    required this.todoName,
  });

  @override
  State<TodoDetails> createState() => _TodoDetailsState();
}

const List<String> list = <String>['Todo', 'Assigned', 'Solved'];

class _TodoDetailsState extends State<TodoDetails> {
  String dropdownValue = list.first;
  String selectValue = '';
  bool role = false;

  @override
  void initState() {
    userRole();
    super.initState();
  }

  void userRole() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    setState(() {
      role = localStorage.getString('userType') == 'Viewer' ? true : false;
    });
  }

  Future<void> updateStatus(String bugId, String statusSlug) async {
    print('Arguments: id: ${bugId} Status: ${statusSlug}');

    var endpoints =
        'bugstatusupdate&bug_id=${int.parse(bugId)}&statusSlug=$statusSlug';

    print('URL: $statusUpdate$endpoints');

    var uri = Uri.parse('$statusUpdate$endpoints');

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? tokenUser = sharedPreferences.getString('token');

    var headersUser = {
      'Authorization': 'Bearer $tokenUser',
      'Content-Type': 'application/json'
    };

    var response = await http.get(uri, headers: headersUser);

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = json.decode(response.body);
      if (responseData['status'] == 'success') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Successfully updated',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 16, color: Colors.white),
            ),
            elevation: 5,
            backgroundColor: Colors.green.shade200,
            duration: const Duration(milliseconds: 1500),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MainPage(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Task not updated',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 16, color: Colors.white),
            ),
            elevation: 5,
            backgroundColor: Colors.red.shade200,
            duration: const Duration(milliseconds: 1500),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: backiconColor,
                    size: 18,
                  ),
                  Text(
                    'Back',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).hintColor,
                          fontSize: 16,
                        ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: SizeVariables.getWidth(context) * 0.1,
            ),
            Text(
              'Error Detalis',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).hintColor,
                    fontSize: 20,
                  ),
            ),
          ],
        ),
        actions: [
          role == true
              ? Padding(
                  padding: const EdgeInsets.only(right: 12, top: 16),
                  child: Text(
                    'Todo',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: DropdownButton<String>(
                    dropdownColor: Colors.blueGrey,
                    value: dropdownValue,
                    icon: const Icon(
                      Icons.arrow_downward,
                      color: Colors.white,
                      size: 16,
                    ),
                    elevation: 16,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white),
                    underline: Container(),
                    onChanged: (String? value) async {
                      setState(() {
                        dropdownValue = value!;
                        print('Statusssssssssssssssss:    $value');
                        updateStatus(widget.id, value.toLowerCase());
                      });
                    },
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ContainerStyle(
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Created: ',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  Text(
                                    widget.createUser,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          fontWeight: FontWeight.w700,
                                        ),
                                  )
                                ],
                              ),
                              Text(
                                widget.postigDate,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: Colors.redAccent.shade100,
                                    ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Status:  ',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  Text(
                                    widget.status.toUpperCase(),
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
                                widget.todoName,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: SizeVariables.getHeight(context) * 0.012,
                      ),
                      Text(
                        widget.bugCode,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: titletextColor,
                              fontSize: 16,
                            ),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(
                        height: SizeVariables.getHeight(context) * 0.012,
                      ),
                      Text.rich(
                        TextSpan(
                          text: 'Page name: ',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: titletextColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                          children: [
                            TextSpan(
                              text: widget.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: titletextColor,
                                      fontSize: 14,
                                      fontStyle: FontStyle.italic),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: SizeVariables.getHeight(context) * 0.005,
                      ),
                      Row(
                        children: [
                          Text(
                            'URL: ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: titletextColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                          ),
                          Expanded(
                            child: TextButton(
                              onPressed: () async {
                                if (widget.pageUrl != null) {
                                  await launch(widget.pageUrl);
                                }
                              },
                              onLongPress: () {
                                Clipboard.setData(
                                    ClipboardData(text: widget.pageUrl));
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    duration: Duration(milliseconds: 300),
                                    content: Text('Link Copied'),
                                  ),
                                );
                              },
                              child: Text(
                                widget.pageUrl,
                                overflow: TextOverflow.fade,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      insetPadding: const EdgeInsets.all(10),
                      child: Container(
                        width: double.infinity,
                        height: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                        child: InteractiveViewer(
                          maxScale: 10,
                          child: Image.network(
                            widget.image,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                child: ContainerStyle(
                  child: Image.network(
                    widget.image,
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ContainerStyle(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Task Description:',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                            InkWell(
                              onTap: () {
                                Clipboard.setData(
                                  ClipboardData(text: widget.description),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    duration: Duration(milliseconds: 300),
                                    content: Text('Copied description'),
                                  ),
                                );
                              },
                              child: Icon(Icons.copy),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Text(
                          widget.description,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 14,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
