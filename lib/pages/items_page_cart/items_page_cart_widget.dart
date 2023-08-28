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
import 'items_page_cart_model.dart';
export 'items_page_cart_model.dart';

class ItemsPageCartWidget extends StatefulWidget {
  const ItemsPageCartWidget({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String? id;

  @override
  _ItemsPageCartWidgetState createState() => _ItemsPageCartWidgetState();
}

class _ItemsPageCartWidgetState extends State<ItemsPageCartWidget> {
  late ItemsPageCartModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemsPageCartModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.productid = widget.id!;
      });
      _model.prductdetails = await ShopifyAdminGroup.productCall.call(
        prId: widget.id,
      );
      setState(() {
        _model.productVariants = functions
            .productvariants((ShopifyAdminGroup.productCall.variantstitle(
          (_model.prductdetails?.jsonBody ?? ''),
        ) as List)
                .map<String>((s) => s.toString())
                .toList()!
                .toList())!;
      });
      if (FFAppState().wishlistProducts.contains(ShopifyAdminGroup.productCall
          .productId(
            (_model.prductdetails?.jsonBody ?? ''),
          )
          .toString()
          .toString())) {
        setState(() {
          _model.wishlist = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: ShopifyAdminGroup.productCall.call(
        prId: _model.productid,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final itemsPageCartProductResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final productImage =
                                (ShopifyAdminGroup.productCall.images(
                                      (_model.prductdetails?.jsonBody ?? ''),
                                    ) as List)
                                        .map<String>((s) => s.toString())
                                        .toList()
                                        ?.toList() ??
                                    [];
                            return SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(productImage.length,
                                    (productImageIndex) {
                                  final productImageItem =
                                      productImage[productImageIndex];
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      productImageItem,
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.5,
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                }),
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FlutterFlowIconButton(
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              fillColor: Color(0xFF013220),
                              icon: Icon(
                                Icons.close_outlined,
                                color: Colors.white,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                context.safePop();
                              },
                            ),
                            Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Builder(
                                    builder: (context) => FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 20.0,
                                      borderWidth: 1.0,
                                      buttonSize: 40.0,
                                      fillColor: Color(0xFF013220),
                                      icon: Icon(
                                        Icons.ios_share_sharp,
                                        color: Colors.white,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        await Share.share(
                                          'emptyvase://emptyvase.com${GoRouter.of(context).location}',
                                          sharePositionOrigin:
                                              getWidgetBoundingBox(context),
                                        );
                                      },
                                    ),
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    fillColor: Color(0xFF013220),
                                    icon: Icon(
                                      Icons.shopping_cart_outlined,
                                      color: Colors.white,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      context.pushNamed('Cart_2');
                                    },
                                  ),
                                ].divide(SizedBox(width: 10.0)),
                              ),
                            ),
                          ]
                              .divide(SizedBox(width: 10.0))
                              .around(SizedBox(width: 10.0)),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(
                      color: Color(0xE0F2EFEB),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0),
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ToggleIcon(
                              onPressed: () async {
                                setState(
                                    () => _model.expaded = !_model.expaded);
                              },
                              value: _model.expaded,
                              onIcon: Icon(
                                Icons.keyboard_arrow_down_sharp,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 25.0,
                              ),
                              offIcon: Icon(
                                Icons.keyboard_arrow_up,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 25.0,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, -1.0),
                              child: Text(
                                ShopifyAdminGroup.productCall
                                    .productitle(
                                      itemsPageCartProductResponse.jsonBody,
                                    )
                                    .toString(),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                            if (_model.price.length > 0)
                              Align(
                                alignment: AlignmentDirectional(-1.0, -1.0),
                                child: Text(
                                  formatNumber(
                                    double.parse(_model.price.first.toString()),
                                    formatType: FormatType.decimal,
                                    decimalType: DecimalType.automatic,
                                    currency: '',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            if (_model.price.length <= 0)
                              Align(
                                alignment: AlignmentDirectional(-1.0, -1.0),
                                child: Text(
                                  formatNumber(
                                    double.parse(ShopifyAdminGroup.productCall
                                        .price(
                                          (_model.prductdetails?.jsonBody ??
                                              ''),
                                        )
                                        .toString()),
                                    formatType: FormatType.decimal,
                                    decimalType: DecimalType.automatic,
                                    currency: '',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            if (_model.expaded == true)
                              Html(
                                data: getJsonField(
                                  itemsPageCartProductResponse.jsonBody,
                                  r'''$.product.body_html''',
                                ).toString(),
                              ),
                            if (_model.expaded)
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  if (_model.productVariants == false)
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, -1.0),
                                      child: FlutterFlowDropDown<String>(
                                        controller: _model
                                                .dropDownValueController ??=
                                            FormFieldController<String>(null),
                                        options: (ShopifyAdminGroup.productCall
                                                .variantstitle(
                                          itemsPageCartProductResponse.jsonBody,
                                        ) as List)
                                            .map<String>((s) => s.toString())
                                            .toList()!,
                                        onChanged: (val) async {
                                          setState(
                                              () => _model.dropDownValue = val);
                                          setState(() {
                                            _model.price = functions
                                                .getVariantsIdAndPrice(
                                                    _model.dropDownValue!,
                                                    ShopifyAdminGroup
                                                        .productCall
                                                        .variants(
                                                          (_model.prductdetails
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )!
                                                        .toList())
                                                .toList()
                                                .cast<dynamic>();
                                          });
                                        },
                                        width: 159.0,
                                        height: 50.0,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Montserrat',
                                              fontSize: 12.0,
                                            ),
                                        hintText: 'Select Your Size',
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                        elevation: 2.0,
                                        borderColor: Colors.transparent,
                                        borderWidth: 2.0,
                                        borderRadius: 8.0,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 4.0, 16.0, 4.0),
                                        hidesUnderline: true,
                                        isSearchable: false,
                                        isMultiSelect: false,
                                      ),
                                    ),
                                  ToggleIcon(
                                    onPressed: () async {
                                      setState(() =>
                                          _model.wishlist = !_model.wishlist);
                                      if (_model.wishlist) {
                                        _model.addwishlist =
                                            await ShopifyAdminGroup
                                                .createMetafieldsCall
                                                .call(
                                          productId: ShopifyAdminGroup
                                              .productCall
                                              .productId(
                                            (_model.prductdetails?.jsonBody ??
                                                ''),
                                          ),
                                          customerId: FFAppState().customerId,
                                          productVariant: ShopifyAdminGroup
                                              .productCall
                                              .productVariant(
                                            (_model.prductdetails?.jsonBody ??
                                                ''),
                                          ),
                                        );
                                        setState(() {
                                          FFAppState().addToWishlistProducts(
                                              ShopifyAdminGroup.productCall
                                                  .productId(
                                                    (_model.prductdetails
                                                            ?.jsonBody ??
                                                        ''),
                                                  )
                                                  .toString());
                                        });
                                      } else {
                                        _model.productMetafieldData =
                                            await ShopifyAdminGroup
                                                .retrieveSpecificMetafieldCall
                                                .call(
                                          customerId: FFAppState().customerId,
                                          productid: widget.id,
                                          productVariant:
                                              ShopifyAdminGroup.productCall
                                                  .productVariant(
                                                    itemsPageCartProductResponse
                                                        .jsonBody,
                                                  )
                                                  .toString(),
                                        );
                                        _model.deleteMetafield =
                                            await ShopifyAdminGroup
                                                .deleteMetafieldsCall
                                                .call(
                                          customerId: FFAppState().customerId,
                                          metafieldId: ShopifyAdminGroup
                                              .retrieveSpecificMetafieldCall
                                              .metafieldId(
                                                (_model.productMetafieldData
                                                        ?.jsonBody ??
                                                    ''),
                                              )
                                              .toString(),
                                        );
                                      }

                                      setState(() {});
                                    },
                                    value: _model.wishlist,
                                    onIcon: Icon(
                                      Icons.favorite,
                                      color: Color(0xFFFA0038),
                                      size: 25.0,
                                    ),
                                    offIcon: Icon(
                                      Icons.favorite_border,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 25.0,
                                    ),
                                  ),
                                ],
                              ),
                            FFButtonWidget(
                              onPressed: () async {
                                if (FFAppState().cartId == null ||
                                    FFAppState().cartId == '') {
                                  if (_model.price.length > 0) {
                                    _model.out1 = await actions.createCart(
                                      _model.price.last.toString(),
                                      1,
                                    );
                                    setState(() {
                                      FFAppState().cartId = getJsonField(
                                        _model.out1,
                                        r'''$.cart.id''',
                                      ).toString();
                                    });
                                  } else {
                                    _model.out2 = await actions.createCart(
                                      ShopifyAdminGroup.productCall
                                          .productVariant(
                                            itemsPageCartProductResponse
                                                .jsonBody,
                                          )
                                          .toString(),
                                      1,
                                    );
                                    setState(() {
                                      FFAppState().cartId = getJsonField(
                                        _model.out2,
                                        r'''$.cart.id''',
                                      ).toString();
                                    });
                                  }
                                } else {
                                  if (_model.price.length > 0) {
                                    _model.added1 =
                                        await actions.addMoreItemsInCart(
                                      _model.price.last.toString(),
                                      1,
                                    );
                                  } else {
                                    _model.added2 =
                                        await actions.addMoreItemsInCart(
                                      ShopifyAdminGroup.productCall
                                          .productVariant(
                                            itemsPageCartProductResponse
                                                .jsonBody,
                                          )
                                          .toString(),
                                      1,
                                    );
                                  }
                                }

                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () => FocusScope.of(context)
                                          .requestFocus(_model.unfocusNode),
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: ItemAddedWidget(
                                          productimage: ShopifyAdminGroup
                                              .productCall
                                              .coverimage(
                                            itemsPageCartProductResponse
                                                .jsonBody,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => setState(() {}));

                                setState(() {});
                              },
                              text: 'ADD',
                              icon: Icon(
                                Icons.shopping_cart_outlined,
                                size: 15.0,
                              ),
                              options: FFButtonOptions(
                                width: 313.0,
                                height: 50.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0xFF2B4244),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(80.0),
                              ),
                            ),
                          ]
                              .divide(SizedBox(height: 20.0))
                              .around(SizedBox(height: 20.0)),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
