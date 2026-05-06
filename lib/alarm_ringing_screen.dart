import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';

import 'components/color_container_widget.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';

class AlarmRingingScreen extends StatelessWidget {
  final AlarmSettings alarmSettings;

  const AlarmRingingScreen({super.key, required this.alarmSettings});

  Map<String, dynamic> get _payload {
    try {
      return jsonDecode(alarmSettings.payload ?? '{}');
    } catch (_) {
      return {};
    }
  }

  @override
  Widget build(BuildContext context) {
    final taskName  = _payload['taskName']  ?? 'Task Alarm';
    final taskGroup = _payload['taskGroup'] ?? '';
    ColorContainerModel colorContainerModel1 = createModel(context, () => ColorContainerModel());


    return MaterialApp(
      home: Scaffold(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          child: Stack(
              children: [
                const ColorContainerWidget(),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.alarm,
                        size: 80,
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),

                      SizedBox(height: 24),

                      Text(
                        taskGroup,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 18,
                        ),
                      ),

                      SizedBox(height: 8),

                      Text(
                        taskName,
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 60),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: FlutterFlowTheme.of(context).primary,
                          foregroundColor: FlutterFlowTheme.of(context).primaryBackground,
                          minimumSize: Size(200, 56),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        onPressed: () async {
                          await Alarm.stop(alarmSettings.id);
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Stop Alarm',
                          style: FlutterFlowTheme.of(context).titleMedium.override(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ),
              ],
            ),
          ),
        ),
    );
  }

}