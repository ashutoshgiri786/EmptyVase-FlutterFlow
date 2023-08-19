import '/backend/api_requests/api_calls.dart';
import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'gift_shop_model.dart';
export 'gift_shop_model.dart';

class GiftShopWidget extends StatefulWidget {
  const GiftShopWidget({Key? key}) : super(key: key);

  @override
  _GiftShopWidgetState createState() => _GiftShopWidgetState();
}

class _GiftShopWidgetState extends State<GiftShopWidget> {
  late GiftShopModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GiftShopModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.firstpageresponse =
          await ShopifyAdminGroup.collectionsListCall.call(
        limit: 10,
      );
      if (_model.nextpageinfo != null && _model.nextpageinfo != '') {
        setState(() {
          _model.response = ShopifyAdminGroup.collectionsListCall
              .collections(
                (_model.firstpageresponse?.jsonBody ?? ''),
              )!
              .toList()
              .cast<dynamic>();
        });
      } else {
        _model.nextpageinfo = functions.removeBetween(
            'page_info=',
            '>; rel=\"next\"',
            (_model.firstpageresponse?.getHeader('link') ?? ''));
        setState(() {
          _model.response = ShopifyAdminGroup.collectionsListCall
              .collections(
                (_model.firstpageresponse?.jsonBody ?? ''),
              )!
              .toList()
              .cast<dynamic>();
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

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF2EFEB),
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.sizeOf(context).height * 0.1),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 0.1,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFF2EFEB), Colors.white],
                    stops: [0.0, 1.0],
                    begin: AlignmentDirectional(-1.0, 0.0),
                    end: AlignmentDirectional(1.0, 0),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Welcome ,\n',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: Color(0xFF2B4244),
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            TextSpan(
                              text: 'ASH',
                              style: GoogleFonts.getFont(
                                'Montserrat',
                                color: Color(0xFF2B4244),
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic,
                              ),
                            )
                          ],
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Montserrat',
                                    color: Color(0xFF2B4244),
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 10.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30.0,
                            buttonSize: 40.0,
                            icon: Icon(
                              Icons.shopping_cart_outlined,
                              color: Color(0xFF2B4244),
                              size: 30.0,
                            ),
                            onPressed: () async {
                              context.pushNamed('Cart_2');
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              centerTitle: true,
              expandedTitleScale: 1.0,
            ),
            elevation: 0.0,
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                child: FutureBuilder<ApiCallResponse>(
                  future: ShopifyAdminGroup.collectionsListCall.call(),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    final choiceChipsCollectionsListResponse = snapshot.data!;
                    return FlutterFlowChoiceChips(
                      options: [ChipData('Flowers'), ChipData('Gift')],
                      onChanged: (val) async {
                        setState(() => _model.choiceChipsValue = val?.first);
                        if (_model.choiceChipsValue == 'Gift') {
                          _model.giftShop = await ShopifyAdminGroup
                              .retrieveCollectionsProductCall
                              .call(
                            id: 230519144603,
                          );
                          setState(() {
                            _model.response =
                                ShopifyAdminGroup.retrieveCollectionsProductCall
                                    .product(
                                      (_model.giftShop?.jsonBody ?? ''),
                                    )!
                                    .toList()
                                    .cast<dynamic>();
                            _model.nextpageinfo = functions.removeBetween(
                                'page_info=',
                                '>',
                                (_model.giftShop?.getHeader('link') ?? ''));
                          });
                        } else {
                          _model.firstchoicepageresponse =
                              await ShopifyAdminGroup.collectionsListCall.call(
                            limit: 10,
                          );
                          _model.nextpageinfo = functions.removeBetween(
                              'page_info=',
                              '>; rel=\"next\"',
                              (_model.firstchoicepageresponse
                                      ?.getHeader('link') ??
                                  ''));
                          _model.response =
                              ShopifyAdminGroup.collectionsListCall
                                  .collections(
                                    (_model.firstchoicepageresponse?.jsonBody ??
                                        ''),
                                  )!
                                  .toList()
                                  .cast<dynamic>();
                        }

                        setState(() {});
                      },
                      selectedChipStyle: ChipStyle(
                        backgroundColor: Color(0xFF2B4244),
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Montserrat',
                                  color: Color(0xFFF6F6F6),
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,
                                ),
                        iconColor: Colors.white,
                        iconSize: 18.0,
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      unselectedChipStyle: ChipStyle(
                        backgroundColor: Color(0x00000000),
                        textStyle: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .override(
                              fontFamily: 'Montserrat',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                            ),
                        iconColor: Color(0x00000000),
                        iconSize: 18.0,
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      chipSpacing: 12.0,
                      rowSpacing: 12.0,
                      multiselect: false,
                      initialized: _model.choiceChipsValue != null,
                      alignment: WrapAlignment.start,
                      controller: _model.choiceChipsValueController ??=
                          FormFieldController<List<String>>(
                        ['Flowers'],
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Builder(
                        builder: (context) {
                          final products = _model.response.toList();
                          return GridView.builder(
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                              childAspectRatio: 1.0,
                            ),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: products.length,
                            itemBuilder: (context, productsIndex) {
                              final productsItem = products[productsIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (_model.choiceChipsValue == 'Gift') {
                                    context.pushNamed(
                                      'items_page_cart',
                                      queryParameters: {
                                        'id': serializeParam(
                                          getJsonField(
                                            productsItem,
                                            r'''$.id''',
                                          ),
                                          ParamType.int,
                                        ),
                                        'productDescription': serializeParam(
                                          getJsonField(
                                            productsItem,
                                            r'''$..body_html''',
                                          ).toString(),
                                          ParamType.String,
                                        ),
                                        'productName': serializeParam(
                                          getJsonField(
                                            productsItem,
                                            r'''$..title''',
                                          ).toString(),
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  } else {
                                    context.pushNamed(
                                      'SpecificProductPage',
                                      queryParameters: {
                                        'id': serializeParam(
                                          getJsonField(
                                            productsItem,
                                            r'''$..id''',
                                          ),
                                          ParamType.int,
                                        ),
                                      }.withoutNulls,
                                    );
                                  }
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.4,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.2,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: Image.network(
                                              getJsonField(
                                                productsItem,
                                                r'''$.image.src''',
                                              ),
                                            ).image,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Text(
                                        getJsonField(
                                          productsItem,
                                          r'''$..title''',
                                        ).toString(),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color: Color(0xFF2B4244),
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 8.0)),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 10.0, 10.0, 10.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (_model.choiceChipsValue == 'Gift') {
                                    _model.giftPrevPage =
                                        await ShopifyAdminGroup
                                            .retrieveCollectionsProductCall
                                            .call(
                                      id: 230519144603,
                                      pageInfo: _model.nextpageinfo,
                                    );
                                    setState(() {
                                      _model.response = ShopifyAdminGroup
                                          .retrieveCollectionsProductCall
                                          .product(
                                            (_model.giftPrevPage?.jsonBody ??
                                                ''),
                                          )!
                                          .toList()
                                          .cast<dynamic>();
                                    });
                                  } else {
                                    _model.prevpageresponse =
                                        await ShopifyAdminGroup
                                            .collectionsListCall
                                            .call(
                                      limit: 10,
                                      pageInfo: _model.prevpageinfo,
                                    );
                                    setState(() {
                                      _model.response =
                                          ShopifyAdminGroup.collectionsListCall
                                              .collections(
                                                (_model.prevpageresponse
                                                        ?.jsonBody ??
                                                    ''),
                                              )!
                                              .toList()
                                              .cast<dynamic>();
                                    });
                                  }

                                  setState(() {});
                                },
                                text: 'Previous',
                                options: FFButtonOptions(
                                  width: 150.0,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFF2B4244),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Colors.white,
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 10.0, 10.0, 10.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (_model.choiceChipsValue == 'Gift') {
                                    _model.giftNextPage =
                                        await ShopifyAdminGroup
                                            .retrieveCollectionsProductCall
                                            .call(
                                      id: 230519144603,
                                      pageInfo: _model.nextpageinfo,
                                    );
                                    setState(() {
                                      _model.prevpageinfo =
                                          functions.removeBetweenOccurence(
                                              (_model.giftNextPage
                                                      ?.getHeader('link') ??
                                                  ''),
                                              1,
                                              'page_info=',
                                              '>');
                                      _model.nextpageinfo =
                                          functions.removeBetweenOccurence(
                                              (_model.giftNextPage
                                                      ?.getHeader('link') ??
                                                  ''),
                                              2,
                                              'page_info=',
                                              '>');
                                      _model.response = ShopifyAdminGroup
                                          .retrieveCollectionsProductCall
                                          .product(
                                            (_model.giftNextPage?.jsonBody ??
                                                ''),
                                          )!
                                          .toList()
                                          .cast<dynamic>();
                                    });
                                  } else {
                                    _model.nextpageresponse =
                                        await ShopifyAdminGroup
                                            .collectionsListCall
                                            .call(
                                      limit: 10,
                                      pageInfo: _model.nextpageinfo,
                                    );
                                    setState(() {
                                      _model.prevpageinfo =
                                          functions.removeBetweenOccurence(
                                              (_model.nextpageresponse
                                                      ?.getHeader('link') ??
                                                  ''),
                                              1,
                                              'page_info=',
                                              '>');
                                      _model.nextpageinfo =
                                          functions.removeBetweenOccurence(
                                              (_model.nextpageresponse
                                                      ?.getHeader('link') ??
                                                  ''),
                                              2,
                                              'page_info=',
                                              '>');
                                      _model.response =
                                          ShopifyAdminGroup.collectionsListCall
                                              .collections(
                                                (_model.nextpageresponse
                                                        ?.jsonBody ??
                                                    ''),
                                              )!
                                              .toList()
                                              .cast<dynamic>();
                                    });
                                  }

                                  setState(() {});
                                },
                                text: 'Next',
                                options: FFButtonOptions(
                                  width: 150.0,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFF2B4244),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Colors.white,
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]
                      .divide(SizedBox(height: 10.0))
                      .around(SizedBox(height: 10.0)),
                ),
              ),
            ),
            wrapWithModel(
              model: _model.navbarModel,
              updateCallback: () => setState(() {}),
              child: NavbarWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
