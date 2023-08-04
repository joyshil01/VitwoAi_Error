// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import '../../../../constans.dart';
import '../../../utils/media-query.dart';
import '../../../widget/containerStyle.dart';

class OpenDetails extends StatefulWidget {
  String postigDate;
  String title;
  String bugCode;
  String pageUrl;
  String description;
  String image;

  OpenDetails({
    required this.postigDate,
    required this.title,
    required this.bugCode,
    required this.pageUrl,
    required this.description,
    required this.image,
  });

  @override
  State<OpenDetails> createState() => _OpenDetailsState();
}

class _OpenDetailsState extends State<OpenDetails> {
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
                              onPressed: () {},
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