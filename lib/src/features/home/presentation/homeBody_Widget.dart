import 'package:flutter/material.dart';
import '../../../common_Widget/containerStyle.dart';

class homeBody extends StatefulWidget {
  @override
  State<homeBody> createState() => _homeBodyState();
}

class _homeBodyState extends State<homeBody> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 200,
          child: ContainerStyle(
            child: Container(),
          ),
        ),
      ),
    );
  }
}
