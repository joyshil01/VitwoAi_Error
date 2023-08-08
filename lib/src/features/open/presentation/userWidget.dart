// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../../../utils/api_urls.dart';

class UserWidget extends StatefulWidget {
  const UserWidget({super.key});

  @override
  State<UserWidget> createState() => _UserWidgetState();
}

class _UserWidgetState extends State<UserWidget> {
  List<dynamic> administrators = [];
  dynamic selectedAdministrator;
  TextEditingController durationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchAdministrators();
  }

  Future<void> fetchAdministrators() async {
    var uri = Uri.parse(userList);
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print('dataaaaaaaaaaa:  ${data}');
      if (data['status'] == 'success') {
        setState(() {
          administrators = data['data'];
          selectedAdministrator = administrators[0];
        });
      }
    }
  }

  @override
  void dispose() {
    durationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Assigned task: 👉',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: DropdownButton<dynamic>(
                  value: selectedAdministrator,
                  underline: Container(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedAdministrator = newValue;
                    });
                  },
                  items: administrators
                      .map<DropdownMenuItem<dynamic>>((dynamic admin) {
                    return DropdownMenuItem<dynamic>(
                      value: admin,
                      child: Text(admin['fldAdminName']),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Task Duration(In Hr)',
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 15),
            ),
            const SizedBox(height: 2),
            TextField(
              controller: durationController,
              cursorColor: Colors.black,
              textInputAction: TextInputAction.next,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 16),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: const Icon(
                  Icons.watch_later_outlined,
                  color: Colors.black,
                ),
                hintText: 'Duration',
                hintStyle: Theme.of(context).textTheme.bodyMedium,
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 1.8,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  foregroundColor: Colors.black,
                  side: const BorderSide(color: Colors.black),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: Text(
                  'Submit'.toUpperCase(),
                ),
                onPressed: () {
                  if (durationController.text == null ||
                      durationController.text == '') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Enter your duration',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontSize: 16, color: Colors.white),
                        ),
                        elevation: 5,
                        backgroundColor: Colors.red.shade300,
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    );
                  } else {
                    String selectedAdminKey =
                        selectedAdministrator['fldAdminKey'];
                    String enteredDuration = durationController.text;

                    print('Selected Administrator Key: $selectedAdminKey');
                    print('Entered Duration: $enteredDuration');
                    Navigator.pop(context);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
