import 'package:flutter/material.dart';
import '../../../../constans.dart';
import '../../../utils/media-query.dart';
import '../../../widget/containerStyle.dart';

class CloseWidget extends StatelessWidget {
  const CloseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                      children: [
                        Text(
                          'Tkt No:  ',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          'ER8365353673535',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: titletextColor,
                                  ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeVariables.getHeight(context) * 0.008,
                    ),
                    Text.rich(
                      TextSpan(
                        text: 'Company Name: ',
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: [
                          TextSpan(
                            text: 'FLIPKART INDIA PRIVATE LIMITED',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeVariables.getHeight(context) * 0.008,
                    ),
                    Row(
                      children: [
                        Text(
                          'Status:  ',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          'close'.toUpperCase(),
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: titletextColor,
                                  ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
