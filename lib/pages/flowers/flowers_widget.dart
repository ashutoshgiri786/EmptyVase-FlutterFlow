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

class _FlowersWidgetState extends State<FlowersWidget> {
  late FlowersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

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
      await Future.delayed(const Duration(milliseconds: 250));
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
                  future: ShopifyAdminGroup.collectionsListCall.call(
                    limit: 5,
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
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 16.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              'items_page_cart',
                              queryParameters: {
                                'productName': serializeParam(
                                  getJsonField(
                                    productItem,
                                    r'''$..title''',
                                  ).toString(),
                                  ParamType.String,
                                ),
                                'productDescription': serializeParam(
                                  getJsonField(
                                    productItem,
                                    r'''$..body_html''',
                                  ).toString(),
                                  ParamType.String,
                                ),
                                'id': serializeParam(
                                  valueOrDefault<int>(
                                    getJsonField(
                                      productItem,
                                      r'''$.id''',
                                    ),
                                    5403721891995,
                                  ),
                                  ParamType.int,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 0.4,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.2,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.network(
                                        getJsonField(
                                          productItem,
                                          r'''$.image.src''',
                                        ),
                                      ).image,
                                    ),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Text(
                                  getJsonField(
                                    productItem,
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
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: FutureBuilder<ApiCallResponse>(
                                  future: ShopifyAdminGroup.productCall.call(
                                    prId: getJsonField(
                                      productItem,
                                      r'''$.id''',
                                    ).toString(),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    final textProductResponse = snapshot.data!;
                                    return Text(
                                      ShopifyAdminGroup.productCall
                                          .price(
                                            textProductResponse.jsonBody,
                                          )
                                          .toString(),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: Color(0xFF2B4244),
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    );
                                  },
                                ),
                              ),
                            ].divide(SizedBox(height: 8.0)),
                          ),
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
                          _model.prevpageresponse = await ShopifyAdminGroup
                              .retrieveCollectionsProductCall
                              .call(
                            id: widget.id,
                            pageInfo: _model.prevpageinfo,
                          );
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('ok'),
                                content: Text((_model.prevpageresponse
                                        ?.getHeader('link') ??
                                    '')),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );
                          setState(() {
                            _model.response =
                                ShopifyAdminGroup.retrieveCollectionsProductCall
                                    .product(
                                      (_model.prevpageresponse?.jsonBody ?? ''),
                                    )!
                                    .toList()
                                    .cast<dynamic>();
                          });

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
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
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
                          _model.nextpageresponse = await ShopifyAdminGroup
                              .retrieveCollectionsProductCall
                              .call(
                            id: widget.id,
                            pageInfo: _model.nextpageInfo,
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
                            _model.nextpageInfo =
                                functions.removeBetweenOccurence(
                                    (_model.nextpageresponse
                                            ?.getHeader('link') ??
                                        ''),
                                    2,
                                    'page_info=',
                                    '>');
                            _model.response =
                                ShopifyAdminGroup.retrieveCollectionsProductCall
                                    .product(
                                      (_model.nextpageresponse?.jsonBody ?? ''),
                                    )!
                                    .toList()
                                    .cast<dynamic>();
                          });

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
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
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
