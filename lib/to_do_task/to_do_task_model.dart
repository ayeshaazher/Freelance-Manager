import '/auth/firebase_auth/auth_util.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/components/color_container_widget.dart';
import '/components/list_container_widget.dart';
import '/components/nev_bar_widget.dart';
import '/components/shimar_effect_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'to_do_task_widget.dart' show ToDoTaskWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ToDoTaskModel extends FlutterFlowModel<ToDoTaskWidget> {
  ///  Local state fields for this page.

  String choice = 'null';

  ///  State fields for stateful widgets in this page.

  // Model for colorContainer component.
  late ColorContainerModel colorContainerModel;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Models for listContainer dynamic component.
  late FlutterFlowDynamicModels<ListContainerModel> listContainerModels1;
  // Models for listContainer dynamic component.
  late FlutterFlowDynamicModels<ListContainerModel> listContainerModels2;
  // Model for nevBar component.
  late NevBarModel nevBarModel;

  @override
  void initState(BuildContext context) {
    colorContainerModel = createModel(context, () => ColorContainerModel());
    listContainerModels1 = FlutterFlowDynamicModels(() => ListContainerModel());
    listContainerModels2 = FlutterFlowDynamicModels(() => ListContainerModel());
    nevBarModel = createModel(context, () => NevBarModel());
  }

  @override
  void dispose() {
    colorContainerModel.dispose();
    listContainerModels1.dispose();
    listContainerModels2.dispose();
    nevBarModel.dispose();
  }
}
