import '/backend/gemini/gemini.dart';
import '/components/color_container_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'gemini_a_i_widget.dart' show GeminiAIWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GeminiAIModel extends FlutterFlowModel<GeminiAIWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for colorContainer component.
  late ColorContainerModel colorContainerModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Gemini - Generate Text] action in Button widget.
  String? result;

  @override
  void initState(BuildContext context) {
    colorContainerModel = createModel(context, () => ColorContainerModel());
  }

  @override
  void dispose() {
    colorContainerModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
