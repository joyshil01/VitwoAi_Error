import 'package:error/src/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      onGenerateTitle: (BuildContext context) => 'Vitwo ai Error',
      debugShowCheckedModeBanner: false,
      getPages: RoutesClass.routes,
      initialRoute: RoutesClass.home,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xfffdbe5ee), //background color
        primaryColor: Color.fromARGB(255, 198, 210, 223),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          background: Colors.white,
          secondary: Color(0xfff003060), // Appbar background color
        ),
        hintColor: Colors.white, //font color
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 20,
            color: Colors.black,
            // fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Roboto',
            color: Colors.black,
            fontSize: 13,
          ),
          bodySmall: TextStyle(
            fontFamily: 'Roboto',
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
