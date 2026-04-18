import '/components/color_container_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'lets_start_widget.dart' show LetsStartWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LetsStartModel extends FlutterFlowModel<LetsStartWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for colorContainer component.
  late ColorContainerModel colorContainerModel;

  @override
  void initState(BuildContext context) {
    colorContainerModel = createModel(context, () => ColorContainerModel());
  }

  @override
  void dispose() {
    colorContainerModel.dispose();
  }
}
