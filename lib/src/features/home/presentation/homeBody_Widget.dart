// ignore_for_file: camel_case_types

import 'package:error/src/utils/media-query.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constans.dart';
import '../../../widget/containerStyle.dart';
import '../../../routing/app_router.dart';

class homeBody extends StatefulWidget {
  const homeBody({super.key});

  @override
  State<homeBody> createState() => _homeBodyState();
}

class _homeBodyState extends State<homeBody> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        child: GestureDetector(
          onTap: () {
            Get.toNamed(RoutesClass.getErordetailsRoute());
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          'Vitwo ai',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.question_mark,
                            size: 20,
                            color: questionmarkColor,
                          ),
                          Text(
                            'May-02-2023',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          SizedBox(
                            width: SizeVariables.getWidth(context) * 0.01,
                          ),
                          Text(
                            '[14:32]',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeVariables.getHeight(context) * 0.004,
                  ),
                  Container(
                    child: Text(
                      'Dashboard ui dropdown popup fixed ',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 18,
                            color: titletextColor,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: SizeVariables.getHeight(context) * 0.006,
                  ),
                  Container(
                    // width: SizeVariables.getWidth(context) * 0.6,
                    child: Text(
                      'I have created a custom dropdown on a page which have a dropdown button, an overlay entry containing dropdown items. Now I want to change the other part of page excluding drop down button to change according to dropdown item clicked. e.g. If I click on Dashboard Item then overlay entry should be closed and Dashboard() widget should be displayed below dropdown button, if I click Orders, Orders() widget should be displayed.',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 16,
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
