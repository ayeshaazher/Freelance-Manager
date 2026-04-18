import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'task_bottom_sheet_model.dart';
export 'task_bottom_sheet_model.dart';

class TaskBottomSheetWidget extends StatefulWidget {
  const TaskBottomSheetWidget({super.key});

  @override
  State<TaskBottomSheetWidget> createState() => _TaskBottomSheetWidgetState();
}

class _TaskBottomSheetWidgetState extends State<TaskBottomSheetWidget> {
  late TaskBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TaskBottomSheetModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: AlignmentDirectional(1.0, -1.0),
            child: FlutterFlowIconButton(
              borderRadius: 24.0,
              buttonSize: 48.0,
              icon: Icon(
                Icons.close,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              onPressed: () async {
                Navigator.pop(context);
              },
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
            child: FFButtonWidget(
              onPressed: () {
                print('Button pressed ...');
              },
              text: 'Select Task Group',
              options: FFButtonOptions(
                height: 40.0,
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: Color(0xFF7C46F0),
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      font: GoogleFonts.interTight(
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                      color: Colors.white,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).titleSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleSmall.fontStyle,
                    ),
                elevation: 0.0,
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              _model.onHomeTask = false;
              _model.freelancer = false;
              _model.studyTask = false;
              _model.select = 'On Job Tasks';
              safeSetState(() {});
              if (_model.onJobTask == false) {
                _model.onJobTask = true;
                _model.onHomeTask = false;
                _model.freelancer = false;
                _model.studyTask = false;
                safeSetState(() {});
              }
            },
            child: Material(
              color: Colors.transparent,
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.0),
              ),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.9,
                height: 55.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  borderRadius: BorderRadius.circular(14.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: Image.asset(
                              'assets/images/112.sales.png',
                              width: 24.0,
                              height: 24.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'On Job Tasks',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      ToggleIcon(
                        onPressed: () async {
                          safeSetState(
                              () => _model.onJobTask = !_model.onJobTask);
                          _model.onHomeTask = false;
                          _model.freelancer = false;
                          _model.studyTask = false;
                          _model.select = 'On Job Tasks';
                          safeSetState(() {});
                          if (_model.onJobTask == false) {
                            _model.onJobTask = true;
                            _model.onHomeTask = false;
                            _model.freelancer = false;
                            _model.studyTask = false;
                            safeSetState(() {});
                          }
                        },
                        value: _model.onJobTask,
                        onIcon: Icon(
                          Icons.radio_button_checked,
                          color: Color(0xFF7C46F0),
                          size: 24.0,
                        ),
                        offIcon: Icon(
                          Icons.radio_button_off,
                          color: Color(0xFF7C46F0),
                          size: 24.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 14.0, 0.0, 14.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                _model.freelancer = false;
                _model.studyTask = false;
                _model.select = 'On Home Tasks';
                _model.onJobTask = false;
                safeSetState(() {});
                if (_model.onHomeTask == false) {
                  _model.onJobTask = false;
                  _model.onHomeTask = true;
                  _model.freelancer = false;
                  _model.studyTask = false;
                  safeSetState(() {});
                }
              },
              child: Material(
                color: Colors.transparent,
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.0),
                ),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  height: 55.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: BorderRadius.circular(14.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: Image.asset(
                                'assets/images/112.sales_(1).png',
                                width: 24.0,
                                height: 24.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'On Home Tasks',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        ToggleIcon(
                          onPressed: () async {
                            safeSetState(
                                () => _model.onHomeTask = !_model.onHomeTask);
                            _model.freelancer = false;
                            _model.studyTask = false;
                            _model.select = 'On Home Tasks';
                            _model.onJobTask = false;
                            safeSetState(() {});
                            if (_model.onHomeTask == false) {
                              _model.onJobTask = false;
                              _model.onHomeTask = true;
                              _model.freelancer = false;
                              _model.studyTask = false;
                              safeSetState(() {});
                            }
                          },
                          value: _model.onHomeTask,
                          onIcon: Icon(
                            Icons.radio_button_checked,
                            color: Color(0xFF7C46F0),
                            size: 24.0,
                          ),
                          offIcon: Icon(
                            Icons.radio_button_off,
                            color: Color(0xFF7C46F0),
                            size: 24.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 14.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                _model.freelancer = false;
                _model.select = 'Study Tasks';
                _model.onJobTask = false;
                _model.onHomeTask = false;
                safeSetState(() {});
                if (_model.studyTask == false) {
                  _model.onJobTask = false;
                  _model.onHomeTask = false;
                  _model.freelancer = false;
                  _model.studyTask = true;
                  safeSetState(() {});
                }
              },
              child: Material(
                color: Colors.transparent,
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.0),
                ),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  height: 55.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: BorderRadius.circular(14.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: Image.asset(
                                'assets/images/112.sales_(3).png',
                                width: 24.0,
                                height: 24.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Study Tasks',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        ToggleIcon(
                          onPressed: () async {
                            safeSetState(
                                () => _model.studyTask = !_model.studyTask);
                            _model.freelancer = false;
                            _model.select = 'Studey Tasks';
                            _model.onJobTask = false;
                            _model.onHomeTask = false;
                            safeSetState(() {});
                            if (_model.studyTask == false) {
                              _model.onJobTask = false;
                              _model.onHomeTask = false;
                              _model.freelancer = false;
                              _model.studyTask = true;
                              safeSetState(() {});
                            }
                          },
                          value: _model.studyTask,
                          onIcon: Icon(
                            Icons.radio_button_checked,
                            color: Color(0xFF7C46F0),
                            size: 24.0,
                          ),
                          offIcon: Icon(
                            Icons.radio_button_off,
                            color: Color(0xFF7C46F0),
                            size: 24.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              _model.select = 'Freelancer Tasks';
              _model.onJobTask = false;
              _model.onHomeTask = false;
              _model.studyTask = false;
              safeSetState(() {});
              if (_model.freelancer == false) {
                _model.onJobTask = false;
                _model.onHomeTask = false;
                _model.freelancer = true;
                _model.studyTask = false;
                safeSetState(() {});
              }
            },
            child: Material(
              color: Colors.transparent,
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.0),
              ),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.9,
                height: 55.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  borderRadius: BorderRadius.circular(14.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: Image.asset(
                              'assets/images/112.sales_(2).png',
                              width: 24.0,
                              height: 24.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Freelancer Tasks',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      ToggleIcon(
                        onPressed: () async {
                          safeSetState(
                              () => _model.freelancer = !_model.freelancer);
                          _model.select = 'Freelancer Tasks';
                          _model.onJobTask = false;
                          _model.onHomeTask = false;
                          _model.studyTask = false;
                          safeSetState(() {});
                          if (_model.freelancer == false) {
                            _model.onJobTask = false;
                            _model.onHomeTask = false;
                            _model.freelancer = true;
                            _model.studyTask = false;
                            safeSetState(() {});
                          }
                        },
                        value: _model.freelancer,
                        onIcon: Icon(
                          Icons.radio_button_checked,
                          color: Color(0xFF7C46F0),
                          size: 24.0,
                        ),
                        offIcon: Icon(
                          Icons.radio_button_off,
                          color: Color(0xFF7C46F0),
                          size: 24.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 20.0),
            child: FFButtonWidget(
              onPressed: () async {
                Navigator.pop(context, _model.select);
              },
              text: 'Add Group',
              options: FFButtonOptions(
                width: MediaQuery.sizeOf(context).width * 0.9,
                height: 40.0,
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: Color(0xFF7C46F0),
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      font: GoogleFonts.interTight(
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                      color: Colors.white,
                      fontSize: 18.0,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).titleSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleSmall.fontStyle,
                    ),
                elevation: 4.0,
                borderRadius: BorderRadius.circular(14.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
