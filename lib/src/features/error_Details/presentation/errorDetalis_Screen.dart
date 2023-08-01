import 'package:error/src/utils/media-query.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constans.dart';
import 'detailsBody_widget.dart';

class ErrorDetails_Screen extends StatefulWidget {
  @override
  State<ErrorDetails_Screen> createState() => _ErrorDetails_ScreenState();
}

class _ErrorDetails_ScreenState extends State<ErrorDetails_Screen> {
  bool light1 = false;
  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      // Thumb icon when the switch is selected.
      if (states.contains(MaterialState.selected)) {
        return const Icon(
          Icons.check,
          color: Colors.white,
        );
      }
      return const Icon(Icons.close, color: Colors.red);
    },
  );
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
                Get.back();
              },
              child: Container(
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
            ),
            SizedBox(
              width: SizeVariables.getWidth(context) * 0.16,
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
      body: DetailsBody(),
    );
  }
}
