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

Future<bool> compareDate(
  DateTime chatDate,
  DateTime clearDate,
) async {
  // Add your function code here!
  DateTime selectedDate = chatDate; // Example date
  DateTime referenceDate = clearDate; // Another date to compare
// Checking if selectedDate is after referenceDate:
  bool isAfter = selectedDate.compareTo(referenceDate) > 0;
  return isAfter;
}
