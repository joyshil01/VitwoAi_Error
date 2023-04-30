import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../utils/media-query.dart';
import 'CompleteBody_widget.dart';

class Complete_Screen extends StatefulWidget {
  @override
  State<Complete_Screen> createState() => _Complete_ScreenState();
}

class _Complete_ScreenState extends State<Complete_Screen> {
  DateTime? _dateTimeStart;
  DateFormat dateFormat = DateFormat('yyyy-MM-dd');
  @override
  void initState() {
    // TODO: implement initState

    setState(() {
      _dateTimeStart = DateTime.parse(
        dateFormat.format(
          DateTime.now(),
        ),
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        automaticallyImplyLeading: false,
        title: Text(
          'Complete List',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).hintColor,
                fontSize: 20,
              ),
        ),
        actions: [
          InkWell(
            onTap: () => showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2015),
                    lastDate: DateTime.now().add(const Duration(days: 365)))
                .then((value) {
              setState(() {
                _dateTimeStart = value;
              });
              print('DATE START: $_dateTimeStart');
            }),
            child: Container(
              height: SizeVariables.getHeight(context) * 0.03,
              padding: EdgeInsets.only(
                  left: SizeVariables.getWidth(context) * 0.02,
                  right: SizeVariables.getWidth(context) * 0.01),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                // color: mainColor,
              ),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _dateTimeStart == null
                            ? 'Select Date'
                            : '${dateFormat.format(DateTime.parse(_dateTimeStart.toString()))}',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context).hintColor,
                            ),
                      ),
                    ],
                  ),
                  SizedBox(width: SizeVariables.getWidth(context) * 0.015),
                ],
              ),
            ),
          ),
          SizedBox(
            width: SizeVariables.getWidth(context) * 0.012,
          ),
        ],
      ),
      body: CompleteBody(),
    );
  }
}
