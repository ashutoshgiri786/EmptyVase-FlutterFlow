import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/forgot_password/forgot_password_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for TextField widget.
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // Stores action output result for [Custom Action - signIn] action in Button widget.
  String? signin;
  // Stores action output result for [Custom Action - customerId] action in Button widget.
  dynamic? customerId;
  // Stores action output result for [Backend Call - API (Fetch customer info)] action in Button widget.
  ApiCallResponse? customerInfo;
  // Stores action output result for [Backend Call - API (Get Metafields)] action in Button widget.
  ApiCallResponse? wishlists;
  // Stores action output result for [Custom Action - signIn] action in Button widget.
  String? signinSignin;
  // Stores action output result for [Custom Action - customerId] action in Button widget.
  dynamic? customerIdSignIn;
  // Stores action output result for [Backend Call - API (Fetch customer info)] action in Button widget.
  ApiCallResponse? customerInfoSignIn;
  // Stores action output result for [Backend Call - API (Get Metafields)] action in Button widget.
  ApiCallResponse? wishlistsSignIn;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    emailTextController?.dispose();
    passwordTextController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
