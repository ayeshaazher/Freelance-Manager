import 'package:sqflite/sqflite.dart';

/// BEGIN UPDATESINGLETASKS
Future performUpdateSingleTasks(
  Database database, {
  String? taskGroup,
  String? taskName,
  String? description,
  String? endDate,
  int? taskID,
  String? taskStatus,
}) {
  final query = '''
UPDATE tasks
SET 
    taskGroup = '${taskGroup}',
    taskName = '${taskName}',
    description = '${description}',
    endDate = '${endDate}',
    taskStatus = '${taskStatus}'
    WHERE  taskID = ${taskID};
''';
  return database.rawQuery(query);
}

/// END UPDATESINGLETASKS

/// BEGIN ADDTASK
Future performAddTask(
  Database database, {
  String? taskGroup,
  String? taskName,
  String? description,
  String? endDate,
  String? taskStatus,
  int? taskID,
  String? userID,
}) {
  final query = '''
INSERT INTO tasks
  (taskGroup, taskName, description, endDate, taskStatus, userID, taskID)
  VALUES ('${taskGroup}', '${taskName}', '${description}', '${endDate}', '${taskStatus}', '${userID}',${taskID});
''';
  return database.rawQuery(query);
}

/// END ADDTASK

/// BEGIN DELETETASKS
Future performDeleteTasks(
  Database database, {
  int? taskID,
}) {
  final query = '''
DELETE FROM tasks WHERE taskID = ${taskID};
''';
  return database.rawQuery(query);
}

/// END DELETETASKS

/// BEGIN ADDUSER
Future performAddUser(
  Database database, {
  String? email,
  String? displayname,
  String? photoUrl,
  String? createdtime,
  String? phonenumber,
  String? profession,
  String? shortDescription,
  String? lastactivetime,
}) {
  final query = '''
INSERT INTO userData
  (email, display_name, photo_url, uid, created_time, phone_number, profession, shortDescription, last_active_time)
  VALUES ('${email}', '${displayname}', '${photoUrl}', '${createdtime}', '${phonenumber}', '${profession}','${shortDescription}','${lastactivetime}');
''';
  return database.rawQuery(query);
}

/// END ADDUSER
