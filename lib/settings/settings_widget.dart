import '/auth/firebase_auth/auth_util.dart';
import '/components/color_container_widget.dart';
import '/components/nev_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'settings_model.dart';
export 'settings_model.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({super.key});

  static String routeName = 'settings';
  static String routePath = '/settings';

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  late SettingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  /// Shows a confirmation dialog before deleting the account.
  Future<void> _confirmAndDeleteAccount() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        title: Text(
          'Delete Account',
          style: FlutterFlowTheme.of(context).titleMedium.override(
            font: GoogleFonts.inter(
              fontWeight: FontWeight.bold,
              fontStyle:
              FlutterFlowTheme.of(context).titleMedium.fontStyle,
            ),
            color: FlutterFlowTheme.of(context).error,
            letterSpacing: 0.0,
          ),
        ),
        content: Text(
          'Are you sure you want to permanently delete your account? This action cannot be undone.',
          style: FlutterFlowTheme.of(context).bodyMedium.override(
            font: GoogleFonts.inter(
              fontWeight: FontWeight.normal,
              fontStyle:
              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
            ),
            letterSpacing: 0.0,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(
              'Cancel',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                font: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontStyle:
                  FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
                color: FlutterFlowTheme.of(context).primaryText,
                letterSpacing: 0.0,
              ),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text(
              'Delete',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                font: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontStyle:
                  FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
                color: FlutterFlowTheme.of(context).error,
                letterSpacing: 0.0,
              ),
            ),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    _model.isDeleting = true;
    safeSetState(() {});

    try {
      // Delete the Firebase Auth user account, then sign out.
      await currentUser?.delete();
      await authManager.signOut();

      context.goNamed(
        // Replace with your actual login/onboarding route name.
        'login',
      );
    } catch (e) {
      _model.isDeleting = false;
      safeSetState(() {});
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Failed to delete account. Please re-login and try again.$e',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: FlutterFlowTheme.of(context).error,
        ),
      );
    }
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
        body: Stack(
          children: [
            // ── Background gradient (same ColorContainer used on home) ──
            wrapWithModel(
              model: _model.colorContainerModel,
              updateCallback: () => safeSetState(() {}),
              child: ColorContainerWidget(),
            ),

            // ── Main scrollable content ──
            SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    // ── App bar row ──
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 12.0, 16.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FlutterFlowIconButton(
                            borderRadius: 8.0,
                            buttonSize: 48.0,
                            icon: Icon(
                              FFIcons.karrowLeft,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          Expanded(
                            child: Text(
                              'Settings',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .fontStyle,
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          // Invisible placeholder to keep title centred.
                          SizedBox(width: 48.0),
                        ],
                      ),
                    ),

                    // ── Section label ──
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 28.0, 0.0, 12.0),
                        child: Text(
                          'Account',
                          style:
                          FlutterFlowTheme.of(context).bodySmall.override(
                            font: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context)
                                .secondaryText,
                            fontSize: 12.0,
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    // ── Settings card ──
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 0.0, 16.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                          FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.06),
                              blurRadius: 12.0,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // ── Option 1 — Profile Settings ──
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(16.0)),
                              onTap: () async {
                                context.pushNamed(
                                  ProfessionsWidget.routeName,
                                  queryParameters: {
                                    'userName': serializeParam(
                                      currentUserDisplayName,
                                      ParamType.String,
                                    ),
                                    'page': serializeParam(
                                      'Next',
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 18.0, 16.0, 18.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 40.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFEDE8FB),
                                        borderRadius:
                                        BorderRadius.circular(10.0),
                                      ),
                                      child: Icon(
                                        Icons.person_outline_rounded,
                                        color: Color(0xFF7C46F0),
                                        size: 22.0,
                                      ),
                                    ),
                                    SizedBox(width: 14.0),
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Profile Settings',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                FlutterFlowTheme.of(
                                                    context)
                                                    .bodyMedium
                                                    .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(height: 2.0),
                                          Text(
                                            'Edit your personal information',
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.normal,
                                                fontStyle:
                                                FlutterFlowTheme.of(
                                                    context)
                                                    .bodySmall
                                                    .fontStyle,
                                              ),
                                              color: FlutterFlowTheme.of(
                                                  context)
                                                  .secondaryText,
                                              letterSpacing: 0.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Icon(
                                      Icons.chevron_right_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 22.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // ── Divider ──
                            Divider(
                              height: 1.0,
                              thickness: 1.0,
                              indent: 16.0,
                              endIndent: 16.0,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground
                                  .withOpacity(0.0),
                            ),

                            // ── Option 2 — Delete Account ──
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(16.0)),
                              onTap: _model.isDeleting
                                  ? null
                                  : _confirmAndDeleteAccount,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 18.0, 16.0, 18.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 40.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .error
                                            .withOpacity(0.12),
                                        borderRadius:
                                        BorderRadius.circular(10.0),
                                      ),
                                      child: _model.isDeleting
                                          ? Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2.0,
                                          color:
                                          FlutterFlowTheme.of(context)
                                              .error,
                                        ),
                                      )
                                          : Icon(
                                        Icons.delete_outline_rounded,
                                        color:
                                        FlutterFlowTheme.of(context)
                                            .error,
                                        size: 22.0,
                                      ),
                                    ),
                                    SizedBox(width: 14.0),
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Delete Account',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                FlutterFlowTheme.of(
                                                    context)
                                                    .bodyMedium
                                                    .fontStyle,
                                              ),
                                              color:
                                              FlutterFlowTheme.of(context)
                                                  .error,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(height: 2.0),
                                          Text(
                                            'Permanently remove your account',
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.normal,
                                                fontStyle:
                                                FlutterFlowTheme.of(
                                                    context)
                                                    .bodySmall
                                                    .fontStyle,
                                              ),
                                              color: FlutterFlowTheme.of(
                                                  context)
                                                  .secondaryText,
                                              letterSpacing: 0.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Icon(
                                      Icons.chevron_right_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 22.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 100.0), // space above nav bar
                  ],
                ),
              ),
            ),

            // ── Bottom navigation bar (same as home) ──
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
    );
  }
}