import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'common_Widget/navBottom.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (BuildContext context) => 'Vitwo ai Error',
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        duration: 1500,
        splashTransition: SplashTransition.fadeTransition,
        // pageTransitionType: PageTransitionType.scale,
        backgroundColor: Colors.white,
        splash: Center(
          child: Container(
            child: Image.asset(
              'assets/vitwo-ai-loader.gif',
              fit: BoxFit.cover,
            ),
          ),
        ),
        nextScreen: MainPage(),
      ),
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
