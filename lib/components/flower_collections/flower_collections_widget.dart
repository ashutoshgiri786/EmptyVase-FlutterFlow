import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'flower_collections_model.dart';
export 'flower_collections_model.dart';

class FlowerCollectionsWidget extends StatefulWidget {
  const FlowerCollectionsWidget({Key? key}) : super(key: key);

  @override
  _FlowerCollectionsWidgetState createState() =>
      _FlowerCollectionsWidgetState();
}

class _FlowerCollectionsWidgetState extends State<FlowerCollectionsWidget> {
  late FlowerCollectionsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FlowerCollectionsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: MediaQuery.sizeOf(context).height * 0.8,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.keyboard_arrow_down,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 24.0,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'FLOWERS',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Montserrat',
                          color: Color(0xFF2B4244),
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  ToggleIcon(
                    onPressed: () async {
                      setState(() => _model.condition = !_model.condition);
                    },
                    value: _model.condition,
                    onIcon: FaIcon(
                      FontAwesomeIcons.minus,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 18.0,
                    ),
                    offIcon: Icon(
                      Icons.add,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 15.0,
                    ),
                  ),
                ],
              ),
              if (_model.condition)
                FutureBuilder<ApiCallResponse>(
                  future: ShopifyAdminGroup.flowersCategoryCall.call(),
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
                    final listViewFlowersCategoryResponse = snapshot.data!;
                    return Builder(
                      builder: (context) {
                        final collections =
                            ShopifyAdminGroup.flowersCategoryCall
                                    .collections(
                                      listViewFlowersCategoryResponse.jsonBody,
                                    )
                                    ?.toList() ??
                                [];
                        return ListView.separated(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: collections.length,
                          separatorBuilder: (_, __) => SizedBox(height: 5.0),
                          itemBuilder: (context, collectionsIndex) {
                            final collectionsItem =
                                collections[collectionsIndex];
                            return Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    'FlowersPage',
                                    queryParameters: {
                                      'id': serializeParam(
                                        getJsonField(
                                          collectionsItem,
                                          r'''$..id''',
                                        ),
                                        ParamType.int,
                                      ),
                                      'categorytitle': serializeParam(
                                        getJsonField(
                                          collectionsItem,
                                          r'''$..title''',
                                        ).toString(),
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: Text(
                                  getJsonField(
                                    collectionsItem,
                                    r'''$..title''',
                                  )
                                      .toString()
                                      .maybeHandleOverflow(maxChars: 10),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Color(0xFF2B4244),
                                      ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1.0, -1.0),
                    child: Text(
                      'GIFT SHOP',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Montserrat',
                            color: Color(0xFF2B4244),
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  ToggleIcon(
                    onPressed: () async {
                      setState(() => _model.conditon2 = !_model.conditon2);
                    },
                    value: _model.conditon2,
                    onIcon: FaIcon(
                      FontAwesomeIcons.minus,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 15.0,
                    ),
                    offIcon: Icon(
                      Icons.add,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 15.0,
                    ),
                  ),
                ].divide(SizedBox(width: 10.0)),
              ),
              if (_model.conditon2 == true)
                FutureBuilder<ApiCallResponse>(
                  future: ShopifyAdminGroup.giftShopsCategoryCall.call(),
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
                    final listViewGiftShopsCategoryResponse = snapshot.data!;
                    return Builder(
                      builder: (context) {
                        final gifts = ShopifyAdminGroup.giftShopsCategoryCall
                                .collections(
                                  listViewGiftShopsCategoryResponse.jsonBody,
                                )
                                ?.toList() ??
                            [];
                        return ListView.separated(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: gifts.length,
                          separatorBuilder: (_, __) => SizedBox(height: 5.0),
                          itemBuilder: (context, giftsIndex) {
                            final giftsItem = gifts[giftsIndex];
                            return Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    'GiftShopPage',
                                    queryParameters: {
                                      'id': serializeParam(
                                        getJsonField(
                                          giftsItem,
                                          r'''$..id''',
                                        ),
                                        ParamType.int,
                                      ),
                                      'categorytitle': serializeParam(
                                        getJsonField(
                                          giftsItem,
                                          r'''$..title''',
                                        ).toString(),
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: Text(
                                  getJsonField(
                                    giftsItem,
                                    r'''$.title''',
                                  )
                                      .toString()
                                      .maybeHandleOverflow(maxChars: 15),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Color(0xFF2B4244),
                                      ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
            ].divide(SizedBox(height: 10.0)).around(SizedBox(height: 10.0)),
          ),
        ),
      ),
    );
  }
}
