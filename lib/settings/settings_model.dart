import '/auth/firebase_auth/auth_util.dart';
import '/components/color_container_widget.dart';
import '/components/nev_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'settings_widget.dart' show SettingsWidget;
import 'package:flutter/material.dart';

class SettingsModel extends FlutterFlowModel<SettingsWidget> {
  ///  Local state fields for this page.

  bool isDeleting = false;

  ///  State fields for stateful widgets in this page.

  // Model for colorContainer component.
  late ColorContainerModel colorContainerModel;
  // Model for nevBar component.
  late NevBarModel nevBarModel;

  @override
  void initState(BuildContext context) {
    colorContainerModel = createModel(context, () => ColorContainerModel());
    nevBarModel = createModel(context, () => NevBarModel());
  }

  @override
  void dispose() {
    colorContainerModel.dispose();
    nevBarModel.dispose();
  }
}