import '/components/color_container_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'lets_start_model.dart';
export 'lets_start_model.dart';

class LetsStartWidget extends StatefulWidget {
  const LetsStartWidget({super.key});

  static String routeName = 'letsStart';
  static String routePath = '/letsStart';

  @override
  State<LetsStartWidget> createState() => _LetsStartWidgetState();
}

class _LetsStartWidgetState extends State<LetsStartWidget> {
  late LetsStartModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LetsStartModel());
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
        body: Stack(
          children: [
            wrapWithModel(
              model: _model.colorContainerModel,
              updateCallback: () => safeSetState(() {}),
              child: ColorContainerWidget(),
            ),
            Align(
              alignment: AlignmentDirectional(0.15, -0.68),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: Image.asset(
                  'assets/images/Group_33631.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.09, -0.79),
              child: Container(
                width: 5.0,
                height: 5.0,
                decoration: BoxDecoration(
                  color: Color(0xFFBE9FFF),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-0.32, 0.08),
              child: Container(
                width: 8.0,
                height: 8.0,
                decoration: BoxDecoration(
                  color: Color(0xFFFFD7E4),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-0.13, 0.11),
              child: Container(
                width: 5.0,
                height: 5.0,
                decoration: BoxDecoration(
                  color: Color(0xFFA4E7F9),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.49, 0.03),
              child: Container(
                width: 6.0,
                height: 6.0,
                decoration: BoxDecoration(
                  color: Color(0xFF5FF994),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.33, 0.08),
              child: Container(
                width: 9.0,
                height: 9.0,
                decoration: BoxDecoration(
                  color: Color(0xFFEAED2A),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.4, -0.87),
              child: Container(
                width: 9.0,
                height: 9.0,
                decoration: BoxDecoration(
                  color: Color(0xFF92DEFF),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.32),
              child: Text(
                'Task Management &\nTo-Do List',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      fontSize: 25.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.5),
              child: Text(
                'This productive tool is designed to help\nyou better manage your task \nproject-wise conveniently!',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.inter(
                        fontWeight: FontWeight.normal,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      color: Color(0xFF5D6469),
                      fontSize: 14.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.normal,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.82),
              child: FFButtonWidget(
                onPressed: () async {
                  context.goNamed(SignupWidget.routeName);
                },
                text: 'Let’s Start',
                icon: Icon(
                  FFIcons.karrowLeft,
                  size: 24.0,
                ),
                options: FFButtonOptions(
                  width: MediaQuery.sizeOf(context).width * 0.85,
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconAlignment: IconAlignment.end,
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: Color(0xFF5F33E1),
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        font: GoogleFonts.interTight(
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
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
      ),
    );
  }
}
