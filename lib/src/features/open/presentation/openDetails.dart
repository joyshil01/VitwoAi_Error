// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../constans.dart';
import '../../../utils/media-query.dart';
import '../../../widget/containerStyle.dart';
import 'userWidget.dart';

class OpenDetails extends StatefulWidget {
  String postigDate;
  String title;
  String bugCode;
  String pageUrl;
  String description;
  String image;
  String id;

  OpenDetails({
    required this.postigDate,
    required this.title,
    required this.bugCode,
    required this.pageUrl,
    required this.description,
    required this.image,
    required this.id,
  });

  @override
  State<OpenDetails> createState() => _OpenDetailsState();
}

class _OpenDetailsState extends State<OpenDetails> {
  void _openURL() async {
    if (await canLaunch(widget.pageUrl)) {
      await launch(widget.pageUrl, forceSafariVC: false, forceWebView: false);
    } else {
      throw 'Could not launch $widget.pageUrl';
    }
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      floatingActionButton: role == true
          ? Container()
          : FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  builder: (context) => UserWidget(
                    bugCode: widget.bugCode,
                    id: widget.id,
                  ),
                );
              },
              child: const Icon(
                Icons.person_2_outlined,
                size: 30,
              ),
            ),
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
                        children: [
                          Row(
                            children: [
                              Text(
                                widget.postigDate,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: questionmarkColor,
                                      fontSize: 12,
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
