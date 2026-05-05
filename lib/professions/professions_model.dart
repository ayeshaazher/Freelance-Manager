import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/color_container_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/index.dart';
import 'professions_widget.dart' show ProfessionsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfessionsModel extends FlutterFlowModel<ProfessionsWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for colorContainer component.
  late ColorContainerModel colorContainerModel;
  bool isDataUploading_uploadData93f = false;
  FFUploadedFile uploadedLocalFile_uploadData93f =
  FFUploadedFile(bytes: Uint8List.fromList([]));

  // Tracks whether the user attempted to submit without an image.
  bool imageSubmitAttempted = false;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    // Username is optional for OAuth sign-in (Google/Apple already provides it).
    if (isOAuthSignIn) return null;
    if (val == null || val.trim().isEmpty) {
      return 'Username is required';
    }
    if (val.trim().length < 2) {
      return 'Username must be at least 2 characters';
    }
    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.trim().isEmpty) {
      return 'Phone number is required';
    }
    // Basic phone validation: digits, spaces, +, -, ()
    final phoneRegex = RegExp(r'^[+\d\s\-()]{7,15}$');
    if (!phoneRegex.hasMatch(val.trim())) {
      return 'Enter a valid phone number';
    }
    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  String? _textController3Validator(BuildContext context, String? val) {
    if (val == null || val.trim().isEmpty) {
      return 'Profession is required';
    }
    return null;
  }

  bool isDataUploading_uploadData0f9 = false;
  FFUploadedFile uploadedLocalFile_uploadData0f9 =
  FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadData0f9 = '';

  /// True when the user arrived via Google, Apple, or any future OAuth provider.
  /// Set by [ProfessionsWidget] immediately after the model is created.
  bool isOAuthSignIn = false;

  /// Returns true if a profile image has been selected locally.
  bool get hasImage {
    final bytes = uploadedLocalFile_uploadData93f.bytes;
    return bytes != null && bytes.isNotEmpty;
  }

  /// Image is required only for email/password sign-ups.
  /// OAuth providers (Google/Apple) already supply a photo.
  bool get imageRequired => !isOAuthSignIn;

  @override
  void initState(BuildContext context) {
    colorContainerModel = createModel(context, () => ColorContainerModel());
    textController1Validator = _textController1Validator;
    textController2Validator = _textController2Validator;
    textController3Validator = _textController3Validator;
  }

  @override
  void dispose() {
    colorContainerModel.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();
  }
}