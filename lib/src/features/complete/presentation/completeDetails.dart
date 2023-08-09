// ignore_for_file: file_names, must_be_immutable, use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import '../../../../constans.dart';
import '../../../utils/api_urls.dart';
import '../../../utils/media-query.dart';
import '../../../widget/containerStyle.dart';
import 'Complete_Screen.dart';

class CompleteDetails extends StatefulWidget {
  String postigDate;
  String title;
  String bugCode;
  String pageUrl;
  String description;
  String image;
  String id;
  String completedate;
  String startDate;

  CompleteDetails({
    super.key,
    required this.postigDate,
    required this.title,
    required this.bugCode,
    required this.pageUrl,
    required this.description,
    required this.image,
    required this.id,
    required this.completedate,
    required this.startDate,
  });

  @override
  State<CompleteDetails> createState() => _CompleteDetailsState();
}

const List<String> list = <String>['Solved', 'Todo', 'Assigned'];

class _CompleteDetailsState extends State<CompleteDetails> {
  void _openURL() async {
    if (await canLaunch(widget.pageUrl)) {
      await launch(widget.pageUrl, forceSafariVC: false, forceWebView: false);
    } else {
      throw 'Could not launch $widget.pageUrl';
    }
  }

  String dropdownValue = list.first;

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
            builder: (context) => const Complete_Screen(),
          ),
        );
      } else {
        print('nooo dataaaaaaaaaaaaaaaaaa');
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
          Padding(
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
                              Text(
                                'Create date:',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(
                                widget.postigDate,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: questionmarkColor,
                                      fontSize: 8,
                                    ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Start date:',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(
                                widget.startDate,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: Colors.amber,
                                      fontSize: 8,
                                    ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Complete date:',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(
                                widget.completedate,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: Colors.green,
                                      fontSize: 8,
                                    ),
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
                              onPressed: _openURL,
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
              ContainerStyle(
                child: Container(
                  height: 200,
                  child: PhotoView(
                    imageProvider: NetworkImage(
                      widget.image,
                      scale: 1,
                    ),
                    minScale: PhotoViewComputedScale.contained * 0.8,
                    maxScale: PhotoViewComputedScale.covered * 2,
                  ),
                ),
              ),
              ContainerStyle(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Text(
                    widget.description,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16,
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
