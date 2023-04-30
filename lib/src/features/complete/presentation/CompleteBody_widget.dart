import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constans.dart';
import '../../../common_Widget/containerStyle.dart';
import '../../../routing/app_router.dart';
import '../../../utils/media-query.dart';

class CompleteBody extends StatefulWidget {
  const CompleteBody({super.key});

  @override
  State<CompleteBody> createState() => _CompleteBodyState();
}

class _CompleteBodyState extends State<CompleteBody> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            Get.toNamed(RoutesClass.getErordetailsRoute());
          },
          child: ContainerStyle(
            child: Container(
              margin: EdgeInsets.only(
                left: SizeVariables.getWidth(context) * 0.03,
                right: SizeVariables.getWidth(context) * 0.03,
                top: SizeVariables.getHeight(context) * 0.01,
                bottom: SizeVariables.getHeight(context) * 0.015,
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
                          style:
                              Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.done_all_outlined,
                            size: 20,
                            color: completemarkColor,
                          ),
                          SizedBox(
                            width: SizeVariables.getWidth(context) * 0.01,
                          ),
                          Text(
                            'Apr-28-2023',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          SizedBox(
                            width: SizeVariables.getWidth(context) * 0.01,
                          ),
                          Text(
                            '[17:32]',
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