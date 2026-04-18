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

import 'package:alarm/alarm.dart';

Future addAlarm(
  DateTime dateTime,
  int id,
  String title,
  String description,
) async {
  // Add your function code here!
  final alarmSettings = AlarmSettings(
    id: id,
    dateTime: dateTime,
    assetAudioPath: 'assets/audios/alarm.mp3',
    loopAudio: true,
    vibrate: true,
    volume: 1,
    fadeDuration: 3.0,
    androidFullScreenIntent: true,
    notificationSettings: NotificationSettings(
      title: title,
      body: description,
      stopButton: "Stop",
      icon: 'notification_icon',
    ),
  );
  return await Alarm.set(alarmSettings: alarmSettings);
}
