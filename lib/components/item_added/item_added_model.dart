import '/components/gift_shop_collection_card_widget.dart';
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

class ItemAddedModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  List<dynamic> response = [];
  void addToResponse(dynamic item) => response.add(item);
  void removeFromResponse(dynamic item) => response.remove(item);
  void removeAtIndexFromResponse(int index) => response.removeAt(index);
  void updateResponseAtIndex(int index, Function(dynamic) updateFn) =>
      response[index] = updateFn(response[index]);

  String? nextPageInfo = '   ';

  bool hasNextPAge = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - retreiveCollectionProduct] action in Item_Added widget.
  dynamic? firstresponse;
  // Models for giftShopCollectionCard dynamic component.
  late FlutterFlowDynamicModels<GiftShopCollectionCardModel>
      giftShopCollectionCardModels;
  // Stores action output result for [Custom Action - retreiveCollectionProductNextPage] action in giftShopCollectionCard widget.
  dynamic? nextpageinfo;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    giftShopCollectionCardModels =
        FlutterFlowDynamicModels(() => GiftShopCollectionCardModel());
  }

  void dispose() {
    giftShopCollectionCardModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
