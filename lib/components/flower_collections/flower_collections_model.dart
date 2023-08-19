import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FlowerCollectionsModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  bool condition = false;

  bool conditon2 = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API ( Collections List )] action in Flower_Collections widget.
  ApiCallResponse? apiresult;
  // Stores action output result for [Backend Call - API (Retrieve Collections Product)] action in Flower_Collections widget.
  ApiCallResponse? apiResultjao;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
