import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../constans.dart';
import '../../../../utils/media-query.dart';
import '../../../../widget/containerStyle.dart';

class NewAssignScreen extends ConsumerStatefulWidget {
  const NewAssignScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NewAssignScreenState();
}

class _NewAssignScreenState extends ConsumerState<NewAssignScreen> {
  List<String> team = ['Team', 'Salim', 'Ramen', 'Joy'];
  List<String> status = ['Task Status', 'To-Do', 'WIP', 'In Review', 'Done'];
  String selectedTeam = 'Team';
  String selectedStatus = 'Task Status';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        automaticallyImplyLeading: false,
        title: Text(
          'All-Task',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).hintColor,
                fontSize: 20,
              ),
        ),
        actions: [
          DropdownButton<String>(
            value: selectedTeam,
            dropdownColor: mainColor,
            underline: Container(),
            onChanged: (String? newValue) {
              setState(() {
                selectedTeam = newValue!;
              });
            },
            items: team.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.white),
                ),
              );
            }).toList(),
          ),
          DropdownButton<String>(
            value: selectedStatus,
            dropdownColor: mainColor,
            underline: Container(),
            onChanged: (String? newStatus) {
              setState(() {
                selectedStatus = newStatus!;
              });
            },
            items: status.map<DropdownMenuItem<String>>((String statuss) {
              return DropdownMenuItem<String>(
                value: statuss,
                child: Text(
                  statuss,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.white),
                ),
              );
            }).toList(),
          ),
        ],
      ),
      body: ListView.builder(
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Tkt No:  ',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Text(
                              'ER8365353673535',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: titletextColor,
                                  ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '2023-12-11',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeVariables.getHeight(context) * 0.008,
                    ),
                    Text.rich(
                      TextSpan(
                        text: 'Module:  ',
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: [
                          TextSpan(
                            text: 'SalesOrder Creation',
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
                      height: SizeVariables.getHeight(context) * 0.02,
                    ),
                    Container(
                      width: double.infinity,
                      height: SizeVariables.getHeight(context) * 0.0004,
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: SizeVariables.getHeight(context) * 0.008,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: SizeVariables.getHeight(context) * 0.26,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text.rich(
                                TextSpan(
                                  text: 'Status: ',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  children: [
                                    TextSpan(
                                      text: 'TO-DO.',
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
                              Text.rich(
                                TextSpan(
                                  text: 'Person Name: ',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  children: [
                                    TextSpan(
                                      text: 'Ramendranath Guria',
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
                            ],
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: mainColor,
                          radius: 40,
                          child: Text(
                            'Assigned',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Colors.white,
                                ),
                            maxLines: 2,
                          ),
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
