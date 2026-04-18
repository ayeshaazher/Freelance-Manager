import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'new_chat_widget.dart' show NewChatWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class NewChatModel extends FlutterFlowModel<NewChatWidget> {
  ///  Local state fields for this component.

  int? count = 0;

  bool showFullList = true;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in newChat widget.
  List<ChatsRecord>? chatData;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<UsersRecord> simpleSearchResults = [];
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  ChatsRecord? chatref;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  ChatsRecord? chatrefnew;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  ChatsRecord? chatref2;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  ChatsRecord? chatrefnew2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
