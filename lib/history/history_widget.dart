import 'package:alarm/alarm.dart';

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
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'history_model.dart';
export 'history_model.dart';

class HistoryWidget extends StatefulWidget {
  const HistoryWidget({super.key});

  static String routeName = 'history';
  static String routePath = '/history';

  @override
  State<HistoryWidget> createState() => _HistoryWidgetState();
}

class _HistoryWidgetState extends State<HistoryWidget> {
  late HistoryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HistoryModel());
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
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                          'History',
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
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: FutureBuilder<List<GetAllTasksbasedOnStatusRow>>(
                        future: SQLiteManager.instance.getAllTasksbasedOnStatus(
                          userID: currentUserUid,
                          taskStatus: 'done',
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
                          if (listViewGetAllTasksbasedOnStatusRowList.isEmpty) {
                            return Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: MediaQuery.sizeOf(context).height * 1.0,
                              child: EmptyStateSimpleWidget(
                                icon: Icon(
                                  Icons.history,
                                  color: Color(0xFF13B5FD),
                                  size: 50.0,
                                ),
                                title: 'History',
                                body: 'There is no history to you.',
                              ),
                            );
                          }

                          return ListView.builder(
                            padding: EdgeInsets.fromLTRB(
                              0,
                              0,
                              0,
                              86.0,
                            ),
                            scrollDirection: Axis.vertical,
                            itemCount:
                                listViewGetAllTasksbasedOnStatusRowList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewGetAllTasksbasedOnStatusRow =
                                  listViewGetAllTasksbasedOnStatusRowList[
                                      listViewIndex];
                              return wrapWithModel(
                                model: _model.listContainerModels.getModel(
                                  listViewGetAllTasksbasedOnStatusRow.taskID
                                      .toString(),
                                  listViewIndex,
                                ),
                                updateCallback: () => safeSetState(() {}),
                                child: ListContainerWidget(
                                  key: Key(
                                    'Keydec_${listViewGetAllTasksbasedOnStatusRow.taskID.toString()}',
                                  ),
                                  color1: Color(0xFF13B5FD),
                                  colorContainer: Color(0xFFAAE2FB),
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
                                  taskStatus: 'Done',
                                  actionDell: () async {
                                    await Alarm.stop(
                                        listViewGetAllTasksbasedOnStatusRow
                                            .taskID);
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
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
