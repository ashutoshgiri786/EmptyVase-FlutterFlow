import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'gift_shop_collection_card_model.dart';
export 'gift_shop_collection_card_model.dart';

class GiftShopCollectionCardWidget extends StatefulWidget {
  const GiftShopCollectionCardWidget({
    Key? key,
    bool? isLast,
    this.productData,
    required this.getNextProducts,
  })  : this.isLast = isLast ?? false,
        super(key: key);

  final bool isLast;
  final dynamic productData;
  final Future<dynamic> Function()? getNextProducts;

  @override
  _GiftShopCollectionCardWidgetState createState() =>
      _GiftShopCollectionCardWidgetState();
}

class _GiftShopCollectionCardWidgetState
    extends State<GiftShopCollectionCardWidget> {
  late GiftShopCollectionCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GiftShopCollectionCardModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.isLast) {
        await widget.getNextProducts?.call();
      }
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          context.pushNamed(
            'items_page_cart',
            queryParameters: {
              'id': serializeParam(
                getJsonField(
                  widget.productData,
                  r'''$.node.images.edges[0].node.src''',
                ).toString(),
                ParamType.String,
              ),
            }.withoutNulls,
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.network(
            getJsonField(
              widget.productData,
              r'''$.node.images.edges[0].node.src''',
            ),
            width: 146.0,
            height: 136.0,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
