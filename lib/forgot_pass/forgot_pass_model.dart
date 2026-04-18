import '/auth/firebase_auth/auth_util.dart';
import '/components/color_container_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'forgot_pass_widget.dart' show ForgotPassWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ForgotPassModel extends FlutterFlowModel<ForgotPassWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for colorContainer component.
  late ColorContainerModel colorContainerModel;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;

  @override
  void initState(BuildContext context) {
    colorContainerModel = createModel(context, () => ColorContainerModel());
  }

  @override
  void dispose() {
    colorContainerModel.dispose();
    emailFocusNode?.dispose();
    emailTextController?.dispose();
  }
}
