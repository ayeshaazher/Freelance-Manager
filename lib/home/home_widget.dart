import '../settings/settings_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/components/color_container_widget.dart';
import '/components/in_progress_widget.dart';
import '/components/nev_bar_widget.dart';
import '/components/task_categories_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:alarm/alarm.dart';
import 'package:alarm/utils/alarm_set.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'home_model.dart';
export 'home_model.dart';

// Import your alarm ringing screen
import '../alarm_ringing_screen.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  static String routeName = 'home';
  static String routePath = '/home';

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  // Stream subscription so we can cancel it on dispose
  StreamSubscription<AlarmSet>? _alarmSubscription;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    // ✅ Listen for ringing alarms HERE — the navigator is ready at this point
    _alarmSubscription = Alarm.ringing.listen((AlarmSet alarmSet) {
      for (final alarm in alarmSet.alarms) {
        // Use Navigator directly from context — we are inside a live widget
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => AlarmRingingScreen(alarmSettings: alarm),
            fullscreenDialog: true, // shows as a full modal on iOS
          ),
        );
      }
    });

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.load = false;
      safeSetState(() {});
      _model.onJob = await SQLiteManager.instance.getAllSingleGroupTasks(
        userID: currentUserUid,
        taskGroup: 'On Job Tasks',
      );
      _model.onJobProgress =
      await SQLiteManager.instance.getAllTasksbasedOnGroup(
        userID: currentUserUid,
        taskGroup: 'On Job Tasks',
        taskStatus: 'done',
      );
      _model.freelancer = await SQLiteManager.instance.getAllSingleGroupTasks(
        userID: currentUserUid,
        taskGroup: 'Freelancer Tasks',
      );
      _model.freelancerProgress =
      await SQLiteManager.instance.getAllTasksbasedOnGroup(
        userID: currentUserUid,
        taskGroup: 'Freelancer Tasks',
        taskStatus: 'done',
      );
      _model.onHome = await SQLiteManager.instance.getAllSingleGroupTasks(
        userID: currentUserUid,
        taskGroup: 'On Home Tasks',
      );
      _model.onHomeProgress =
      await SQLiteManager.instance.getAllTasksbasedOnGroup(
        userID: currentUserUid,
        taskGroup: 'On Home Tasks',
        taskStatus: 'done',
      );
      _model.study = await SQLiteManager.instance.getAllSingleGroupTasks(
        userID: currentUserUid,
        taskGroup: 'Study Tasks',
      );
      _model.studyProgress =
      await SQLiteManager.instance.getAllTasksbasedOnGroup(
        userID: currentUserUid,
        taskGroup: 'Study Tasks',
        taskStatus: 'done',
      );
      _model.load = true;
      safeSetState(() {});
    });

    _model.switchValue = true;
  }

  @override
  void dispose() {
    // ✅ Always cancel the subscription to avoid memory leaks
    _alarmSubscription?.cancel();
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
        drawer: Drawer(
          elevation: 16.0,
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Stack(
              children: [
                wrapWithModel(
                  model: _model.colorContainerModel2,
                  updateCallback: () => safeSetState(() {}),
                  child: ColorContainerWidget(),
                ),
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, -1.0),
                        child: FlutterFlowIconButton(
                          borderRadius: 8.0,
                          buttonSize: 48.0,
                          icon: Icon(
                            Icons.close,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 30.0,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => Container(
                              width: 65.0,
                              height: 65.0,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                valueOrDefault<String>(
                                  currentUserPhoto,
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfwM2108oL7bhv9Ee8QQBC2dCng0jnV0kAow&s',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 10.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => Text(
                            currentUserDisplayName,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                              font: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 2.0,
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            14.0, 10.0, 14.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(HistoryWidget.routeName);
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, -1.0),
                                child: Text(
                                  'History',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontStyle:
                                      FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                ),
                              ),
                              Icon(
                                FFIcons.kfileText,
                                color: Color(0xFF848485),
                                size: 24.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            14.0, 10.0, 14.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(SettingsWidget.routeName);
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, -1.0),
                                child: Text(
                                  'Settings',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontStyle:
                                      FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.settings_rounded,
                                color: Color(0xFF848485),
                                size: 24.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            14.0, 10.0, 14.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(FAQsWidget.routeName);
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, -1.0),
                                child: Text(
                                  'FAQs',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontStyle:
                                      FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.fact_check_rounded,
                                color: Color(0xFF848485),
                                size: 24.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Builder(
                        builder: (context) => Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              14.0, 10.0, 14.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.share = await queryShareRecordOnce(
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);
                              await Share.share(
                                _model.share!.shareURL,
                                sharePositionOrigin:
                                getWidgetBoundingBox(context),
                              );
                              safeSetState(() {});
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, -1.0),
                                  child: Text(
                                    'Share',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontStyle:
                                        FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle:
                                      FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.share_rounded,
                                  color: Color(0xFF848485),
                                  size: 24.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            14.0, 7.0, 6.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                                      ? Icons.dark_mode_rounded
                                      : Icons.light_mode_rounded,
                                  color: Color(0xFF848485),
                                  size: 20.0,
                                ),
                                SizedBox(width: 8.0),
                                Text(
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                                      ? 'Dark Mode'
                                      : 'Light Mode',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontStyle:
                                      FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                ),
                              ],
                            ),
                            Switch.adaptive(
                              value: Theme.of(context).brightness ==
                                  Brightness.dark,
                              onChanged: (newValue) {
                                setDarkModeSetting(
                                  context,
                                  newValue ? ThemeMode.dark : ThemeMode.light,
                                );
                                FFAppState().mood = false;
                                FFAppState().update(() {});
                              },
                              activeColor: Colors.white,
                              activeTrackColor: Color(0xFF848485),
                              inactiveTrackColor: Color(0xFF848485),
                              inactiveThumbColor: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            14.0, 60.0, 14.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            GoRouter.of(context).prepareAuthEvent();
                            await authManager.signOut();
                            GoRouter.of(context).clearRedirectLocation();
                            context.goNamedAuth(
                                LetsStartWidget.routeName, context.mounted);
                          },
                          text: 'Log out',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primaryText,
                            textStyle: FlutterFlowTheme.of(context)
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
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .fontStyle,
                            ),
                            elevation: 4.0,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              wrapWithModel(
                model: _model.colorContainerModel1,
                updateCallback: () => safeSetState(() {}),
                child: ColorContainerWidget(),
              ),
              SingleChildScrollView(
                primary: false,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          12.0, 0.0, 12.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              AuthUserStreamWidget(
                                builder: (context) => InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    scaffoldKey.currentState!.openDrawer();
                                  },
                                  child: Container(
                                    width: 50.0,
                                    height: 50.0,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      valueOrDefault<String>(
                                        currentUserPhoto,
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfwM2108oL7bhv9Ee8QQBC2dCng0jnV0kAow&s',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AuthUserStreamWidget(
                                      builder: (context) => Text(
                                        currentUserDisplayName,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                            FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .fontStyle,
                                          ),
                                          fontSize: 22.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                          FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .fontStyle,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 1.0, 0.0, 0.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => Text(
                                          valueOrDefault(
                                              currentUserDocument?.profession,
                                              ''),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                              FlutterFlowTheme.of(
                                                  context)
                                                  .bodyMedium
                                                  .fontWeight,
                                              fontStyle:
                                              FlutterFlowTheme.of(
                                                  context)
                                                  .bodyMedium
                                                  .fontStyle,
                                            ),
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
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
                      padding: EdgeInsetsDirectional.fromSTEB(
                          0.0, 20.0, 0.0, 20.0),
                      child: FutureBuilder<List<GetAllTasksRow>>(
                        future: SQLiteManager.instance.getAllTasks(
                          userID: currentUserUid,
                        ),
                        builder: (context, snapshot) {
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
                          final containerGetAllTasksRowList = snapshot.data!;

                          return Container(
                            width: MediaQuery.sizeOf(context).width * 0.9,
                            height: 150.0,
                            decoration: BoxDecoration(
                              color: Color(0xFF5F33E1),
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 15.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'You can do iT, almost \nToday\'s tasks are done!',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                            FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .fontStyle,
                                          ),
                                          color: Colors.white,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      FFButtonWidget(
                                        onPressed: () async {
                                          context.pushNamed(
                                              ToDoTaskWidget.routeName);
                                        },
                                        text: 'View task',
                                        options: FFButtonOptions(
                                          width: 146.0,
                                          height: 30.0,
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                          color: Colors.white,
                                          textStyle: FlutterFlowTheme.of(
                                              context)
                                              .titleSmall
                                              .override(
                                            font: GoogleFonts.interTight(
                                              fontWeight:
                                              FlutterFlowTheme.of(
                                                  context)
                                                  .titleSmall
                                                  .fontWeight,
                                              fontStyle:
                                              FlutterFlowTheme.of(
                                                  context)
                                                  .titleSmall
                                                  .fontStyle,
                                            ),
                                            color: Color(0xFF5F33E1),
                                            letterSpacing: 0.0,
                                          ),
                                          elevation: 0.0,
                                          borderRadius:
                                          BorderRadius.circular(15.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                  FutureBuilder<
                                      List<GetAllTasksbasedOnStatusRow>>(
                                    future: SQLiteManager.instance
                                        .getAllTasksbasedOnStatus(
                                      userID: currentUserUid,
                                      taskStatus: 'done',
                                    ),
                                    builder: (context, snapshot) {
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      final progressBarGetAllTasksbasedOnStatusRowList =
                                      snapshot.data!;

                                      return CircularPercentIndicator(
                                        percent: (int var1, int var2) {
                                          return var1 != 0 ? var2 / var1 : 0.0;
                                        }(
                                            containerGetAllTasksRowList.length,
                                            progressBarGetAllTasksbasedOnStatusRowList
                                                .length),
                                        radius: 45.0,
                                        lineWidth: 9.0,
                                        animation: true,
                                        animateFromLastPercent: true,
                                        progressColor: Colors.white,
                                        backgroundColor: Color(0xFF8652F6),
                                        center: Text(
                                          valueOrDefault<String>(
                                            formatNumber(
                                                  (int var1, int var2) {
                                                return var2 != 0
                                                    ? var1 / var2
                                                    : 0.0;
                                              }(
                                                  progressBarGetAllTasksbasedOnStatusRowList
                                                      .length,
                                                  containerGetAllTasksRowList
                                                      .length),
                                              formatType: FormatType.percent,
                                            ),
                                            '0.0%',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                            font: GoogleFonts.interTight(
                                              fontWeight:
                                              FlutterFlowTheme.of(
                                                  context)
                                                  .headlineSmall
                                                  .fontWeight,
                                              fontStyle:
                                              FlutterFlowTheme.of(
                                                  context)
                                                  .headlineSmall
                                                  .fontStyle,
                                            ),
                                            color: Colors.white,
                                            fontSize: 19.0,
                                            letterSpacing: 0.0,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, -1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            14.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'In Progress',
                          style:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    if (_model.load)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 12.0, 0.0, 20.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              wrapWithModel(
                                model: _model.inProgressModel1,
                                updateCallback: () => safeSetState(() {}),
                                child: InProgressWidget(
                                  taskProgress: _model.onJobProgress!.length,
                                  onTask: _model.onJob?.length,
                                  color: Color(0xFFFDC8A6),
                                  tittle: 'On Job Tasks',
                                  description: 'Your on job tasks progress',
                                  progressColor: Color(0xFFFD7717),
                                  taskGroup: 'On Job Tasks',
                                  action: () async {
                                    context.pushNamed(
                                      ToDoTaskWidget.routeName,
                                      queryParameters: {
                                        'choiceChipInitial': serializeParam(
                                          'On Job Tasks',
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                ),
                              ),
                              wrapWithModel(
                                model: _model.inProgressModel2,
                                updateCallback: () => safeSetState(() {}),
                                child: InProgressWidget(
                                  taskProgress: _model.onHomeProgress!.length,
                                  onTask: _model.onHome?.length,
                                  color: Color(0xFFC7AEF8),
                                  tittle: 'On Home Tasks',
                                  description: 'Your on home\ntasks progress',
                                  progressColor: Color(0xFF7C46F0),
                                  taskGroup: 'On Home Tasks',
                                  action: () async {
                                    context.pushNamed(
                                      ToDoTaskWidget.routeName,
                                      queryParameters: {
                                        'choiceChipInitial': serializeParam(
                                          'On Home Tasks',
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                ),
                              ),
                              wrapWithModel(
                                model: _model.inProgressModel3,
                                updateCallback: () => safeSetState(() {}),
                                child: InProgressWidget(
                                  taskProgress: _model.studyProgress!.length,
                                  onTask: _model.study?.length,
                                  color: Color(0xFFA6F2C0),
                                  tittle: 'Study Tasks',
                                  description: 'Your study tasks progress',
                                  progressColor: Color(0xFF29D262),
                                  taskGroup: 'Study Tasks',
                                  action: () async {
                                    context.pushNamed(
                                      ToDoTaskWidget.routeName,
                                      queryParameters: {
                                        'choiceChipInitial': serializeParam(
                                          'Study Tasks',
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                ),
                              ),
                              wrapWithModel(
                                model: _model.inProgressModel4,
                                updateCallback: () => safeSetState(() {}),
                                child: InProgressWidget(
                                  taskProgress:
                                  _model.freelancerProgress!.length,
                                  onTask: _model.freelancer?.length,
                                  color: Color(0xFFB5E2F6),
                                  tittle: 'Freelancer Tasks',
                                  description:
                                  'Your freelancer \ntasks progress',
                                  progressColor: Color(0xFF6CCCF6),
                                  taskGroup: 'Freelanser Tasks',
                                  action: () async {
                                    context.pushNamed(
                                      ToDoTaskWidget.routeName,
                                      queryParameters: {
                                        'choiceChipInitial': serializeParam(
                                          'Freelancer Tasks',
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                ),
                              ),
                            ]
                                .divide(SizedBox(width: 20.0))
                                .addToStart(SizedBox(width: 16.0))
                                .addToEnd(SizedBox(width: 16.0)),
                          ),
                        ),
                      ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, -1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            14.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Task Groups',
                          style:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    if (_model.load)
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            wrapWithModel(
                              model: _model.taskCategoriesModel1,
                              updateCallback: () => safeSetState(() {}),
                              child: TaskCategoriesWidget(
                                taskProgress: _model.onJobProgress?.length,
                                onTask: _model.onJob!.length,
                                colorProgress: Color(0xFFFF9142),
                                taskTittle: 'On Job Tasks',
                                countTask: _model.onJob!.length,
                                backgrountColor: Color(0xFFF4C7AA),
                                taskGroup: 'On Job Tasks',
                                action: () async {
                                  context.pushNamed(
                                    ToDoTaskWidget.routeName,
                                    queryParameters: {
                                      'choiceChipInitial': serializeParam(
                                        'On Job Tasks',
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                              ),
                            ),
                            wrapWithModel(
                              model: _model.taskCategoriesModel2,
                              updateCallback: () => safeSetState(() {}),
                              child: TaskCategoriesWidget(
                                taskProgress: _model.onHomeProgress?.length,
                                onTask: _model.onHome!.length,
                                colorProgress: Color(0xFF7C46F0),
                                taskTittle: 'On Home Tasks',
                                countTask: _model.onHome!.length,
                                backgrountColor: Color(0xFFB3A0D8),
                                taskGroup: 'On  Home Tasks',
                                action: () async {
                                  context.pushNamed(
                                    ToDoTaskWidget.routeName,
                                    queryParameters: {
                                      'choiceChipInitial': serializeParam(
                                        'On Home Tasks',
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                              ),
                            ),
                            wrapWithModel(
                              model: _model.taskCategoriesModel3,
                              updateCallback: () => safeSetState(() {}),
                              child: TaskCategoriesWidget(
                                taskProgress: _model.studyProgress?.length,
                                onTask: _model.study!.length,
                                colorProgress: Color(0xFF29D262),
                                taskTittle: 'Study Tasks',
                                countTask: _model.study!.length,
                                backgrountColor: Color(0xFFA6F2C0),
                                taskGroup: 'Study Tasks',
                                action: () async {
                                  context.pushNamed(
                                    ToDoTaskWidget.routeName,
                                    queryParameters: {
                                      'choiceChipInitial': serializeParam(
                                        'Study Tasks',
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                              ),
                            ),
                            wrapWithModel(
                              model: _model.taskCategoriesModel4,
                              updateCallback: () => safeSetState(() {}),
                              child: TaskCategoriesWidget(
                                taskProgress: _model.freelancerProgress?.length,
                                onTask: _model.freelancer!.length,
                                colorProgress: Color(0xFF6CCCF6),
                                taskTittle: 'Freelancer Tasks',
                                countTask: _model.freelancer!.length,
                                backgrountColor: Color(0xFFB5E2F6),
                                taskGroup: 'Freelancer Tasks',
                                action: () async {
                                  context.pushNamed(
                                    ToDoTaskWidget.routeName,
                                    queryParameters: {
                                      'choiceChipInitial': serializeParam(
                                        'Freelancer Tasks',
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                              ),
                            ),
                          ]
                              .divide(SizedBox(height: 15.0))
                              .addToStart(SizedBox(height: 15.0))
                              .addToEnd(SizedBox(height: 60.0)),
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
                      FFIcons.khome5,
                      color: Color(0xFF7C46F0),
                      size: 30.0,
                    ),
                    iconCalander: Icon(
                      FFIcons.kcalendar,
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