import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import '../../../../constans.dart';
import '../../../routing/app_router.dart';
import '../../../utils/media-query.dart';
import '../../../widget/containerStyle.dart';

class OpenScreen extends ConsumerStatefulWidget {
  const OpenScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OpenScreenState();
}

class _OpenScreenState extends ConsumerState<OpenScreen> {
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
      ),
      body: ListView.builder(
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
                        Text(
                          'Vitwo ai',
                          style: Theme.of(context).textTheme.bodyMedium,
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
                    Text(
                      'Dashboard ui dropdown popup fixed ',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 18,
                            color: titletextColor,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: SizeVariables.getHeight(context) * 0.006,
                    ),
                    Text(
                      'I have created a custom dropdown on a page which have a dropdown button, an overlay entry containing dropdown items. Now I want to change the other part of page excluding drop down button to change according to dropdown item clicked. e.g. If I click on Dashboard Item then overlay entry should be closed and Dashboard() widget should be displayed below dropdown button, if I click Orders, Orders() widget should be displayed.',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 16,
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              content: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                width: double.infinity,
                                height: 200,
                              ),
                            ),
                          );
                        },
                        child: const Icon(
                          Icons.assignment_ind_sharp,
                          size: 30,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
