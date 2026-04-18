import '/components/color_container_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'f_a_qs_model.dart';
export 'f_a_qs_model.dart';

class FAQsWidget extends StatefulWidget {
  const FAQsWidget({super.key});

  static String routeName = 'FAQs';
  static String routePath = '/fAQs';

  @override
  State<FAQsWidget> createState() => _FAQsWidgetState();
}

class _FAQsWidgetState extends State<FAQsWidget> {
  late FAQsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FAQsModel());
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
                          'FAQs',
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
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 15.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('Freelancer Task Manager'),
                                    content: Text(
                                        'Freelancer Task Manager is a task and project management tool designed specifically for freelancers. It enables you to organize projects, manage tasks, track time, communicate with clients, and streamline client management—all within a user-friendly interface.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text('Ok'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Flexible(
                                  child: FlutterFlowIconButton(
                                    borderColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    borderRadius: 30.0,
                                    borderWidth: 2.0,
                                    buttonSize: 31.0,
                                    icon: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 17.0,
                                    ),
                                    onPressed: () {
                                      print('IconButton pressed ...');
                                    },
                                  ),
                                ),
                                Text(
                                  'What is Freelancer Task Manager?',
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
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ]
                                  .divide(SizedBox(width: 7.0))
                                  .addToStart(SizedBox(width: 12.0)),
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 2.0,
                          indent: 15.0,
                          endIndent: 15.0,
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  content: Text(
                                      'This tool is built for freelancers who need to juggle multiple clients and projects. Whether you\'re a solo consultant, designer, developer, writer, or any other freelancer, it offers the tools you need to stay organized and productive.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                child: FlutterFlowIconButton(
                                  borderColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  borderRadius: 30.0,
                                  borderWidth: 2.0,
                                  buttonSize: 31.0,
                                  icon: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 17.0,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                              ),
                              Text(
                                'Who is this tool designed for?',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ]
                                .divide(SizedBox(width: 7.0))
                                .addToStart(SizedBox(width: 12.0)),
                          ),
                        ),
                        Divider(
                          thickness: 2.0,
                          indent: 15.0,
                          endIndent: 15.0,
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Features'),
                                  content: Text(
                                      'Key features include:  Task and Project Management: Set up projects, assign tasks, and track progress. Time Tracking: Log hours worked on each project to simplify invoicing. Client Chat: Communicate directly with clients within the app, keeping all project discussions in one place. Client Management: Manage multiple clients efficiently, with dedicated spaces for each client’s projects and communications.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                child: FlutterFlowIconButton(
                                  borderColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  borderRadius: 30.0,
                                  borderWidth: 2.0,
                                  buttonSize: 31.0,
                                  icon: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 17.0,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                              ),
                              Text(
                                'What features does Freelancer Task\nManager include?',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ]
                                .divide(SizedBox(width: 7.0))
                                .addToStart(SizedBox(width: 12.0)),
                          ),
                        ),
                        Divider(
                          thickness: 2.0,
                          indent: 15.0,
                          endIndent: 15.0,
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Different From Others'),
                                  content: Text(
                                      'Freelancer Task Manager is tailored to freelancers, offering an intuitive way to handle multiple clients without extra complexity. It’s designed for the specific needs of freelancers, such as managing client projects separately and keeping communication organized.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                child: FlutterFlowIconButton(
                                  borderColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  borderRadius: 30.0,
                                  borderWidth: 2.0,
                                  buttonSize: 31.0,
                                  icon: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 17.0,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                              ),
                              Text(
                                'How is this different from other task\nmanagement tools?',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ]
                                .divide(SizedBox(width: 7.0))
                                .addToStart(SizedBox(width: 12.0)),
                          ),
                        ),
                        Divider(
                          thickness: 2.0,
                          indent: 15.0,
                          endIndent: 15.0,
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Secure Chat Feature'),
                                  content: Text(
                                      'Yes, the chat feature is secure and encrypted, ensuring that all communications between you and your clients remain private and protected.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                child: FlutterFlowIconButton(
                                  borderColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  borderRadius: 30.0,
                                  borderWidth: 2.0,
                                  buttonSize: 31.0,
                                  icon: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 17.0,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                              ),
                              Text(
                                'Is the chat feature secure?',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ]
                                .divide(SizedBox(width: 7.0))
                                .addToStart(SizedBox(width: 12.0)),
                          ),
                        ),
                        Divider(
                          thickness: 2.0,
                          indent: 15.0,
                          endIndent: 15.0,
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Tool to Generate Invoices'),
                                  content: Text(
                                      'While the current version focuses on project, task, and time management, we’re working on integrating invoicing in the future to streamline billing processes.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                child: FlutterFlowIconButton(
                                  borderColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  borderRadius: 30.0,
                                  borderWidth: 2.0,
                                  buttonSize: 31.0,
                                  icon: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 17.0,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                              ),
                              Text(
                                'Can I use this tool to generate invoices?',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ]
                                .divide(SizedBox(width: 7.0))
                                .addToStart(SizedBox(width: 12.0)),
                          ),
                        ),
                        Divider(
                          thickness: 2.0,
                          indent: 15.0,
                          endIndent: 15.0,
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Mobile devices'),
                                  content: Text(
                                      'Yes, Freelancer Task Manager is accessible on both desktop and mobile, allowing you to manage your work and communicate with clients on the go.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                child: FlutterFlowIconButton(
                                  borderColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  borderRadius: 30.0,
                                  borderWidth: 2.0,
                                  buttonSize: 31.0,
                                  icon: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 17.0,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                              ),
                              Text(
                                'Can I use Freelancer Task Manager on\nmobile devices?',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ]
                                .divide(SizedBox(width: 7.0))
                                .addToStart(SizedBox(width: 12.0)),
                          ),
                        ),
                        Divider(
                          thickness: 2.0,
                          indent: 15.0,
                          endIndent: 15.0,
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Data Safety'),
                                  content: Text(
                                      'Absolutely. We prioritize data security, employing encryption and regular security checks to ensure your information is protected.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                child: FlutterFlowIconButton(
                                  borderColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  borderRadius: 30.0,
                                  borderWidth: 2.0,
                                  buttonSize: 31.0,
                                  icon: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 17.0,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                              ),
                              Text(
                                'Is my data safe with this Task\nManager?',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ]
                                .divide(SizedBox(width: 7.0))
                                .addToStart(SizedBox(width: 12.0)),
                          ),
                        ),
                        Divider(
                          thickness: 2.0,
                          indent: 15.0,
                          endIndent: 15.0,
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Customer Support '),
                                  content: Text(
                                      'Our customer support team is available via chat and email to assist you with any issues or questions.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                child: FlutterFlowIconButton(
                                  borderColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  borderRadius: 30.0,
                                  borderWidth: 2.0,
                                  buttonSize: 31.0,
                                  icon: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 17.0,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                              ),
                              Text(
                                'What customer support options are\navailable?',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ]
                                .divide(SizedBox(width: 7.0))
                                .addToStart(SizedBox(width: 12.0)),
                          ),
                        ),
                        Divider(
                          thickness: 2.0,
                          indent: 15.0,
                          endIndent: 15.0,
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Calender View'),
                                  content: Text(
                                      'Yes, Our Task Manager includes a calendar view to help you visually manage deadlines, meetings, and project milestones in one place.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                child: FlutterFlowIconButton(
                                  borderColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  borderRadius: 30.0,
                                  borderWidth: 2.0,
                                  buttonSize: 31.0,
                                  icon: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 17.0,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                              ),
                              Text(
                                'Is there a calendar view?',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ]
                                .divide(SizedBox(width: 7.0))
                                .addToStart(SizedBox(width: 12.0)),
                          ),
                        ),
                      ],
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
