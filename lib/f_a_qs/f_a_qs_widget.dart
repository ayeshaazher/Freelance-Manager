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

  // All FAQ data in one place — easy to extend later.
  static const List<Map<String, String>> _faqs = [
    {
      'question': 'What is Freelancer Task Manager?',
      'answer':
      'Freelancer Task Manager is a task and project management tool designed specifically for freelancers. It enables you to organize projects, manage tasks, track time, communicate with clients, and streamline client management—all within a user-friendly interface.',
    },
    {
      'question': 'Who is this tool designed for?',
      'answer':
      'This tool is built for freelancers who need to juggle multiple clients and projects. Whether you\'re a solo consultant, designer, developer, writer, or any other freelancer, it offers the tools you need to stay organized and productive.',
    },
    {
      'question': 'What features does Freelancer Task Manager include?',
      'answer':
      'Key features include:\n\n• Task & Project Management: Set up projects, assign tasks, and track progress.\n• Time Tracking: Log hours worked on each project to simplify invoicing.\n• Client Chat: Communicate directly with clients within the app.\n• Client Management: Manage multiple clients efficiently with dedicated spaces for each client\'s projects and communications.',
    },
    {
      'question': 'How is this different from other task management tools?',
      'answer':
      'Freelancer Task Manager is tailored to freelancers, offering an intuitive way to handle multiple clients without extra complexity. It\'s designed for the specific needs of freelancers, such as managing client projects separately and keeping communication organized.',
    },
    {
      'question': 'Is the chat feature secure?',
      'answer':
      'Yes, the chat feature is secure and encrypted, ensuring that all communications between you and your clients remain private and protected.',
    },
    {
      'question': 'Can I use this tool to generate invoices?',
      'answer':
      'While the current version focuses on project, task, and time management, we\'re working on integrating invoicing in the future to streamline billing processes.',
    },
    {
      'question': 'Can I use Freelancer Task Manager on mobile devices?',
      'answer':
      'Yes, Freelancer Task Manager is accessible on both desktop and mobile, allowing you to manage your work and communicate with clients on the go.',
    },
    {
      'question': 'Is my data safe with this Task Manager?',
      'answer':
      'Absolutely. We prioritize data security, employing encryption and regular security checks to ensure your information is protected.',
    },
    {
      'question': 'What customer support options are available?',
      'answer':
      'Our customer support team is available via chat and email to assist you with any issues or questions.',
    },
    {
      'question': 'Is there a calendar view?',
      'answer':
      'Yes, our Task Manager includes a calendar view to help you visually manage deadlines, meetings, and project milestones in one place.',
    },
  ];

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

  void _toggleItem(int index) {
    safeSetState(() {
      _model.expandedIndex = (_model.expandedIndex == index) ? -1 : index;
    });
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
                  // ── App bar ──────────────────────────────────────────────
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
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
                          style: FlutterFlowTheme.of(context).bodyMedium.override(
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

                  // ── FAQ accordion list ───────────────────────────────────
                  Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.only(top: 15.0, bottom: 24.0),
                      itemCount: _faqs.length,
                      separatorBuilder: (_, __) => Divider(
                        thickness: 2.0,
                        indent: 15.0,
                        endIndent: 15.0,
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                      itemBuilder: (context, index) {
                        final isExpanded = _model.expandedIndex == index;
                        final faq = _faqs[index];

                        return _FAQItem(
                          question: faq['question']!,
                          answer: faq['answer']!,
                          isExpanded: isExpanded,
                          onTap: () => _toggleItem(index),
                        );
                      },
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

// ── Private reusable FAQ item widget ────────────────────────────────────────

class _FAQItem extends StatelessWidget {
  const _FAQItem({
    required this.question,
    required this.answer,
    required this.isExpanded,
    required this.onTap,
  });

  final String question;
  final String answer;
  final bool isExpanded;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Question row ──────────────────────────────────────────────
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Animated rotating arrow
                AnimatedRotation(
                  turns: isExpanded ? 0.25 : 0.0, // 0° → 90° when open
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  child: FlutterFlowIconButton(
                    borderColor: FlutterFlowTheme.of(context).primaryText,
                    borderRadius: 30.0,
                    borderWidth: 2.0,
                    buttonSize: 31.0,
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 17.0,
                    ),
                    onPressed: onTap,
                  ),
                ),
                SizedBox(width: 7.0),
                Expanded(
                  child: Text(
                    question,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      fontStyle:
                      FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                  ),
                ),
              ],
            ),

            // ── Animated answer panel ─────────────────────────────────────
            AnimatedCrossFade(
              firstChild: const SizedBox.shrink(),
              secondChild: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(38.0, 8.0, 4.0, 8.0),
                child: Text(
                  answer,
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                    font: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontStyle:
                      FlutterFlowTheme.of(context).bodySmall.fontStyle,
                    ),
                    fontSize: 14.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w400,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    fontStyle:
                    FlutterFlowTheme.of(context).bodySmall.fontStyle,
                  ),
                ),
              ),
              crossFadeState:
              isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 250),
              sizeCurve: Curves.easeInOut,
            ),
          ],
        ),
      ),
    );
  }
}