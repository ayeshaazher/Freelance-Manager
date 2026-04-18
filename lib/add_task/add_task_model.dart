import '/auth/firebase_auth/auth_util.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/components/color_container_widget.dart';
import '/components/task_bottom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'add_task_widget.dart' show AddTaskWidget;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddTaskModel extends FlutterFlowModel<AddTaskWidget> {
  ///  Local state fields for this page.

  DateTime? endDate;

  String? textOutPut;

  String? taskName;

  String? description;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for colorContainer component.
  late ColorContainerModel colorContainerModel;
  // Stores action output result for [Bottom Sheet - taskBottomSheet] action in Container widget.
  String? taskGroupName;
  // State field(s) for taskName widget.
  FocusNode? taskNameFocusNode;
  TextEditingController? taskNameTextController;
  String? Function(BuildContext, String?)? taskNameTextControllerValidator;
  String? _taskNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter your Task name is required';
    }

    return null;
  }

  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  String? _descriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter your task description is required';
    }

    return null;
  }

  DateTime? datePicked;
  // Stores action output result for [Custom Action - giveID] action in Button widget.
  int? taskId;

  @override
  void initState(BuildContext context) {
    colorContainerModel = createModel(context, () => ColorContainerModel());
    taskNameTextControllerValidator = _taskNameTextControllerValidator;
    descriptionTextControllerValidator = _descriptionTextControllerValidator;
  }

  @override
  void dispose() {
    colorContainerModel.dispose();
    taskNameFocusNode?.dispose();
    taskNameTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();
  }
}
