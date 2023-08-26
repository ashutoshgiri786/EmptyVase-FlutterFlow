import '/backend/api_requests/api_calls.dart';
import '/components/navbar/navbar_widget.dart';
import '/components/product_card_widget.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
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
      _model.coll = await actions.retreiveCollectionProduct(
        widget.id!.toString(),
      );
      setState(() {
        _model.response = getJsonField(
          _model.coll,
          r'''$.collection.products.edges''',
        )!
            .toList()
            .cast<dynamic>();
        _model.nextpageinfo = getJsonField(
          _model.coll,
          r'''$.collection.products.pageInfo.endCursor''',
        ).toString().toString();
        _model.hasNextPage = getJsonField(
          _model.coll,
          r'''$.collection.products.pageInfo.hasNextPage''',
        );
      });
    });

    _model.textController ??= TextEditingController();
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
            backgroundColor: Color(0xFFF2EFEB),
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
                  if (_model.searchDisplay) {
                    setState(() {
                      _model.searchDisplay = false;
                    });
                  } else {
                    context.pushNamed('Homepage');
                  }
                },
              ),
            ),
            actions: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (!_model.searchDisplay)
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 20.0,
                      borderWidth: 1.0,
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.search,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        setState(() {
                          _model.searchDisplay = true;
                        });
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
              title: Visibility(
                visible: _model.searchDisplay,
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.7,
                  child: Autocomplete<String>(
                    initialValue: TextEditingValue(),
                    optionsBuilder: (textEditingValue) {
                      if (textEditingValue.text == '') {
                        return const Iterable<String>.empty();
                      }
                      return (getJsonField(
                        _model.search,
                        r'''$..title''',
                      ) as List)
                          .map<String>((s) => s.toString())
                          .toList()!
                          .where((option) {
                        final lowercaseOption = option.toLowerCase();
                        return lowercaseOption
                            .contains(textEditingValue.text.toLowerCase());
                      });
                    },
                    optionsViewBuilder: (context, onSelected, options) {
                      return AutocompleteOptionsList(
                        textFieldKey: _model.textFieldKey,
                        textController: _model.textController!,
                        options: options.toList(),
                        onSelected: onSelected,
                        textStyle: FlutterFlowTheme.of(context).bodyMedium,
                        textHighlightStyle: TextStyle(),
                        elevation: 4.0,
                        optionBackgroundColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        optionHighlightColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        maxHeight: 200.0,
                      );
                    },
                    onSelected: (String selection) {
                      setState(
                          () => _model.textFieldSelectedOption = selection);
                      FocusScope.of(context).unfocus();
                    },
                    fieldViewBuilder: (
                      context,
                      textEditingController,
                      focusNode,
                      onEditingComplete,
                    ) {
                      _model.textController = textEditingController;
                      return TextFormField(
                        key: _model.textFieldKey,
                        controller: textEditingController,
                        focusNode: focusNode,
                        onEditingComplete: onEditingComplete,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.textController',
                          Duration(milliseconds: 300),
                          () async {
                            _model.search = await actions.search(
                              _model.textController.text,
                            );
                            setState(() {
                              _model.searchProducts = getJsonField(
                                _model.search,
                                r'''$..node''',
                              )!
                                  .toList()
                                  .cast<dynamic>();
                            });

                            setState(() {});
                          },
                        ),
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Search',
                          labelStyle: FlutterFlowTheme.of(context).labelMedium,
                          hintStyle: FlutterFlowTheme.of(context).labelMedium,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(80.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(80.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(80.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(80.0),
                          ),
                          suffixIcon: Icon(
                            Icons.search,
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        validator:
                            _model.textControllerValidator.asValidator(context),
                      );
                    },
                  ),
                ),
              ),
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
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (!_model.searchDisplay)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 8.0),
                            child: FlutterFlowChoiceChips(
                              options: _model.choiceChip
                                  .map((label) => ChipData(label))
                                  .toList(),
                              onChanged: (val) async {
                                setState(() =>
                                    _model.choiceChipsValue1 = val?.first);
                                _model.giftShop = await ShopifyAdminGroup
                                    .giftShopsCategoryCall
                                    .call();
                                setState(() {
                                  _model.choiceChip = (ShopifyAdminGroup
                                          .giftShopsCategoryCall
                                          .title(
                                    (_model.giftShop?.jsonBody ?? ''),
                                  ) as List)
                                      .map<String>((s) => s.toString())
                                      .toList()!
                                      .toList()
                                      .cast<String>();
                                });
                                setState(() {
                                  _model.id = functions.getFlowersId(
                                      _model.choiceChipsValue1!,
                                      ShopifyAdminGroup.giftShopsCategoryCall
                                          .collections(
                                            (_model.giftShop?.jsonBody ?? ''),
                                          )!
                                          .toList());
                                });
                                if (widget.categorytitle !=
                                    _model.choiceChipsValue1) {
                                  context.pushNamed(
                                    'GiftShopPage',
                                    queryParameters: {
                                      'id': serializeParam(
                                        _model.id,
                                        ParamType.int,
                                      ),
                                      'categorytitle': serializeParam(
                                        _model.choiceChipsValue1,
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
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
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
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
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
                              initialized: _model.choiceChipsValue1 != null,
                              alignment: WrapAlignment.start,
                              controller: _model.choiceChipsValueController1 ??=
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
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (_model.searchDisplay && (_model.search != null))
                          FlutterFlowChoiceChips(
                            options: functions
                                .stringListToSet((getJsonField(
                                  _model.search,
                                  r'''$..collections..channelTitle''',
                                ) as List)
                                    .map<String>((s) => s.toString())
                                    .toList())
                                .map((label) => ChipData(label))
                                .toList(),
                            onChanged: (val) => setState(
                                () => _model.choiceChipsValue2 = val?.first),
                            selectedChipStyle: ChipStyle(
                              backgroundColor: Color(0xFF2B4244),
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
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
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
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
                            initialized: _model.choiceChipsValue2 != null,
                            alignment: WrapAlignment.start,
                            controller: _model.choiceChipsValueController2 ??=
                                FormFieldController<List<String>>(
                              ['Everything'],
                            ),
                          ),
                      ]
                          .divide(SizedBox(width: 16.0))
                          .around(SizedBox(width: 16.0)),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (!_model.searchDisplay)
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
                                      islast:
                                          _model.response.last == productsItem,
                                      productData: productsItem,
                                      getMoreProduct: () async {
                                        if (_model.hasNextPage) {
                                          _model.nextpage = await actions
                                              .retreiveCollectionProductNextPage(
                                            widget.id!.toString(),
                                            _model.nextpageinfo!,
                                          );
                                          setState(() {
                                            _model.response = getJsonField(
                                              _model.nextpage,
                                              r'''$.collection.products.edges''',
                                            )!
                                                .toList()
                                                .cast<dynamic>();
                                            _model.hasNextPage = getJsonField(
                                              _model.nextpage,
                                              r'''$.collection.products.pageInfo.hasNextPage''',
                                            );
                                            _model.nextpageinfo = getJsonField(
                                              _model.nextpage,
                                              r'''$.collection.products.pageInfo.endCursor''',
                                            ).toString();
                                          });
                                        }

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
                  if (_model.searchDisplay)
                    Expanded(
                      child: Builder(
                        builder: (context) {
                          final product = _model.searchProducts
                              .where((e) => functions
                                  .stringListToSet((getJsonField(
                                    e,
                                    r'''$..channelTitle''',
                                  ) as List)
                                      .map<String>((s) => s.toString())
                                      .toList())
                                  .contains(_model.choiceChipsValue2))
                              .toList();
                          return GridView.builder(
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                              childAspectRatio: 0.78,
                            ),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: product.length,
                            itemBuilder: (context, productIndex) {
                              final productItem = product[productIndex];
                              return InkWell(
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
                                              productItem,
                                              r'''$.id''',
                                            ).toString()),
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.4,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.172,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: Image.network(
                                            valueOrDefault<String>(
                                              getJsonField(
                                                productItem,
                                                r'''$..url''',
                                              ),
                                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNuvafpok1f34VfmtLMX_0RYNYnJ-aSpv0qQ&usqp=CAU',
                                            ),
                                          ).image,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          getJsonField(
                                            productItem,
                                            r'''$.title''',
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
                                    ),
                                  ].divide(SizedBox(height: 8.0)),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                ],
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
