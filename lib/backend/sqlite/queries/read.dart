import '/backend/sqlite/queries/sqlite_row.dart';
import 'package:sqflite/sqflite.dart';

Future<List<T>> _readQuery<T>(
  Database database,
  String query,
  T Function(Map<String, dynamic>) create,
) =>
    database.rawQuery(query).then((r) => r.map((e) => create(e)).toList());

/// BEGIN GETALLTASKS
Future<List<GetAllTasksRow>> performGetAllTasks(
  Database database, {
  String? userID,
}) {
  final query = '''
SELECT * FROM tasks where userID = '${userID}'
''';
  return _readQuery(database, query, (d) => GetAllTasksRow(d));
}

class GetAllTasksRow extends SqliteRow {
  GetAllTasksRow(Map<String, dynamic> data) : super(data);

  String get userID => data['userID'] as String;
  String get taskGroup => data['taskGroup'] as String;
  String get taskName => data['taskName'] as String;
  String get description => data['description'] as String;
  String get endDate => data['endDate'] as String;
  String get taskStatus => data['taskStatus'] as String;
  int get taskID => data['taskID'] as int;
}

/// END GETALLTASKS

/// BEGIN GETALLTASKSBASEDONGROUP
Future<List<GetAllTasksbasedOnGroupRow>> performGetAllTasksbasedOnGroup(
  Database database, {
  String? userID,
  String? taskGroup,
  String? taskStatus,
}) {
  final query = '''
SELECT * FROM tasks where userID = '${userID}' AND  taskGroup = '${taskGroup}' AND taskStatus = '${taskStatus}'
''';
  return _readQuery(database, query, (d) => GetAllTasksbasedOnGroupRow(d));
}

class GetAllTasksbasedOnGroupRow extends SqliteRow {
  GetAllTasksbasedOnGroupRow(Map<String, dynamic> data) : super(data);

  String get userID => data['userID'] as String;
  String get taskGroup => data['taskGroup'] as String;
  String get taskName => data['taskName'] as String;
  String get description => data['description'] as String;
  String get endDate => data['endDate'] as String;
  String get taskStatus => data['taskStatus'] as String;
  int get taskID => data['taskID'] as int;
}

/// END GETALLTASKSBASEDONGROUP

/// BEGIN GETALLTASKSBASEDONSTATUS
Future<List<GetAllTasksbasedOnStatusRow>> performGetAllTasksbasedOnStatus(
  Database database, {
  String? userID,
  String? taskStatus,
}) {
  final query = '''
SELECT * FROM tasks where userID = '${userID}'  AND  taskStatus = '${taskStatus}'
''';
  return _readQuery(database, query, (d) => GetAllTasksbasedOnStatusRow(d));
}

class GetAllTasksbasedOnStatusRow extends SqliteRow {
  GetAllTasksbasedOnStatusRow(Map<String, dynamic> data) : super(data);

  String get userID => data['userID'] as String;
  String get taskGroup => data['taskGroup'] as String;
  String get taskName => data['taskName'] as String;
  String get description => data['description'] as String;
  String get endDate => data['endDate'] as String;
  String get taskStatus => data['taskStatus'] as String;
  int get taskID => data['taskID'] as int;
}

/// END GETALLTASKSBASEDONSTATUS

/// BEGIN GETALLSINGLEGROUPTASKS
Future<List<GetAllSingleGroupTasksRow>> performGetAllSingleGroupTasks(
  Database database, {
  String? userID,
  String? taskGroup,
}) {
  final query = '''
SELECT * FROM tasks where userID = '${userID}' AND taskGroup = '${taskGroup}'
''';
  return _readQuery(database, query, (d) => GetAllSingleGroupTasksRow(d));
}

class GetAllSingleGroupTasksRow extends SqliteRow {
  GetAllSingleGroupTasksRow(Map<String, dynamic> data) : super(data);

  String get userID => data['userID'] as String;
  String get taskGroup => data['taskGroup'] as String;
  String get taskName => data['taskName'] as String;
  String get description => data['description'] as String;
  String get endDate => data['endDate'] as String;
  String get taskStatus => data['taskStatus'] as String;
  int get taskID => data['taskID'] as int;
}

/// END GETALLSINGLEGROUPTASKS
