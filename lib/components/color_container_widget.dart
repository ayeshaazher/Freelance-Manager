import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'color_container_model.dart';
export 'color_container_model.dart';

class ColorContainerWidget extends StatefulWidget {
  const ColorContainerWidget({super.key});

  @override
  State<ColorContainerWidget> createState() => _ColorContainerWidgetState();
}

class _ColorContainerWidgetState extends State<ColorContainerWidget> {
  late ColorContainerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ColorContainerModel());
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
      height: MediaQuery.sizeOf(context).height * 1.0,
      child: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional(-1.08, -0.33),
            child: Container(
              width: 77.0,
              height: 70.0,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 90.0,
                    color: Color(0xFF6732FF),
                    offset: Offset(
                      0.0,
                      2.0,
                    ),
                  )
                ],
                borderRadius: BorderRadius.circular(0.0),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.01, 1.03),
            child: Container(
              width: 68.0,
              height: 62.0,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 85.0,
                    color: Color(0xFF37FB43),
                    offset: Offset(
                      0.0,
                      2.0,
                    ),
                  )
                ],
                borderRadius: BorderRadius.circular(0.0),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(-1.06, 0.34),
            child: Container(
              width: 64.0,
              height: 76.0,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 80.0,
                    color: Color(0xFF46C3F9),
                    offset: Offset(
                      0.0,
                      2.0,
                    ),
                  )
                ],
                borderRadius: BorderRadius.circular(0.0),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.98, -0.91),
            child: Container(
              width: 70.0,
              height: 76.0,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 74.0,
                    color: Color(0xFFFD832A),
                    offset: Offset(
                      0.0,
                      2.0,
                    ),
                  )
                ],
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(1.0, -0.03),
            child: Container(
              width: 68.0,
              height: 76.0,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 70.0,
                    color: Color(0xFF8BA3F4),
                    offset: Offset(
                      0.0,
                      2.0,
                    ),
                  )
                ],
                borderRadius: BorderRadius.circular(0.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
