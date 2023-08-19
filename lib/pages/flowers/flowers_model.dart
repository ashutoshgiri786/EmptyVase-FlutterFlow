import '/backend/api_requests/api_calls.dart';
import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FlowersModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  int collections = 5;

  String? nextpageInfo = '';

  String? prevpageinfo = '';

  List<dynamic> response = [];
  void addToResponse(dynamic item) => response.add(item);
  void removeFromResponse(dynamic item) => response.remove(item);
  void removeAtIndexFromResponse(int index) => response.removeAt(index);
  void updateResponseAtIndex(int index, Function(dynamic) updateFn) =>
      response[index] = updateFn(response[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Retrieve Collections Product)] action in Flowers widget.
  ApiCallResponse? firstResponse;
  // State field(s) for ChoiceChips widget.
  String? choiceChipsValue;
  FormFieldController<List<String>>? choiceChipsValueController;
  // Stores action output result for [Backend Call - API (Retrieve Collections Product)] action in Button widget.
  ApiCallResponse? prevpageresponse;
  // Stores action output result for [Backend Call - API (Retrieve Collections Product)] action in Button widget.
  ApiCallResponse? nextpageresponse;
  // Model for navbar component.
  late NavbarModel navbarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    navbarModel = createModel(context, () => NavbarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    navbarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
