import 'package:flutter/foundation.dart';

import '/backend/sqlite/init.dart';
import 'queries/read.dart';
import 'queries/update.dart';

import 'package:sqflite/sqflite.dart';
export 'queries/read.dart';
export 'queries/update.dart';

class SQLiteManager {
  SQLiteManager._();

  static SQLiteManager? _instance;
  static SQLiteManager get instance => _instance ??= SQLiteManager._();

  static late Database _database;
  Database get database => _database;

  static Future initialize() async {
    if (kIsWeb) {
      return;
    }
    _database = await initializeDatabaseFromDbFile(
      'task',
      'tasks.db',
    );
  }

  /// START READ QUERY CALLS

  Future<List<GetAllTasksRow>> getAllTasks({
    String? userID,
  }) =>
      performGetAllTasks(
        _database,
        userID: userID,
      );

  Future<List<GetAllTasksbasedOnGroupRow>> getAllTasksbasedOnGroup({
    String? userID,
    String? taskGroup,
    String? taskStatus,
  }) =>
      performGetAllTasksbasedOnGroup(
        _database,
        userID: userID,
        taskGroup: taskGroup,
        taskStatus: taskStatus,
      );

  Future<List<GetAllTasksbasedOnStatusRow>> getAllTasksbasedOnStatus({
    String? userID,
    String? taskStatus,
  }) =>
      performGetAllTasksbasedOnStatus(
        _database,
        userID: userID,
        taskStatus: taskStatus,
      );

  Future<List<GetAllSingleGroupTasksRow>> getAllSingleGroupTasks({
    String? userID,
    String? taskGroup,
  }) =>
      performGetAllSingleGroupTasks(
        _database,
        userID: userID,
        taskGroup: taskGroup,
      );

  /// END READ QUERY CALLS

  /// START UPDATE QUERY CALLS

  Future updateSingleTasks({
    String? taskGroup,
    String? taskName,
    String? description,
    String? endDate,
    int? taskID,
    String? taskStatus,
  }) =>
      performUpdateSingleTasks(
        _database,
        taskGroup: taskGroup,
        taskName: taskName,
        description: description,
        endDate: endDate,
        taskID: taskID,
        taskStatus: taskStatus,
      );

  Future addTask({
    String? taskGroup,
    String? taskName,
    String? description,
    String? endDate,
    String? taskStatus,
    int? taskID,
    String? userID,
  }) =>
      performAddTask(
        _database,
        taskGroup: taskGroup,
        taskName: taskName,
        description: description,
        endDate: endDate,
        taskStatus: taskStatus,
        taskID: taskID,
        userID: userID,
      );

  Future deleteTasks({
    int? taskID,
  }) =>
      performDeleteTasks(
        _database,
        taskID: taskID,
      );

  Future addUser({
    String? email,
    String? displayname,
    String? photoUrl,
    String? createdtime,
    String? phonenumber,
    String? profession,
    String? shortDescription,
    String? lastactivetime,
  }) =>
      performAddUser(
        _database,
        email: email,
        displayname: displayname,
        photoUrl: photoUrl,
        createdtime: createdtime,
        phonenumber: phonenumber,
        profession: profession,
        shortDescription: shortDescription,
        lastactivetime: lastactivetime,
      );

  /// END UPDATE QUERY CALLS
}
