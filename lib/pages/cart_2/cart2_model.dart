import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Cart2Model extends FlutterFlowModel {
  ///  Local state fields for this page.

  List<dynamic> cartItem = [];
  void addToCartItem(dynamic item) => cartItem.add(item);
  void removeFromCartItem(dynamic item) => cartItem.remove(item);
  void removeAtIndexFromCartItem(int index) => cartItem.removeAt(index);
  void updateCartItemAtIndex(int index, Function(dynamic) updateFn) =>
      cartItem[index] = updateFn(cartItem[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - getCart] action in Cart_2 widget.
  dynamic? cart;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
