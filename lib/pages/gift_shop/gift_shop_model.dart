import '/backend/api_requests/api_calls.dart';
import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/request_manager.dart';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GiftShopModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  int id = 403341967606;

  int limit = 50;

  List<dynamic> response = [];
  void addToResponse(dynamic item) => response.add(item);
  void removeFromResponse(dynamic item) => response.remove(item);
  void removeAtIndexFromResponse(int index) => response.removeAt(index);
  void updateResponseAtIndex(int index, Function(dynamic) updateFn) =>
      response[index] = updateFn(response[index]);

  String nextpageinfo = '';

  String? prevpageinfo;

  int pageindex = 0;

  bool category = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API ( Collections List )] action in GiftShop widget.
  ApiCallResponse? firstpageresponse;
  // State field(s) for ChoiceChips widget.
  String? choiceChipsValue;
  FormFieldController<List<String>>? choiceChipsValueController;
  // Stores action output result for [Backend Call - API (Gift Shops Category)] action in ChoiceChips widget.
  ApiCallResponse? giftShop;
  // Stores action output result for [Backend Call - API (Flowers Category )] action in ChoiceChips widget.
  ApiCallResponse? flowerresponse;
  // Model for navbar component.
  late NavbarModel navbarModel;

  /// Query cache managers for this widget.

  final _giftShopChoiceChipsManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> giftShopChoiceChips({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _giftShopChoiceChipsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearGiftShopChoiceChipsCache() => _giftShopChoiceChipsManager.clear();
  void clearGiftShopChoiceChipsCacheKey(String? uniqueKey) =>
      _giftShopChoiceChipsManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    navbarModel = createModel(context, () => NavbarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    navbarModel.dispose();

    /// Dispose query cache managers for this widget.

    clearGiftShopChoiceChipsCache();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
