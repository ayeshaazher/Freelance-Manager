import '/auth/firebase_auth/auth_util.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/components/color_container_widget.dart';
import '/components/list_container_widget.dart';
import '/components/nev_bar_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
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
import 'calender_model.dart';
export 'calender_model.dart';

class CalenderWidget extends StatefulWidget {
  const CalenderWidget({super.key});

  static String routeName = 'calender';
  static String routePath = '/calender';

  @override
  State<CalenderWidget> createState() => _CalenderWidgetState();
}

class _CalenderWidgetState extends State<CalenderWidget> {
  late CalenderModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalenderModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.selectDate = _model.calendarSelectedDay?.start;
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
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Column(
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
                            'Calender',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 22.0,
                                  letterSpacing: 0.5,
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
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.9,
                        decoration: BoxDecoration(
                          color: Color(0xFF5F33E1),
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 8.0),
                            child: FlutterFlowCalendar(
                              color: Colors.white,
                              iconColor: Colors.white,
                              weekFormat: false,
                              weekStartsMonday: false,
                              rowHeight: 30.0,
                              onChange: (DateTimeRange? newSelectedDate) async {
                                if (_model.calendarSelectedDay ==
                                    newSelectedDate) {
                                  return;
                                }
                                _model.calendarSelectedDay = newSelectedDate;
                                _model.selectDate =
                                    _model.calendarSelectedDay?.start;
                                safeSetState(() {});
                                safeSetState(() {});
                              },
                              titleStyle: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                  ),
                              dayOfWeekStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontStyle,
                                  ),
                              dateStyle: FlutterFlowTheme.of(context)
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
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                              selectedDateStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF2555FF),
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              inactiveDateStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF6F767C),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 20.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  7.0, 0.0, 7.0, 0.0),
                              child: FlutterFlowChoiceChips(
                                options: [
                                  ChipData('All'),
                                  ChipData('ToDo'),
                                  ChipData('Done')
                                ],
                                onChanged: (val) async {
                                  safeSetState(() => _model.choiceChipsValue =
                                      val?.firstOrNull);
                                  _model.taskGroup = _model.choiceChipsValue;
                                  safeSetState(() {});
                                },
                                selectedChipStyle: ChipStyle(
                                  backgroundColor: Color(0xFF5F33E1),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                  iconColor: FlutterFlowTheme.of(context).info,
                                  iconSize: 18.0,
                                  elevation: 2.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                unselectedChipStyle: ChipStyle(
                                  backgroundColor: Color(0xFFEDE8FF),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF7C46F0),
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                  iconColor: Colors.black,
                                  iconSize: 18.0,
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                chipSpacing: 85.0,
                                rowSpacing: 8.0,
                                multiselect: false,
                                initialized: _model.choiceChipsValue != null,
                                alignment: WrapAlignment.start,
                                controller:
                                    _model.choiceChipsValueController ??=
                                        FormFieldController<List<String>>(
                                  ['All'],
                                ),
                                wrapped: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (_model.taskGroup == 'All')
                      Expanded(
                        child: FutureBuilder<List<GetAllTasksRow>>(
                          future: SQLiteManager.instance.getAllTasks(
                            userID: currentUserUid,
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
                            final listViewGetAllTasksRowList = snapshot.data!;

                            return ListView.builder(
                              padding: EdgeInsets.fromLTRB(
                                0,
                                0,
                                0,
                                80.0,
                              ),
                              scrollDirection: Axis.vertical,
                              itemCount: listViewGetAllTasksRowList.length,
                              itemBuilder: (context, listViewIndex) {
                                final listViewGetAllTasksRow =
                                    listViewGetAllTasksRowList[listViewIndex];
                                return Visibility(
                                  visible: dateTimeFormat(
                                          "yMMMd", _model.selectDate) ==
                                      dateTimeFormat(
                                          "yMMMd",
                                          functions.parseDateTime(
                                              listViewGetAllTasksRow.endDate,
                                              'yyyy-MM-dd HH:mm:ss')),
                                  child: wrapWithModel(
                                    model: _model.listContainerModels1.getModel(
                                      listViewGetAllTasksRow.taskID.toString(),
                                      listViewIndex,
                                    ),
                                    updateCallback: () => safeSetState(() {}),
                                    child: ListContainerWidget(
                                      key: Key(
                                        'Keyhud_${listViewGetAllTasksRow.taskID.toString()}',
                                      ),
                                      color1: valueOrDefault<Color>(
                                        () {
                                          if ((listViewGetAllTasksRow
                                                      .taskGroup ==
                                                  'On Job Tasks') &&
                                              (listViewGetAllTasksRow
                                                      .taskStatus ==
                                                  'not done')) {
                                            return Color(0xFFFD7717);
                                          } else if ((listViewGetAllTasksRow
                                                      .taskGroup ==
                                                  'On Home Tasks') &&
                                              (listViewGetAllTasksRow
                                                      .taskStatus ==
                                                  'not done')) {
                                            return Color(0xFF7C46F0);
                                          } else if ((listViewGetAllTasksRow
                                                      .taskGroup ==
                                                  'Freelancer Tasks') &&
                                              (listViewGetAllTasksRow
                                                      .taskStatus ==
                                                  'not done')) {
                                            return Color(0xFF476FFB);
                                          } else {
                                            return Color(0xFF29D262);
                                          }
                                        }(),
                                        Color(0xFF46F080),
                                      ),
                                      colorContainer: valueOrDefault<Color>(
                                        () {
                                          if ((listViewGetAllTasksRow
                                                      .taskGroup ==
                                                  'On Job Tasks') &&
                                              (listViewGetAllTasksRow
                                                      .taskStatus ==
                                                  'not done')) {
                                            return Color(0xFFFDC095);
                                          } else if ((listViewGetAllTasksRow
                                                      .taskGroup ==
                                                  'On Home Tasks') &&
                                              (listViewGetAllTasksRow
                                                      .taskStatus ==
                                                  'not done')) {
                                            return Color(0xFFBC9DFF);
                                          } else if ((listViewGetAllTasksRow
                                                      .taskGroup ==
                                                  'Freelancer Tasks') &&
                                              (listViewGetAllTasksRow
                                                      .taskStatus ==
                                                  'not done')) {
                                            return Color(0xFFA8BAFB);
                                          } else {
                                            return Color(0xFFA6F2C0);
                                          }
                                        }(),
                                        Color(0xFFA6F2C0),
                                      ),
                                      taskGroup:
                                          listViewGetAllTasksRow.taskGroup,
                                      taskName: listViewGetAllTasksRow.taskName,
                                      date: dateTimeFormat(
                                          "yMMMd",
                                          functions.parseDateTime(
                                              listViewGetAllTasksRow.endDate,
                                              'yyyy-MM-dd HH:mm:ss')),
                                      visibility:
                                          listViewGetAllTasksRow.taskStatus !=
                                              'done',
                                      taskStatus:
                                          listViewGetAllTasksRow.taskStatus ==
                                                  'done'
                                              ? 'Done'
                                              : 'ToDo',
                                      actionDell: () async {
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title:
                                                          Text('Delete Task'),
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
                                          await SQLiteManager.instance
                                              .deleteTasks(
                                            taskID:
                                                listViewGetAllTasksRow.taskID,
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
                                              backgroundColor:
                                                  Color(0xFF025046),
                                            ),
                                          );
                                        }

                                        safeSetState(() {});
                                      },
                                      actionEdit: () async {
                                        context.pushNamed(
                                          AddTaskWidget.routeName,
                                          queryParameters: {
                                            'taskRef': serializeParam(
                                              listViewGetAllTasksRow,
                                              ParamType.SqliteRow,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      actionDone: () async {
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title:
                                                          Text('Task Status'),
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
                                            taskGroup: listViewGetAllTasksRow
                                                .taskGroup,
                                            taskName:
                                                listViewGetAllTasksRow.taskName,
                                            description: listViewGetAllTasksRow
                                                .description,
                                            endDate:
                                                listViewGetAllTasksRow.endDate,
                                            taskID:
                                                listViewGetAllTasksRow.taskID,
                                          );
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Mark as Done.',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  Color(0xFF025046),
                                            ),
                                          );
                                        }

                                        safeSetState(() {});
                                      },
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    if (_model.taskGroup != 'All')
                      Expanded(
                        child: FutureBuilder<List<GetAllTasksbasedOnStatusRow>>(
                          future:
                              SQLiteManager.instance.getAllTasksbasedOnStatus(
                            userID: currentUserUid,
                            taskStatus: _model.choiceChipsValue == 'Done'
                                ? 'done'
                                : 'not done',
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
                              itemCount: listViewGetAllTasksbasedOnStatusRowList
                                  .length,
                              itemBuilder: (context, listViewIndex) {
                                final listViewGetAllTasksbasedOnStatusRow =
                                    listViewGetAllTasksbasedOnStatusRowList[
                                        listViewIndex];
                                return Visibility(
                                  visible: dateTimeFormat(
                                          "yMMMd", _model.selectDate) ==
                                      dateTimeFormat(
                                          "yMMMd",
                                          functions.parseDateTime(
                                              listViewGetAllTasksbasedOnStatusRow
                                                  .endDate,
                                              'yyyy-MM-dd HH:mm:ss')),
                                  child: wrapWithModel(
                                    model: _model.listContainerModels2.getModel(
                                      listViewGetAllTasksbasedOnStatusRow.taskID
                                          .toString(),
                                      listViewIndex,
                                    ),
                                    updateCallback: () => safeSetState(() {}),
                                    child: ListContainerWidget(
                                      key: Key(
                                        'Keyes1_${listViewGetAllTasksbasedOnStatusRow.taskID.toString()}',
                                      ),
                                      color1: valueOrDefault<Color>(
                                        () {
                                          if ((listViewGetAllTasksbasedOnStatusRow
                                                      .taskGroup ==
                                                  'On Job Tasks') &&
                                              (listViewGetAllTasksbasedOnStatusRow
                                                      .taskStatus ==
                                                  'not done')) {
                                            return Color(0xFFFD7717);
                                          } else if ((listViewGetAllTasksbasedOnStatusRow
                                                      .taskGroup ==
                                                  'On Home Tasks') &&
                                              (listViewGetAllTasksbasedOnStatusRow
                                                      .taskStatus ==
                                                  'not done')) {
                                            return Color(0xFF7C46F0);
                                          } else if ((listViewGetAllTasksbasedOnStatusRow
                                                      .taskGroup ==
                                                  'Freelancer Tasks') &&
                                              (listViewGetAllTasksbasedOnStatusRow
                                                      .taskStatus ==
                                                  'not done')) {
                                            return Color(0xFF476FFB);
                                          } else {
                                            return Color(0xFF29D262);
                                          }
                                        }(),
                                        Color(0xFF46F080),
                                      ),
                                      colorContainer: valueOrDefault<Color>(
                                        () {
                                          if ((listViewGetAllTasksbasedOnStatusRow
                                                      .taskGroup ==
                                                  'On Job Tasks') &&
                                              (listViewGetAllTasksbasedOnStatusRow
                                                      .taskStatus ==
                                                  'not done')) {
                                            return Color(0xFFFDC095);
                                          } else if ((listViewGetAllTasksbasedOnStatusRow
                                                      .taskGroup ==
                                                  'On Home Tasks') &&
                                              (listViewGetAllTasksbasedOnStatusRow
                                                      .taskStatus ==
                                                  'not done')) {
                                            return Color(0xFFBC9DFF);
                                          } else if ((listViewGetAllTasksbasedOnStatusRow
                                                      .taskGroup ==
                                                  'Freelancer Tasks') &&
                                              (listViewGetAllTasksbasedOnStatusRow
                                                      .taskStatus ==
                                                  'not done')) {
                                            return Color(0xFFA8BAFB);
                                          } else {
                                            return Color(0xFFA6F2C0);
                                          }
                                        }(),
                                        Color(0xFFA6F2C0),
                                      ),
                                      taskGroup:
                                          listViewGetAllTasksbasedOnStatusRow
                                              .taskGroup,
                                      taskName:
                                          listViewGetAllTasksbasedOnStatusRow
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
                                      taskStatus:
                                          listViewGetAllTasksbasedOnStatusRow
                                                      .taskStatus ==
                                                  'done'
                                              ? 'Done'
                                              : 'ToDo',
                                      actionDell: () async {
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title:
                                                          Text('Delete Task'),
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
                                          await SQLiteManager.instance
                                              .deleteTasks(
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
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title:
                                                          Text('Task Status'),
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
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                  ],
                ),
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
                      FFIcons.kcalendarPlus,
                      color: Color(0xFF7C46F0),
                      size: 30.0,
                    ),
                    iconCopy: Icon(
                      FFIcons.kcopy,
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
