import '/auth/firebase_auth/auth_util.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/chat_groupwbubbles/empty_state_simple/empty_state_simple_widget.dart';
import '/components/color_container_widget.dart';
import '/components/list_container_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'history_widget.dart' show HistoryWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HistoryModel extends FlutterFlowModel<HistoryWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for colorContainer component.
  late ColorContainerModel colorContainerModel;
  // Models for listContainer dynamic component.
  late FlutterFlowDynamicModels<ListContainerModel> listContainerModels;

  @override
  void initState(BuildContext context) {
    colorContainerModel = createModel(context, () => ColorContainerModel());
    listContainerModels = FlutterFlowDynamicModels(() => ListContainerModel());
  }

  @override
  void dispose() {
    colorContainerModel.dispose();
    listContainerModels.dispose();
  }
}
