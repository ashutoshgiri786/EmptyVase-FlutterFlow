import '/backend/api_requests/api_calls.dart';
import '/components/item_added/item_added_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class ItemsPageCartModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool expaded = false;

  String productid = ' ';

  bool productVariants = true;

  bool wishlist = false;

  String variantId = '';

  List<dynamic> price = [];
  void addToPrice(dynamic item) => price.add(item);
  void removeFromPrice(dynamic item) => price.remove(item);
  void removeAtIndexFromPrice(int index) => price.removeAt(index);
  void updatePriceAtIndex(int index, Function(dynamic) updateFn) =>
      price[index] = updateFn(price[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Product)] action in items_page_cart widget.
  ApiCallResponse? prductdetails;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Backend Call - API (Create Metafields)] action in ToggleIcon widget.
  ApiCallResponse? addwishlist;
  // Stores action output result for [Backend Call - API (Retrieve Specific Metafield)] action in ToggleIcon widget.
  ApiCallResponse? productMetafieldData;
  // Stores action output result for [Backend Call - API (Delete Metafields)] action in ToggleIcon widget.
  ApiCallResponse? deleteMetafield;
  // Stores action output result for [Custom Action - createCart] action in Button widget.
  dynamic? out1;
  // Stores action output result for [Custom Action - createCart] action in Button widget.
  dynamic? out2;
  // Stores action output result for [Custom Action - addMoreItemsInCart] action in Button widget.
  dynamic? added1;
  // Stores action output result for [Custom Action - addMoreItemsInCart] action in Button widget.
  dynamic? added2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
