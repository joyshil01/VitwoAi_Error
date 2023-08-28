import 'package:error/src/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/notifications/local_Notifications.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  print(
      "frm firebase--${message.data.toString()}");
  print(message.notification!.title);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  LocalNotificationService.initialize();
  runApp(
    ProviderScope(child: MyApp()),
  );
}
