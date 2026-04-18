import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'shimar_effect_model.dart';
export 'shimar_effect_model.dart';

class ShimarEffectWidget extends StatefulWidget {
  const ShimarEffectWidget({super.key});

  @override
  State<ShimarEffectWidget> createState() => _ShimarEffectWidgetState();
}

class _ShimarEffectWidgetState extends State<ShimarEffectWidget>
    with TickerProviderStateMixin {
  late ShimarEffectModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShimarEffectModel());

    animationsMap.addAll({
      'imageOnPageLoadAnimation1': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: Offset(0.0, 100.0),
            end: Offset(0.0, -100.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: 0.5,
            end: 1.0,
          ),
        ],
      ),
      'imageOnPageLoadAnimation2': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 1000.0.ms,
            begin: Offset(0.0, 100.0),
            end: Offset(0.0, -100.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 2.0.ms,
            duration: 1000.0.ms,
            begin: 0.5,
            end: 1.0,
          ),
        ],
      ),
      'imageOnPageLoadAnimation3': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 1000.0.ms,
            begin: Offset(0.0, 100.0),
            end: Offset(0.0, -100.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 2.0.ms,
            duration: 1000.0.ms,
            begin: 0.5,
            end: 1.0,
          ),
        ],
      ),
      'imageOnPageLoadAnimation4': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 1000.0.ms,
            begin: Offset(0.0, 100.0),
            end: Offset(0.0, -100.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 2.0.ms,
            duration: 1000.0.ms,
            begin: 0.5,
            end: 1.0,
          ),
        ],
      ),
      'imageOnPageLoadAnimation5': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 400.0.ms,
            duration: 1000.0.ms,
            begin: Offset(0.0, 100.0),
            end: Offset(0.0, -100.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 2.0.ms,
            duration: 1000.0.ms,
            begin: 0.5,
            end: 1.0,
          ),
        ],
      ),
      'imageOnPageLoadAnimation6': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 500.0.ms,
            duration: 1000.0.ms,
            begin: Offset(0.0, 100.0),
            end: Offset(0.0, -100.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 2.0.ms,
            duration: 1000.0.ms,
            begin: 0.5,
            end: 1.0,
          ),
        ],
      ),
      'imageOnPageLoadAnimation7': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 1000.0.ms,
            begin: Offset(0.0, 100.0),
            end: Offset(0.0, -100.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 2.0.ms,
            duration: 1000.0.ms,
            begin: 0.5,
            end: 1.0,
          ),
        ],
      ),
      'imageOnPageLoadAnimation8': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 700.0.ms,
            duration: 1000.0.ms,
            begin: Offset(0.0, 100.0),
            end: Offset(0.0, -100.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 2.0.ms,
            duration: 1000.0.ms,
            begin: 0.5,
            end: 1.0,
          ),
        ],
      ),
      'imageOnPageLoadAnimation9': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 800.0.ms,
            duration: 1000.0.ms,
            begin: Offset(0.0, 100.0),
            end: Offset(0.0, -100.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 2.0.ms,
            duration: 1000.0.ms,
            begin: 0.5,
            end: 1.0,
          ),
        ],
      ),
      'imageOnPageLoadAnimation10': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 900.0.ms,
            duration: 1000.0.ms,
            begin: Offset(0.0, 100.0),
            end: Offset(0.0, -100.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 2.0.ms,
            duration: 1000.0.ms,
            begin: 0.5,
            end: 1.0,
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.9,
              height: 72.0,
              decoration: BoxDecoration(
                color: Color(0xFFE9E9E9),
                borderRadius: BorderRadius.circular(14.0),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).alternate,
                ),
              ),
              child: ClipRect(
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(
                    sigmaX: 2.0,
                    sigmaY: 2.0,
                  ),
                  child: Transform.rotate(
                    angle: 110.0 * (math.pi / 180),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(
                          'assets/images/081aed2e7ddc029f940021ddb22145fc.jpg',
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 72.0,
                          fit: BoxFit.cover,
                        ),
                      ).animateOnPageLoad(
                          animationsMap['imageOnPageLoadAnimation1']!),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.9,
              height: 72.0,
              decoration: BoxDecoration(
                color: Color(0xFFE9E9E9),
                borderRadius: BorderRadius.circular(14.0),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).alternate,
                ),
              ),
              child: ClipRect(
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(
                    sigmaX: 2.0,
                    sigmaY: 2.0,
                  ),
                  child: Transform.rotate(
                    angle: 110.0 * (math.pi / 180),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(
                          'assets/images/081aed2e7ddc029f940021ddb22145fc.jpg',
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 72.0,
                          fit: BoxFit.cover,
                        ),
                      ).animateOnPageLoad(
                          animationsMap['imageOnPageLoadAnimation2']!),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.9,
              height: 72.0,
              decoration: BoxDecoration(
                color: Color(0xFFE9E9E9),
                borderRadius: BorderRadius.circular(14.0),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).alternate,
                ),
              ),
              child: ClipRect(
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(
                    sigmaX: 2.0,
                    sigmaY: 2.0,
                  ),
                  child: Transform.rotate(
                    angle: 110.0 * (math.pi / 180),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(
                          'assets/images/081aed2e7ddc029f940021ddb22145fc.jpg',
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 72.0,
                          fit: BoxFit.cover,
                        ),
                      ).animateOnPageLoad(
                          animationsMap['imageOnPageLoadAnimation3']!),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.9,
              height: 72.0,
              decoration: BoxDecoration(
                color: Color(0xFFE9E9E9),
                borderRadius: BorderRadius.circular(14.0),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).alternate,
                ),
              ),
              child: ClipRect(
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(
                    sigmaX: 2.0,
                    sigmaY: 2.0,
                  ),
                  child: Transform.rotate(
                    angle: 110.0 * (math.pi / 180),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14.0),
                        child: Image.asset(
                          'assets/images/081aed2e7ddc029f940021ddb22145fc.jpg',
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 72.0,
                          fit: BoxFit.cover,
                        ),
                      ).animateOnPageLoad(
                          animationsMap['imageOnPageLoadAnimation4']!),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.9,
              height: 72.0,
              decoration: BoxDecoration(
                color: Color(0xFFE9E9E9),
                borderRadius: BorderRadius.circular(14.0),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).alternate,
                ),
              ),
              child: ClipRect(
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(
                    sigmaX: 2.0,
                    sigmaY: 2.0,
                  ),
                  child: Transform.rotate(
                    angle: 110.0 * (math.pi / 180),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14.0),
                        child: Image.asset(
                          'assets/images/081aed2e7ddc029f940021ddb22145fc.jpg',
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 72.0,
                          fit: BoxFit.cover,
                        ),
                      ).animateOnPageLoad(
                          animationsMap['imageOnPageLoadAnimation5']!),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.9,
              height: 72.0,
              decoration: BoxDecoration(
                color: Color(0xFFE9E9E9),
                borderRadius: BorderRadius.circular(14.0),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).alternate,
                ),
              ),
              child: ClipRect(
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(
                    sigmaX: 2.0,
                    sigmaY: 2.0,
                  ),
                  child: Transform.rotate(
                    angle: 110.0 * (math.pi / 180),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14.0),
                        child: Image.asset(
                          'assets/images/081aed2e7ddc029f940021ddb22145fc.jpg',
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 72.0,
                          fit: BoxFit.cover,
                        ),
                      ).animateOnPageLoad(
                          animationsMap['imageOnPageLoadAnimation6']!),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.9,
              height: 72.0,
              decoration: BoxDecoration(
                color: Color(0xFFE9E9E9),
                borderRadius: BorderRadius.circular(14.0),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).alternate,
                ),
              ),
              child: ClipRect(
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(
                    sigmaX: 2.0,
                    sigmaY: 2.0,
                  ),
                  child: Transform.rotate(
                    angle: 110.0 * (math.pi / 180),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14.0),
                        child: Image.asset(
                          'assets/images/081aed2e7ddc029f940021ddb22145fc.jpg',
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 72.0,
                          fit: BoxFit.cover,
                        ),
                      ).animateOnPageLoad(
                          animationsMap['imageOnPageLoadAnimation7']!),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.9,
              height: 72.0,
              decoration: BoxDecoration(
                color: Color(0xFFE9E9E9),
                borderRadius: BorderRadius.circular(14.0),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).alternate,
                ),
              ),
              child: ClipRect(
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(
                    sigmaX: 2.0,
                    sigmaY: 2.0,
                  ),
                  child: Transform.rotate(
                    angle: 110.0 * (math.pi / 180),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14.0),
                        child: Image.asset(
                          'assets/images/081aed2e7ddc029f940021ddb22145fc.jpg',
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 72.0,
                          fit: BoxFit.cover,
                        ),
                      ).animateOnPageLoad(
                          animationsMap['imageOnPageLoadAnimation8']!),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.9,
              height: 72.0,
              decoration: BoxDecoration(
                color: Color(0xFFE9E9E9),
                borderRadius: BorderRadius.circular(14.0),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).alternate,
                ),
              ),
              child: ClipRect(
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(
                    sigmaX: 2.0,
                    sigmaY: 2.0,
                  ),
                  child: Transform.rotate(
                    angle: 110.0 * (math.pi / 180),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14.0),
                        child: Image.asset(
                          'assets/images/081aed2e7ddc029f940021ddb22145fc.jpg',
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 72.0,
                          fit: BoxFit.cover,
                        ),
                      ).animateOnPageLoad(
                          animationsMap['imageOnPageLoadAnimation9']!),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.9,
              height: 72.0,
              decoration: BoxDecoration(
                color: Color(0xFFE9E9E9),
                borderRadius: BorderRadius.circular(14.0),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).alternate,
                ),
              ),
              child: ClipRect(
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(
                    sigmaX: 2.0,
                    sigmaY: 2.0,
                  ),
                  child: Transform.rotate(
                    angle: 110.0 * (math.pi / 180),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14.0),
                        child: Image.asset(
                          'assets/images/081aed2e7ddc029f940021ddb22145fc.jpg',
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 72.0,
                          fit: BoxFit.cover,
                        ),
                      ).animateOnPageLoad(
                          animationsMap['imageOnPageLoadAnimation10']!),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ].divide(SizedBox(height: 12.0)).addToEnd(SizedBox(height: 30.0)),
      ),
    );
  }
}
