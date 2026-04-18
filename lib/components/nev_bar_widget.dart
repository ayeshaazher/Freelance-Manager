import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nev_bar_model.dart';
export 'nev_bar_model.dart';

class NevBarWidget extends StatefulWidget {
  const NevBarWidget({
    super.key,
    this.iconHome,
    this.iconCalander,
    this.iconCopy,
  });

  final Widget? iconHome;
  final Widget? iconCalander;
  final Widget? iconCopy;

  @override
  State<NevBarWidget> createState() => _NevBarWidgetState();
}

class _NevBarWidgetState extends State<NevBarWidget> {
  late NevBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NevBarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: 95.0,
      child: Stack(
        alignment: AlignmentDirectional(0.0, 1.0),
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, 1.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(0.0),
              child: Image.asset(
                'assets/images/Rectangle_1078.png',
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: 55.0,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 0.6),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 0.0),
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
                      context.pushNamed(HomeWidget.routeName);
                    },
                    child: widget!.iconHome!,
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(CalenderWidget.routeName);
                      },
                      child: widget!.iconCalander!,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(ToDoTaskWidget.routeName);
                      },
                      child: widget!.iconCopy!,
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(Chat2MainWidget.routeName);
                    },
                    child: Icon(
                      Icons.chat_outlined,
                      color: Color(0xFF7C46F0),
                      size: 30.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, -0.6),
            child: FlutterFlowIconButton(
              borderRadius: 48.0,
              buttonSize: 48.0,
              fillColor: Color(0xFF7C46F0),
              icon: Icon(
                Icons.add,
                color: FlutterFlowTheme.of(context).info,
                size: 24.0,
              ),
              onPressed: () async {
                context.pushNamed(AddTaskWidget.routeName);
              },
            ),
          ),
        ],
      ),
    );
  }
}
