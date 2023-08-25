import '/backend/api_requests/api_calls.dart';
import '/components/navbar/navbar_widget.dart';
import '/components/product_card_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'flowers_model.dart';
export 'flowers_model.dart';

class FlowersWidget extends StatefulWidget {
  const FlowersWidget({
    Key? key,
    required this.id,
    required this.choiceinitialvalue,
  }) : super(key: key);

  final int? id;
  final String? choiceinitialvalue;

  @override
  _FlowersWidgetState createState() => _FlowersWidgetState();
}

class _FlowersWidgetState extends State<FlowersWidget>
    with TickerProviderStateMixin {
  late FlowersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FlowersModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.firstResponse =
          await ShopifyAdminGroup.retrieveCollectionsProductCall.call(
        id: widget.id,
      );
      setState(() {
        _model.nextpageInfo = functions.removeBetween('page_info=',
            '>; rel=\"next\"', (_model.firstResponse?.getHeader('link') ?? ''));
        _model.response = ShopifyAdminGroup.retrieveCollectionsProductCall
            .product(
              (_model.firstResponse?.jsonBody ?? ''),
            )!
            .toList()
            .cast<dynamic>();
      });
    });

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
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
                  if (_model.searchbox == false)
                    ToggleIcon(
                      onPressed: () async {
                        setState(() => _model.searchbox = !_model.searchbox);
                      },
                      value: _model.searchbox,
                      onIcon: Icon(
                        Icons.search,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 25.0,
                      ),
                      offIcon: Icon(
                        Icons.search,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 25.0,
                      ),
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
              title: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.813,
                  height: 42.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                ).animateOnActionTrigger(
                  animationsMap['containerOnActionTriggerAnimation']!,
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
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                child: FutureBuilder<ApiCallResponse>(
                  future: FFAppState().collectionsList(
                    requestFn: () => ShopifyAdminGroup.collectionsListCall.call(
                      limit: 5,
                    ),
                  ),
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
                      options: (ShopifyAdminGroup.collectionsListCall.title(
                        choiceChipsCollectionsListResponse.jsonBody,
                      ) as List)
                          .map<String>((s) => s.toString())
                          .toList()!
                          .map((label) => ChipData(label))
                          .toList(),
                      onChanged: (val) async {
                        setState(() => _model.choiceChipsValue = val?.first);
                        if ((widget.id !=
                                functions.getFlowersId(
                                    _model.choiceChipsValue!,
                                    ShopifyAdminGroup.collectionsListCall
                                        .collections(
                                          choiceChipsCollectionsListResponse
                                              .jsonBody,
                                        )!
                                        .toList())) &&
                            (widget.choiceinitialvalue !=
                                _model.choiceChipsValue)) {
                          if (Navigator.of(context).canPop()) {
                            context.pop();
                          }
                          context.pushNamed(
                            'Flowers',
                            queryParameters: {
                              'id': serializeParam(
                                functions.getFlowersId(
                                    _model.choiceChipsValue!,
                                    ShopifyAdminGroup.collectionsListCall
                                        .collections(
                                          choiceChipsCollectionsListResponse
                                              .jsonBody,
                                        )!
                                        .toList()),
                                ParamType.int,
                              ),
                              'choiceinitialvalue': serializeParam(
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
                        [widget.choiceinitialvalue!],
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Builder(
                  builder: (context) {
                    final product = _model.response.toList();
                    return GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 0.0,
                        childAspectRatio: 0.8,
                      ),
                      scrollDirection: Axis.vertical,
                      itemCount: product.length,
                      itemBuilder: (context, productIndex) {
                        final productItem = product[productIndex];
                        return Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: wrapWithModel(
                            model: _model.productCardModels.getModel(
                              productIndex.toString(),
                              productIndex,
                            ),
                            updateCallback: () => setState(() {}),
                            updateOnChange: true,
                            child: ProductCardWidget(
                              key: Key(
                                'Key679_${productIndex.toString()}',
                              ),
                              islast: _model.response.last == productItem,
                              productData: productItem,
                              getMoreProduct: () async {
                                _model.nextpageinfo = await ShopifyAdminGroup
                                    .retrieveCollectionsProductCall
                                    .call(
                                  id: widget.id,
                                  pageInfo: _model.nextpageInfo,
                                );
                                setState(() {
                                  _model.response = functions
                                      .listconcat(
                                          _model.response.toList(),
                                          ShopifyAdminGroup
                                              .retrieveCollectionsProductCall
                                              .product(
                                                (_model.nextpageinfo
                                                        ?.jsonBody ??
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
                        );
                      },
                    );
                  },
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
