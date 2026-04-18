import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/components/color_container_widget.dart';
import '/components/in_progress_widget.dart';
import '/components/nev_bar_widget.dart';
import '/components/task_categories_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  Local state fields for this page.

  bool load = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - SQLite (GetAllSingleGroupTasks)] action in home widget.
  List<GetAllSingleGroupTasksRow>? onJob;
  // Stores action output result for [Backend Call - SQLite (GetAllTasksbasedOnGroup)] action in home widget.
  List<GetAllTasksbasedOnGroupRow>? onJobProgress;
  // Stores action output result for [Backend Call - SQLite (GetAllSingleGroupTasks)] action in home widget.
  List<GetAllSingleGroupTasksRow>? freelancer;
  // Stores action output result for [Backend Call - SQLite (GetAllTasksbasedOnGroup)] action in home widget.
  List<GetAllTasksbasedOnGroupRow>? freelancerProgress;
  // Stores action output result for [Backend Call - SQLite (GetAllSingleGroupTasks)] action in home widget.
  List<GetAllSingleGroupTasksRow>? onHome;
  // Stores action output result for [Backend Call - SQLite (GetAllTasksbasedOnGroup)] action in home widget.
  List<GetAllTasksbasedOnGroupRow>? onHomeProgress;
  // Stores action output result for [Backend Call - SQLite (GetAllSingleGroupTasks)] action in home widget.
  List<GetAllSingleGroupTasksRow>? study;
  // Stores action output result for [Backend Call - SQLite (GetAllTasksbasedOnGroup)] action in home widget.
  List<GetAllTasksbasedOnGroupRow>? studyProgress;
  // Model for colorContainer component.
  late ColorContainerModel colorContainerModel1;
  // Model for inProgress component.
  late InProgressModel inProgressModel1;
  // Model for inProgress component.
  late InProgressModel inProgressModel2;
  // Model for inProgress component.
  late InProgressModel inProgressModel3;
  // Model for inProgress component.
  late InProgressModel inProgressModel4;
  // Model for taskCategories component.
  late TaskCategoriesModel taskCategoriesModel1;
  // Model for taskCategories component.
  late TaskCategoriesModel taskCategoriesModel2;
  // Model for taskCategories component.
  late TaskCategoriesModel taskCategoriesModel3;
  // Model for taskCategories component.
  late TaskCategoriesModel taskCategoriesModel4;
  // Model for nevBar component.
  late NevBarModel nevBarModel;
  // Model for colorContainer component.
  late ColorContainerModel colorContainerModel2;
  // Stores action output result for [Firestore Query - Query a collection] action in Row widget.
  ShareRecord? share;
  // State field(s) for Switch widget.
  bool? switchValue;

  @override
  void initState(BuildContext context) {
    colorContainerModel1 = createModel(context, () => ColorContainerModel());
    inProgressModel1 = createModel(context, () => InProgressModel());
    inProgressModel2 = createModel(context, () => InProgressModel());
    inProgressModel3 = createModel(context, () => InProgressModel());
    inProgressModel4 = createModel(context, () => InProgressModel());
    taskCategoriesModel1 = createModel(context, () => TaskCategoriesModel());
    taskCategoriesModel2 = createModel(context, () => TaskCategoriesModel());
    taskCategoriesModel3 = createModel(context, () => TaskCategoriesModel());
    taskCategoriesModel4 = createModel(context, () => TaskCategoriesModel());
    nevBarModel = createModel(context, () => NevBarModel());
    colorContainerModel2 = createModel(context, () => ColorContainerModel());
  }

  @override
  void dispose() {
    colorContainerModel1.dispose();
    inProgressModel1.dispose();
    inProgressModel2.dispose();
    inProgressModel3.dispose();
    inProgressModel4.dispose();
    taskCategoriesModel1.dispose();
    taskCategoriesModel2.dispose();
    taskCategoriesModel3.dispose();
    taskCategoriesModel4.dispose();
    nevBarModel.dispose();
    colorContainerModel2.dispose();
  }
}
