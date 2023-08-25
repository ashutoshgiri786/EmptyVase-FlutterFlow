import '/backend/api_requests/api_calls.dart';
import '/components/navbar/navbar_widget.dart';
import '/components/product_card_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GiftShopPageModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  int id = 403341967606;

  String limit = '50';

  String? nextpageinfo = '';

  String? prevpageinfo = '';

  List<dynamic> response = [];
  void addToResponse(dynamic item) => response.add(item);
  void removeFromResponse(dynamic item) => response.remove(item);
  void removeAtIndexFromResponse(int index) => response.removeAt(index);
  void updateResponseAtIndex(int index, Function(dynamic) updateFn) =>
      response[index] = updateFn(response[index]);

  List<String> choiceChip = [];
  void addToChoiceChip(String item) => choiceChip.add(item);
  void removeFromChoiceChip(String item) => choiceChip.remove(item);
  void removeAtIndexFromChoiceChip(int index) => choiceChip.removeAt(index);
  void updateChoiceChipAtIndex(int index, Function(String) updateFn) =>
      choiceChip[index] = updateFn(choiceChip[index]);

  bool searchbox = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Retrieve Collections Product)] action in GiftShopPage widget.
  ApiCallResponse? firstpageresponse;
  // State field(s) for ChoiceChips widget.
  String? choiceChipsValue;
  FormFieldController<List<String>>? choiceChipsValueController;
  // Stores action output result for [Backend Call - API (Gift Shops Category)] action in ChoiceChips widget.
  ApiCallResponse? giftShop;
  // Models for productCard dynamic component.
  late FlutterFlowDynamicModels<ProductCardModel> productCardModels;
  // Stores action output result for [Backend Call - API (Retrieve Collections Product)] action in productCard widget.
  ApiCallResponse? nextpage;
  // Model for navbar component.
  late NavbarModel navbarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    productCardModels = FlutterFlowDynamicModels(() => ProductCardModel());
    navbarModel = createModel(context, () => NavbarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    productCardModels.dispose();
    navbarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
