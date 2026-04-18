// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Import for local notifications
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> requestNotificationPermissions() async {
  final status = await Permission.scheduleExactAlarm.status;
  print('Schedule exact alarm permission: $status.');
  if (status.isDenied) {
    print('Requesting schedule exact alarm permission...');
    final res = await Permission.scheduleExactAlarm.request();
    print(
        'Schedule exact alarm permission ${res.isGranted ? '' : 'not'} granted.');
  }
  // Add your function code here!
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Request notification permission on Android 13+
  if (await Permission.notification.isDenied) {
    await Permission.notification.request();
  }

  // Check if the permission is granted
  if (await Permission.notification.isGranted) {
    // Initialize local notifications plugin after permission is granted
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

    // Now you can set up notifications or show a test notification if needed
  } else {
    // Handle the case when permission is denied
    print("Notification permission is denied.");
  }
}
