import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'product_card_model.dart';
export 'product_card_model.dart';

class ProductCardWidget extends StatefulWidget {
  const ProductCardWidget({
    Key? key,
    required this.productData,
    bool? islast,
    required this.getMoreProduct,
  })  : this.islast = islast ?? false,
        super(key: key);

  final dynamic productData;
  final bool islast;
  final Future<dynamic> Function()? getMoreProduct;

  @override
  _ProductCardWidgetState createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget> {
  late ProductCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductCardModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.islast) {
        await widget.getMoreProduct?.call();
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
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
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
                functions.removeletters(
                    'Product/',
                    getJsonField(
                      widget.productData,
                      r'''$.node.id''',
                    ).toString()),
                ParamType.String,
              ),
            }.withoutNulls,
          );
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 0.381,
              height: MediaQuery.sizeOf(context).height * 0.17,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: CachedNetworkImageProvider(
                    valueOrDefault<String>(
                      getJsonField(
                        widget.productData,
                        r'''$.node.images.edges[0].node.src''',
                      ),
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNuvafpok1f34VfmtLMX_0RYNYnJ-aSpv0qQ&usqp=CAU',
                    ),
                  ),
                ),
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-1.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                child: Text(
                  valueOrDefault<String>(
                    getJsonField(
                      widget.productData,
                      r'''$.node.title''',
                    ).toString(),
                    'title',
                  ).maybeHandleOverflow(maxChars: 15),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Montserrat',
                        color: Color(0xFF2B4244),
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-1.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                child: Text(
                  formatNumber(
                    double.parse(valueOrDefault<String>(
                      getJsonField(
                        widget.productData,
                        r'''$.node.variants.edges[0].node.price.amount''',
                      ).toString(),
                      '0.00',
                    )),
                    formatType: FormatType.decimal,
                    decimalType: DecimalType.automatic,
                    currency: '',
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Montserrat',
                        color: Color(0xFF2B4244),
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
            ),
          ].divide(SizedBox(height: 8.0)),
        ),
      ),
    );
  }
}
