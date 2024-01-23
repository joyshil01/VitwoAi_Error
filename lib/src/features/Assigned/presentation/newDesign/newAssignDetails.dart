import 'package:flutter/material.dart';

class NewAssignDetails extends StatefulWidget {
  const NewAssignDetails({super.key});

  @override
  State<NewAssignDetails> createState() => _NewAssignDetailsState();
}

List<String> list = <String>['Assigned', 'To-do', 'Done'];

class _NewAssignDetailsState extends State<NewAssignDetails> {
  String valueText = list.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text("Task Details"),
        actions: [
          Container(
            child: DropdownButton(
              dropdownColor: Colors.blue[900],
              value: valueText,
              onChanged: (String? newValue) {
                setState(() {
                  valueText = newValue!;
                });
              },
              items: list.map<DropdownMenuItem<String>>((String newValue) {
                return DropdownMenuItem(
                  value: newValue,
                  child: Text(
                    newValue,
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }).toList(),
            ),
          )
        ],
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
                      Text.rich(TextSpan(text: "Txt No: ", children: [
                        TextSpan(
                            text: "ER8365353673535",
                            style: TextStyle(fontWeight: FontWeight.w700))
                      ])),
                      Text("2023-12-11")
                    ],
                  ),
                  SizedBox(height: 3),
                  Text.rich(TextSpan(text: "Employ Name: ", children: [
                    TextSpan(
                        text: "Ramedranath Guria",
                        style: TextStyle(fontWeight: FontWeight.w700))
                  ])),
                  SizedBox(height: 3),
                  Text.rich(TextSpan(text: "Module: ", children: [
                    TextSpan(
                        text: "SalesOrder Creation",
                        style: TextStyle(fontWeight: FontWeight.w700))
                  ])),
                  SizedBox(height: 3),
                  Text.rich(TextSpan(text: "Company Name: ", children: [
                    TextSpan(
                        text: "FLIPKART PROVITED LIMITED",
                        style: TextStyle(fontWeight: FontWeight.w700))
                  ])),
                  SizedBox(height: 3),
                  Text.rich(TextSpan(text: "Comapny Persion: ", children: [
                    TextSpan(
                        text: "SAM",
                        style: TextStyle(fontWeight: FontWeight.w700))
                  ])),
                  SizedBox(height: 3),
                  Text.rich(TextSpan(
                      text: "URL: ",
                      style: TextStyle(fontSize: 18),
                      children: [
                        TextSpan(
                            text:
                                "https://vitwo.finance/about vaghcvakdvcadvucvadkcvuavdgvadgvaudvcudavcavdcvdjgagdvsv djgajhadv gjadj vgjsjjs",
                            style: TextStyle(color: Colors.blue))
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
                      Text(
                        "Task Description: ",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
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
