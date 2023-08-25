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
import 'gift_shop_page_model.dart';
export 'gift_shop_page_model.dart';

class GiftShopPageWidget extends StatefulWidget {
  const GiftShopPageWidget({
    Key? key,
    required this.id,
    required this.categorytitle,
  }) : super(key: key);

  final int? id;
  final String? categorytitle;

  @override
  _GiftShopPageWidgetState createState() => _GiftShopPageWidgetState();
}

class _GiftShopPageWidgetState extends State<GiftShopPageWidget> {
  late GiftShopPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GiftShopPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.firstpageresponse =
          await ShopifyAdminGroup.retrieveCollectionsProductCall.call(
        id: widget.id,
      );
      setState(() {
        _model.response = ShopifyAdminGroup.retrieveCollectionsProductCall
            .product(
              (_model.firstpageresponse?.jsonBody ?? ''),
            )!
            .toList()
            .cast<dynamic>();
        _model.nextpageinfo =
            (_model.firstpageresponse?.getHeader('link') ?? '');
      });
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
            leading: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                icon: Icon(
                  Icons.chevron_left,
                  color: Colors.black,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pushNamed('Homepage');
                },
              ),
            ),
            actions: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 20.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.search,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () {
                      print('IconButton pressed ...');
                    },
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 20.0,
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
            flexibleSpace: FlexibleSpaceBar(
              background: Container(),
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
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                      child: FlutterFlowChoiceChips(
                        options: _model.choiceChip
                            .map((label) => ChipData(label))
                            .toList(),
                        onChanged: (val) async {
                          setState(() => _model.choiceChipsValue = val?.first);
                          _model.giftShop = await ShopifyAdminGroup
                              .giftShopsCategoryCall
                              .call();
                          setState(() {
                            _model.choiceChip =
                                (ShopifyAdminGroup.giftShopsCategoryCall.title(
                              (_model.giftShop?.jsonBody ?? ''),
                            ) as List)
                                    .map<String>((s) => s.toString())
                                    .toList()!
                                    .toList()
                                    .cast<String>();
                          });
                          setState(() {
                            _model.id = functions.getFlowersId(
                                _model.choiceChipsValue!,
                                ShopifyAdminGroup.giftShopsCategoryCall
                                    .collections(
                                      (_model.giftShop?.jsonBody ?? ''),
                                    )!
                                    .toList());
                          });
                          if (widget.categorytitle != _model.choiceChipsValue) {
                            context.pushNamed(
                              'GiftShopPage',
                              queryParameters: {
                                'id': serializeParam(
                                  _model.id,
                                  ParamType.int,
                                ),
                                'categorytitle': serializeParam(
                                  _model.choiceChipsValue,
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
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
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
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
                          [widget.categorytitle!],
                        ),
                      ),
                    ),
                  ]
                      .addToStart(SizedBox(width: 16.0))
                      .addToEnd(SizedBox(width: 16.0)),
                ),
              ),
            ),
            Expanded(
              child: Builder(
                builder: (context) {
                  final products = _model.response.toList();
                  return GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 0.0,
                      childAspectRatio: 0.8,
                    ),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: products.length,
                    itemBuilder: (context, productsIndex) {
                      final productsItem = products[productsIndex];
                      return Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 1.0, 0.0, 0.0),
                          child: wrapWithModel(
                            model: _model.productCardModels.getModel(
                              productsIndex.toString(),
                              productsIndex,
                            ),
                            updateCallback: () => setState(() {}),
                            updateOnChange: true,
                            child: ProductCardWidget(
                              key: Key(
                                'Keyql7_${productsIndex.toString()}',
                              ),
                              islast: _model.response.last == productsItem,
                              productData: productsItem,
                              getMoreProduct: () async {
                                _model.nextpage = await ShopifyAdminGroup
                                    .retrieveCollectionsProductCall
                                    .call(
                                  id: widget.id,
                                  pageInfo: _model.nextpageinfo,
                                );
                                setState(() {
                                  _model.nextpageinfo =
                                      functions.removeBetweenOccurence(
                                          _model.nextpageinfo!,
                                          2,
                                          'page_info=',
                                          '>');
                                  _model.response = functions
                                      .listconcat(
                                          _model.response.toList(),
                                          ShopifyAdminGroup
                                              .retrieveCollectionsProductCall
                                              .product(
                                                (_model.nextpage?.jsonBody ??
                                                    ''),
                                              )!
                                              .toList())
                                      .toList()
                                      .cast<dynamic>();
                                });

                                setState(() {});
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
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
