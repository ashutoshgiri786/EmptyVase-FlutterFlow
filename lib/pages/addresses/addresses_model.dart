import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddressesModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  List<dynamic> addresses = [];
  void addToAddresses(dynamic item) => addresses.add(item);
  void removeFromAddresses(dynamic item) => addresses.remove(item);
  void removeAtIndexFromAddresses(int index) => addresses.removeAt(index);
  void updateAddressesAtIndex(int index, Function(dynamic) updateFn) =>
      addresses[index] = updateFn(addresses[index]);

  String? addressId;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - addressList] action in Addresses widget.
  dynamic? list;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
