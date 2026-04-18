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
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'to_do_task_model.dart';
export 'to_do_task_model.dart';

class ToDoTaskWidget extends StatefulWidget {
  const ToDoTaskWidget({
    super.key,
    String? choiceChipInitial,
  }) : this.choiceChipInitial = choiceChipInitial ?? 'All';

  final String choiceChipInitial;

  static String routeName = 'toDoTask';
  static String routePath = '/toDoTask';

  @override
  State<ToDoTaskWidget> createState() => _ToDoTaskWidgetState();
}

class _ToDoTaskWidgetState extends State<ToDoTaskWidget> {
  late ToDoTaskModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ToDoTaskModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.choice = widget!.choiceChipInitial;
      safeSetState(() {});
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              wrapWithModel(
                model: _model.colorContainerModel,
                updateCallback: () => safeSetState(() {}),
                child: ColorContainerWidget(),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.safePop();
                          },
                          child: Icon(
                            FFIcons.karrowLeft,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 30.0,
                          ),
                        ),
                        Text(
                          'ToDo Tasks',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 22.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(GeminiAIWidget.routeName);
                          },
                          child: FaIcon(
                            FontAwesomeIcons.robot,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 20.0, 0.0, 0.0),
                      child: Text(
                        'Task Groups',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 15.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: FlutterFlowChoiceChips(
                              options: [
                                ChipData('All'),
                                ChipData('On Job Tasks'),
                                ChipData('On Home Tasks'),
                                ChipData('Study Tasks'),
                                ChipData('Freelancer Tasks')
                              ],
                              onChanged: (val) async {
                                safeSetState(() =>
                                    _model.choiceChipsValue = val?.firstOrNull);
                                _model.choice = _model.choiceChipsValue!;
                                safeSetState(() {});
                              },
                              selectedChipStyle: ChipStyle(
                                backgroundColor: Color(0xFF5F33E1),
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context).info,
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                iconColor: FlutterFlowTheme.of(context).info,
                                iconSize: 16.0,
                                elevation: 2.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              unselectedChipStyle: ChipStyle(
                                backgroundColor: Color(0xFFEDE8FF),
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF7C46F0),
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                iconColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                iconSize: 16.0,
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              chipSpacing: 20.0,
                              rowSpacing: 8.0,
                              multiselect: false,
                              initialized: _model.choiceChipsValue != null,
                              alignment: WrapAlignment.start,
                              controller: _model.choiceChipsValueController ??=
                                  FormFieldController<List<String>>(
                                [
                                  valueOrDefault<String>(
                                    widget!.choiceChipInitial,
                                    'All',
                                  )
                                ],
                              ),
                              wrapped: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (_model.choice != 'All')
                    Expanded(
                      child: FutureBuilder<List<GetAllTasksbasedOnGroupRow>>(
                        future: SQLiteManager.instance.getAllTasksbasedOnGroup(
                          userID: currentUserUid,
                          taskGroup: (_model.choice != 'null') &&
                                  (_model.choice != 'All')
                              ? _model.choice
                              : _model.choice,
                          taskStatus: 'not done',
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return ShimarEffectWidget();
                          }
                          final listViewGetAllTasksbasedOnGroupRowList =
                              snapshot.data!;

                          return ListView.builder(
                            padding: EdgeInsets.fromLTRB(
                              0,
                              0,
                              0,
                              80.0,
                            ),
                            scrollDirection: Axis.vertical,
                            itemCount:
                                listViewGetAllTasksbasedOnGroupRowList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewGetAllTasksbasedOnGroupRow =
                                  listViewGetAllTasksbasedOnGroupRowList[
                                      listViewIndex];
                              return wrapWithModel(
                                model: _model.listContainerModels1.getModel(
                                  listViewGetAllTasksbasedOnGroupRow.taskID
                                      .toString(),
                                  listViewIndex,
                                ),
                                updateCallback: () => safeSetState(() {}),
                                child: ListContainerWidget(
                                  key: Key(
                                    'Keyqd2_${listViewGetAllTasksbasedOnGroupRow.taskID.toString()}',
                                  ),
                                  color1: valueOrDefault<Color>(
                                    () {
                                      if (_model.choiceChipsValue ==
                                          'On Job Tasks') {
                                        return Color(0xFFFD7717);
                                      } else if (_model.choiceChipsValue ==
                                          'On Home Tasks') {
                                        return Color(0xFF7C46F0);
                                      } else if (_model.choiceChipsValue ==
                                          'Freelancer Tasks') {
                                        return Color(0xFF476FFB);
                                      } else {
                                        return Color(0xFF29D262);
                                      }
                                    }(),
                                    Color(0xFF46F080),
                                  ),
                                  colorContainer: valueOrDefault<Color>(
                                    () {
                                      if (_model.choiceChipsValue ==
                                          'On Job Tasks') {
                                        return Color(0xFFFDC095);
                                      } else if (_model.choiceChipsValue ==
                                          'On Home Tasks') {
                                        return Color(0xFFBC9DFF);
                                      } else if (_model.choiceChipsValue ==
                                          'Freelancer Tasks') {
                                        return Color(0xFFA8BAFB);
                                      } else {
                                        return Color(0xFFA6F2C0);
                                      }
                                    }(),
                                    Color(0xFFA6F2C0),
                                  ),
                                  taskGroup: listViewGetAllTasksbasedOnGroupRow
                                      .taskGroup,
                                  taskName: listViewGetAllTasksbasedOnGroupRow
                                      .taskName,
                                  visibility: listViewGetAllTasksbasedOnGroupRow
                                          .taskStatus !=
                                      'done',
                                  taskStatus: valueOrDefault<String>(
                                    listViewGetAllTasksbasedOnGroupRow
                                                .taskStatus ==
                                            'done'
                                        ? 'Done'
                                        : 'ToDo',
                                    'ToDo',
                                  ),
                                  date: dateTimeFormat(
                                      "yMMMd",
                                      functions.parseDateTime(
                                          listViewGetAllTasksbasedOnGroupRow
                                              .endDate,
                                          'yyyy-MM-dd HH:mm:ss')),
                                  actionDell: () async {
                                    var confirmDialogResponse =
                                        await showDialog<bool>(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text('Delete Task'),
                                                  content: Text(
                                                      'Are you sure you want to delete task?'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              false),
                                                      child: Text('No'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              true),
                                                      child: Text('Yes'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ) ??
                                            false;
                                    if (confirmDialogResponse) {
                                      await SQLiteManager.instance.deleteTasks(
                                        taskID:
                                            listViewGetAllTasksbasedOnGroupRow
                                                .taskID,
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Data Deleted Successfully.',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor: Color(0xFF025046),
                                        ),
                                      );
                                    }

                                    safeSetState(() {});
                                  },
                                  actionEdit: () async {
                                    context.pushNamed(
                                      AddTaskWidget.routeName,
                                      queryParameters: {
                                        'taskRefOnGroup': serializeParam(
                                          listViewGetAllTasksbasedOnGroupRow,
                                          ParamType.SqliteRow,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  actionDone: () async {
                                    var confirmDialogResponse =
                                        await showDialog<bool>(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text('Task Status'),
                                                  content: Text(
                                                      'Would you like to mark the task as done?'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              false),
                                                      child: Text('No'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              true),
                                                      child: Text('Yes'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ) ??
                                            false;
                                    if (confirmDialogResponse) {
                                      await SQLiteManager.instance
                                          .updateSingleTasks(
                                        taskStatus: 'done',
                                        taskGroup:
                                            listViewGetAllTasksbasedOnGroupRow
                                                .taskGroup,
                                        taskName:
                                            listViewGetAllTasksbasedOnGroupRow
                                                .taskName,
                                        description:
                                            listViewGetAllTasksbasedOnGroupRow
                                                .description,
                                        endDate:
                                            listViewGetAllTasksbasedOnGroupRow
                                                .endDate,
                                        taskID:
                                            listViewGetAllTasksbasedOnGroupRow
                                                .taskID,
                                      );
                                      ScaffoldMessenger.of(context)
                                          .clearSnackBars();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Mark as done sucessfully.',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor: Color(0xFF087A6C),
                                        ),
                                      );
                                    }

                                    safeSetState(() {});
                                  },
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  if (_model.choice == 'All')
                    Expanded(
                      child: FutureBuilder<List<GetAllTasksbasedOnStatusRow>>(
                        future: SQLiteManager.instance.getAllTasksbasedOnStatus(
                          userID: currentUserUid,
                          taskStatus: 'not done',
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          final listViewGetAllTasksbasedOnStatusRowList =
                              snapshot.data!;

                          return ListView.builder(
                            padding: EdgeInsets.fromLTRB(
                              0,
                              0,
                              0,
                              80.0,
                            ),
                            scrollDirection: Axis.vertical,
                            itemCount:
                                listViewGetAllTasksbasedOnStatusRowList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewGetAllTasksbasedOnStatusRow =
                                  listViewGetAllTasksbasedOnStatusRowList[
                                      listViewIndex];
                              return wrapWithModel(
                                model: _model.listContainerModels2.getModel(
                                  listViewGetAllTasksbasedOnStatusRow.taskID
                                      .toString(),
                                  listViewIndex,
                                ),
                                updateCallback: () => safeSetState(() {}),
                                child: ListContainerWidget(
                                  key: Key(
                                    'Keya8k_${listViewGetAllTasksbasedOnStatusRow.taskID.toString()}',
                                  ),
                                  color1: valueOrDefault<Color>(
                                    () {
                                      if (_model.choiceChipsValue ==
                                          'On Job Tasks') {
                                        return Color(0xFFFD7717);
                                      } else if (_model.choiceChipsValue ==
                                          'On Home Tasks') {
                                        return Color(0xFF7C46F0);
                                      } else if (_model.choiceChipsValue ==
                                          'Freelancer Tasks') {
                                        return Color(0xFF476FFB);
                                      } else {
                                        return Color(0xFF29D262);
                                      }
                                    }(),
                                    Color(0xFF46F080),
                                  ),
                                  colorContainer: valueOrDefault<Color>(
                                    () {
                                      if (_model.choiceChipsValue ==
                                          'On Job Tasks') {
                                        return Color(0xFFFDC095);
                                      } else if (_model.choiceChipsValue ==
                                          'On Home Tasks') {
                                        return Color(0xFFBC9DFF);
                                      } else if (_model.choiceChipsValue ==
                                          'Freelancer Tasks') {
                                        return Color(0xFFA8BAFB);
                                      } else {
                                        return Color(0xFFA6F2C0);
                                      }
                                    }(),
                                    Color(0xFFA6F2C0),
                                  ),
                                  taskGroup: listViewGetAllTasksbasedOnStatusRow
                                      .taskGroup,
                                  taskName: listViewGetAllTasksbasedOnStatusRow
                                      .taskName,
                                  date: dateTimeFormat(
                                      "yMMMd",
                                      functions.parseDateTime(
                                          listViewGetAllTasksbasedOnStatusRow
                                              .endDate,
                                          'yyyy-MM-dd HH:mm:ss')),
                                  visibility:
                                      listViewGetAllTasksbasedOnStatusRow
                                              .taskStatus !=
                                          'done',
                                  taskStatus: valueOrDefault<String>(
                                    listViewGetAllTasksbasedOnStatusRow
                                                .taskStatus ==
                                            'done'
                                        ? 'Done'
                                        : 'ToDo',
                                    'ToDo',
                                  ),
                                  actionDell: () async {
                                    var confirmDialogResponse =
                                        await showDialog<bool>(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text('Delete Task'),
                                                  content: Text(
                                                      'Are you sure you want to delete task?'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              false),
                                                      child: Text('No'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              true),
                                                      child: Text('Yes'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ) ??
                                            false;
                                    if (confirmDialogResponse) {
                                      await SQLiteManager.instance.deleteTasks(
                                        taskID:
                                            listViewGetAllTasksbasedOnStatusRow
                                                .taskID,
                                      );
                                    }

                                    safeSetState(() {});
                                  },
                                  actionEdit: () async {
                                    context.pushNamed(
                                      AddTaskWidget.routeName,
                                      queryParameters: {
                                        'taskRefOnStatus': serializeParam(
                                          listViewGetAllTasksbasedOnStatusRow,
                                          ParamType.SqliteRow,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  actionDone: () async {
                                    var confirmDialogResponse =
                                        await showDialog<bool>(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text('Task Status'),
                                                  content: Text(
                                                      'Would you like to mark the task as done?'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              false),
                                                      child: Text('No'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              true),
                                                      child: Text('Yes'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ) ??
                                            false;
                                    if (confirmDialogResponse) {
                                      await SQLiteManager.instance
                                          .updateSingleTasks(
                                        taskStatus: 'done',
                                        taskGroup:
                                            listViewGetAllTasksbasedOnStatusRow
                                                .taskGroup,
                                        taskName:
                                            listViewGetAllTasksbasedOnStatusRow
                                                .taskName,
                                        description:
                                            listViewGetAllTasksbasedOnStatusRow
                                                .description,
                                        endDate:
                                            listViewGetAllTasksbasedOnStatusRow
                                                .endDate,
                                        taskID:
                                            listViewGetAllTasksbasedOnStatusRow
                                                .taskID,
                                      );
                                    }

                                    safeSetState(() {});
                                  },
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                ],
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: wrapWithModel(
                  model: _model.nevBarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: NevBarWidget(
                    iconHome: Icon(
                      FFIcons.khome3,
                      color: Color(0xFF7C46F0),
                      size: 30.0,
                    ),
                    iconCalander: Icon(
                      FFIcons.kcalendar,
                      color: Color(0xFF7C46F0),
                      size: 30.0,
                    ),
                    iconCopy: Icon(
                      FFIcons.kcopy1,
                      color: Color(0xFF7C46F0),
                      size: 30.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
