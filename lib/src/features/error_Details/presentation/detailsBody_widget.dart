import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constans.dart';
import '../../../widget/containerStyle.dart';
import '../../../utils/media-query.dart';
import 'package:flutter/services.dart';

class DetailsBody extends StatefulWidget {
  @override
  State<DetailsBody> createState() => _DetailsBodyState();
}

class _DetailsBodyState extends State<DetailsBody> {
  TextEditingController copyController = new TextEditingController();
  final copytext =
      'The following assertion was thrown during performLayout(): The following assertion was thrown during performLayout(): An InputDecorator, which is typically created by a TextField, cannot have an unbounded width.This happens when the parent widget does not provide a finite width constraint. The following assertion was thrown during performLayout(): An InputDecorator, which is typically created by a TextField, cannot have an unbounded width.This happens when the parent widget does not provide a finite width constraint. The following assertion was thrown during performLayout(): An InputDecorator, which is typically created by a TextField, cannot have an unbounded width.This happens when the parent widget does not provide a finite width constraint.The following assertion was thrown during performLayout(): An InputDecorator, which is typically created by a TextField, cannot have an unbounded width.This happens when the parent widget does not provide a finite width constraint.The following assertion was thrown during performLayout(): An InputDecorator, which is typically created by a TextField, cannot have an unbounded width.This happens when the parent widget does not provide a finite width constraint. The following assertion was thrown during performLayout(): An InputDecorator, which is typically created by a TextField, cannot have an unbounded width.This happens when the parent widget does not provide a finite width constraint. The following assertion was thrown during performLayout(): An InputDecorator, which is typically created by a TextField, cannot have an unbounded width.This happens when the parent widget does not provide a finite width constraint. An InputDecorator, which is typically created by a TextField, cannot have an unbounded width.This happens when the parent widget does not provide a finite width constraint. For example, if the InputDecorator is contained by a `Row`, then its width must be constrained. An `Expanded` widget or a SizedBox can be used to constrain the width of the InputDecorator or the TextField that contains it.(Additional lines of this message omitted)';
  void setClipboardData(String text) {
    Clipboard.setData(ClipboardData(text: text));
  }

  int activeStep = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 74),
            child: EasyStepper(
              activeStep: activeStep,
              lineLength: 100,
              lineSpace: 0,
              lineType: LineType.dotted,
              defaultLineColor: Colors.white,
              finishedLineColor: Colors.black,
              activeStepTextColor: Colors.black,
              finishedStepTextColor: Colors.black87,
              internalPadding: 0,
              showLoadingAnimation: false,
              stepRadius: 10,
              showStepBorder: false,
              lineDotRadius: 1,
              steps: [
                EasyStep(
                  customStep: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor:
                          activeStep >= 0 ? Colors.grey : Colors.white,
                    ),
                  ),
                  title: 'Waiting',
                ),
                EasyStep(
                  customStep: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor:
                          activeStep >= 1 ? Colors.orange : Colors.white,
                    ),
                  ),
                  title: 'WIP',
                ),
                EasyStep(
                  customStep: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor:
                          activeStep >= 2 ? Colors.green : Colors.white,
                    ),
                  ),
                  title: 'Done',
                ),
              ],
              onStepReached: (index) => setState(() => activeStep = index),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
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
                        Row(
                          children: [
                            Text(
                              'May-02-2023',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: questionmarkColor,
                                    fontSize: 12,
                                  ),
                            ),
                            SizedBox(
                              width: SizeVariables.getWidth(context) * 0.01,
                            ),
                            Text(
                              '[14:32]',
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
                        Row(
                          children: [
                            Text(
                              'May-10-2023',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: completemarkColor,
                                    fontSize: 12,
                                  ),
                            ),
                            SizedBox(
                              width: SizeVariables.getWidth(context) * 0.01,
                            ),
                            Text(
                              '[17:32]',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: completemarkColor,
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
                      'RenderFlex overflow is one of the most frequently encountered Flutter framework errors, and you probably have run into it already.',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: titletextColor,
                            fontSize: 16,
                          ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: SizeVariables.getHeight(context) * 0.005,
                    ),
                    Text(
                      'This error occurs, for example, when a Row contains a TextFormField or a TextField but the latter has no width constraint.',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: titletextColor,
                            fontSize: 14,
                          ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ContainerCopyStyle(
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
                        Text(
                          'Error log',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontSize: 18,
                                  ),
                        ),
                        InkWell(
                          onTap: () {
                            // final value = ClipboardData(text: copytext);
                            Clipboard.getData(
                              ClipboardData(text: copytext).toString(),
                            );
                          },
                          child: const Icon(
                            Icons.copy,
                            color: copyiconColor,
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeVariables.getHeight(context) * 0.01,
                    ),
                    SelectableText(
                      copytext,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: questionmarkColor,
                            fontSize: 14,
                          ),
                      textAlign: TextAlign.justify,
                      showCursor: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
