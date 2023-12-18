import 'package:error/constans.dart';
import 'package:flutter/material.dart';

class UnAssignDetails extends StatefulWidget {
  const UnAssignDetails({super.key});

  @override
  State<UnAssignDetails> createState() => _UnAssignDetailsState();
}

List<String> list = <String>['Joy Shil', 'Mamoon', 'Sidharto'];
List<String> reviewList = <String>["Soni", "Romendra", "Pritom"];

class _UnAssignDetailsState extends State<UnAssignDetails> {
  String devloperValue = list.first;
  String reviewValue = reviewList.first;

  @override
  Widget build(BuildContext context) {
    TextEditingController _timerController = TextEditingController();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              //isScrollControlled: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              context: context,
              builder: (context) {
                return StatefulBuilder(builder: ((context, setState) {
                  return Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: SizedBox(
                      height: 330,
                      child: ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 20),
                            child: Text(
                              "Assign To: ",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            child: Row(
                              children: [
                                Text(
                                  "Devaloper: ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(fontSize: 16),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: DropdownButton(
                                    value: devloperValue,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        devloperValue = newValue!;
                                      });
                                    },
                                    items: list.map<DropdownMenuItem<String>>(
                                        (String newValue) {
                                      return DropdownMenuItem(
                                        value: newValue,
                                        child: Text(
                                          newValue,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                Text(
                                  "Review: ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(fontSize: 16),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: DropdownButton(
                                    value: reviewValue,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        reviewValue = newValue!;
                                      });
                                    },
                                    items: reviewList
                                        .map<DropdownMenuItem<String>>(
                                            (String newValue) {
                                      return DropdownMenuItem(
                                        value: newValue,
                                        child: Text(
                                          newValue,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                Text(
                                  "Task Duration(hr): ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(fontSize: 16),
                                ),
                                Container(
                                  width: 210,
                                  child: TextField(
                                    cursorColor: Colors.black,
                                    controller: _timerController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black))),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 70,
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      backgroundColor: mainColor),
                                  onPressed: () {
                                    if (_timerController.text == '') {
                                      print("enter Element");
                                    } else {
                                      Navigator.pop(context);
                                    }
                                  },
                                  child: Text("Submit")),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }));
              });
        },
        child: Icon(Icons.person),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          "Task Details",
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.white,
                fontSize: 18,
              ),
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(TextSpan(
                          text: "Txt No: ",
                          style: Theme.of(context).textTheme.bodyMedium,
                          children: [
                            TextSpan(
                                text: "ER8365353673535",
                                style: Theme.of(context).textTheme.bodySmall)
                          ])),
                      Text("2023-12-11")
                    ],
                  ),
                  SizedBox(height: 3),
                  Text.rich(TextSpan(
                      text: "Module: ",
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: [
                        TextSpan(
                            text: "SalesOrder Creation",
                            style: Theme.of(context).textTheme.bodySmall)
                      ])),
                  SizedBox(height: 3),
                  Text.rich(TextSpan(
                      text: "Company Name: ",
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: [
                        TextSpan(
                            text: "FLIPKART PROVITED LIMITED",
                            style: Theme.of(context).textTheme.bodySmall)
                      ])),
                  SizedBox(height: 3),
                  Text.rich(TextSpan(
                      text: "Comapny Persion: ",
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: [
                        TextSpan(
                            text: "SAM",
                            style: Theme.of(context).textTheme.bodySmall)
                      ])),
                  SizedBox(height: 3),
                  Text.rich(TextSpan(
                      text: "URL: ",
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: [
                        TextSpan(
                            text:
                                "https://vitwo.finance/about vaghcvakdvcadvucvadkcvuavdgvadgvaudvcudavcavdcvdjgagdvsv djgajhadv gjadj vgjsjjs",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: Colors.blue))
                      ])),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Image.network("https://vitwo.finance/assets/images/img-9.webp"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Task Description: ",
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontSize: 20,
                                  )),
                      IconButton(onPressed: () {}, icon: Icon(Icons.copy))
                    ],
                  ),
                  Text(
                      "vsusvhcvsjsj b j hhvchdbhc jd  cdsbvdsajch dasjc sadjvm aagdfasdjagdjgjjchajcfadvjcajdcvjav")
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
