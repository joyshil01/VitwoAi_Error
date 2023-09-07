// ignore_for_file: file_names, must_be_immutable, unnecessary_null_comparison, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  String createUser;

  OpenDetails({
    required this.postigDate,
    required this.title,
    required this.bugCode,
    required this.pageUrl,
    required this.description,
    required this.image,
    required this.id,
    required this.createUser,
  });

  @override
  State<OpenDetails> createState() => _OpenDetailsState();
}

class _OpenDetailsState extends State<OpenDetails> {
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Create: ',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(
                                widget.createUser,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ],
                          ),
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
                  child: SizedBox(
                    height: 200,
                    child: Image.network(
                      widget.image,
                      fit: BoxFit.cover,
                    ),
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
