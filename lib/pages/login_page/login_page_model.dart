import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/forgot_password/forgot_password_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginPageModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  UserRecord? userDoc;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for Email widget.
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  String? _emailControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // Stores action output result for [Firestore Query - Query a collection] action in Email widget.
  UserRecord? userDocument;
  // State field(s) for Password widget.
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  String? _passwordControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 6) {
      return 'Requires at least 6 characters.';
    }

    return null;
  }

  // Stores action output result for [Custom Action - signIn] action in Login widget.
  String? signin;
  // Stores action output result for [Custom Action - customerId] action in Login widget.
  dynamic? customerId;
  // Stores action output result for [Backend Call - API (Fetch customer info)] action in Login widget.
  ApiCallResponse? customerInfo;
  // Stores action output result for [Backend Call - API (Get Metafields)] action in Login widget.
  ApiCallResponse? wishlists;
  // Stores action output result for [Custom Action - signIn] action in SignUpButton widget.
  String? signinSignin;
  // Stores action output result for [Custom Action - customerId] action in SignUpButton widget.
  dynamic? customerIdSignIn;
  // Stores action output result for [Backend Call - API (Fetch customer info)] action in SignUpButton widget.
  ApiCallResponse? customerInfoSignIn;
  // Stores action output result for [Backend Call - API (Get Metafields)] action in SignUpButton widget.
  ApiCallResponse? wishlistsSignIn;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    emailControllerValidator = _emailControllerValidator;
    passwordVisibility = false;
    passwordControllerValidator = _passwordControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    emailController?.dispose();
    passwordController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
