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
  // Encode task info into payload
  final payload = jsonEncode({
    'taskId': id,
    'taskName': description,
    'taskGroup': title,
  });
  // Add your function code here!
  final alarmSettings = AlarmSettings(
    id: id,
    dateTime: dateTime,
    assetAudioPath: 'assets/audios/alarm.wav',
    loopAudio: true,
    vibrate: true,
    androidFullScreenIntent: true,
    volumeSettings: VolumeSettings.fade(   // ✅ new API
      volume: 1.0,
      fadeDuration: Duration(seconds: 3),
    ),
    notificationSettings: NotificationSettings(
      title: title,
      body: description,
      //stopButton: 'Stop',   // ✅ must be non-null to show the button
      icon: 'notification_icon',
    ),
    payload: payload, // ← store it here
  );
  return await Alarm.set(alarmSettings: alarmSettings);
}
