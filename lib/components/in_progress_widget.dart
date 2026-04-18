import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'in_progress_model.dart';
export 'in_progress_model.dart';

class InProgressWidget extends StatefulWidget {
  const InProgressWidget({
    super.key,
    required this.taskProgress,
    this.onTask,
    required this.color,
    required this.tittle,
    required this.description,
    required this.progressColor,
    required this.taskGroup,
    required this.action,
  });

  final int? taskProgress;
  final int? onTask;
  final Color? color;
  final String? tittle;
  final String? description;
  final Color? progressColor;
  final String? taskGroup;
  final Future Function()? action;

  @override
  State<InProgressWidget> createState() => _InProgressWidgetState();
}

class _InProgressWidgetState extends State<InProgressWidget> {
  late InProgressModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InProgressModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        await widget.action?.call();
      },
      child: Container(
        width: 155.0,
        height: 114.0,
        decoration: BoxDecoration(
          color: valueOrDefault<Color>(
            widget!.color,
            Color(0xFF7C46F0),
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              valueOrDefault<String>(
                widget!.tittle,
                'tittle',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    fontSize: 13.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 19.0, 0.0),
              child: Text(
                valueOrDefault<String>(
                  widget!.description,
                  'description',
                ),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.inter(
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      fontSize: 17.0,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
              child: LinearPercentIndicator(
                percent: valueOrDefault<double>(
                  (int var1, int var2) {
                    return var2 != 0 ? var1 / var2 : 0.0;
                  }(widget!.taskProgress!, widget!.onTask!),
                  0.0,
                ),
                width: 135.0,
                lineHeight: 12.0,
                animation: true,
                animateFromLastPercent: true,
                progressColor: widget!.progressColor,
                backgroundColor: FlutterFlowTheme.of(context).accent4,
                center: Text(
                  formatNumber(
                    (int var1, int var2) {
                      return var2 != 0 ? var1 / var2 : 0.0;
                    }(widget!.taskProgress!, widget!.onTask!),
                    formatType: FormatType.percent,
                  ).maybeHandleOverflow(
                    maxChars: 6,
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        font: GoogleFonts.interTight(
                          fontWeight: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .fontStyle,
                        ),
                        fontSize: 11.0,
                        letterSpacing: 0.0,
                        fontWeight: FlutterFlowTheme.of(context)
                            .headlineSmall
                            .fontWeight,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineSmall
                            .fontStyle,
                      ),
                ),
                padding: EdgeInsets.zero,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
