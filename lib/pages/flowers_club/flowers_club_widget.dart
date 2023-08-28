import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'flowers_club_model.dart';
export 'flowers_club_model.dart';

class FlowersClubWidget extends StatefulWidget {
  const FlowersClubWidget({Key? key}) : super(key: key);

  @override
  _FlowersClubWidgetState createState() => _FlowersClubWidgetState();
}

class _FlowersClubWidgetState extends State<FlowersClubWidget> {
  late FlowersClubModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FlowersClubModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.flowerClub = await ShopifyAdminGroup.flowersClubCall.call();
      setState(() {});
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
      future: ShopifyAdminGroup.flowersClubCall.call(),
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
        final flowersClubFlowersClubResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
              child: Stack(
                children: [
                  Builder(
                    builder: (context) {
                      final image = (ShopifyAdminGroup.flowersClubCall.images(
                            flowersClubFlowersClubResponse.jsonBody,
                          ) as List)
                              .map<String>((s) => s.toString())
                              .toList()
                              ?.toList() ??
                          [];
                      return Container(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 0.51,
                        child: PageView.builder(
                          controller: _model.pageViewController ??=
                              PageController(
                                  initialPage: min(0, image.length - 1)),
                          onPageChanged: (_) => setState(() {}),
                          scrollDirection: Axis.vertical,
                          itemCount: image.length,
                          itemBuilder: (context, imageIndex) {
                            final imageItem = image[imageIndex];
                            return Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: Image.network(
                                  valueOrDefault<String>(
                                    imageItem,
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNuvafpok1f34VfmtLMX_0RYNYnJ-aSpv0qQ&usqp=CAU',
                                  ),
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
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
                            mainAxisSize: MainAxisSize.max,
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
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0),
                      ),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        constraints: BoxConstraints(
                          maxHeight: MediaQuery.sizeOf(context).height * 0.5,
                        ),
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
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 25.0,
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, -1.0),
                                  child: Text(
                                    ShopifyAdminGroup.flowersClubCall
                                        .title(
                                          flowersClubFlowersClubResponse
                                              .jsonBody,
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
                                Align(
                                  alignment: AlignmentDirectional(-1.0, -1.0),
                                  child: Text(
                                    _model.price,
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
                                    data: ShopifyAdminGroup.flowersClubCall
                                        .description(
                                          (_model.flowerClub?.jsonBody ?? ''),
                                        )
                                        .toString(),
                                  ),
                                FlutterFlowChoiceChips(
                                  options: (ShopifyAdminGroup.flowersClubCall
                                          .pricing(
                                    flowersClubFlowersClubResponse.jsonBody,
                                  ) as List)
                                      .map<String>((s) => s.toString())
                                      .toList()!
                                      .map((label) => ChipData(label))
                                      .toList(),
                                  onChanged: (val) async {
                                    setState(
                                        () => _model.pricingValue = val?.first);
                                    setState(() {
                                      _model.price = _model.pricingValue!;
                                    });
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
                                  initialized: _model.pricingValue != null,
                                  alignment: WrapAlignment.start,
                                  controller: _model.pricingValueController ??=
                                      FormFieldController<List<String>>(
                                    [
                                      ShopifyAdminGroup.flowersClubCall
                                          .initialPricing(
                                            flowersClubFlowersClubResponse
                                                .jsonBody,
                                          )
                                          .toString()
                                    ],
                                  ),
                                ),
                                FlutterFlowChoiceChips(
                                  options: (ShopifyAdminGroup.flowersClubCall
                                          .duration(
                                    flowersClubFlowersClubResponse.jsonBody,
                                  ) as List)
                                      .map<String>((s) => s.toString())
                                      .toList()!
                                      .map((label) => ChipData(label))
                                      .toList(),
                                  onChanged: (val) => setState(
                                      () => _model.durationValue = val?.first),
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
                                  initialized: _model.durationValue != null,
                                  alignment: WrapAlignment.start,
                                  controller: _model.durationValueController ??=
                                      FormFieldController<List<String>>(
                                    [
                                      ShopifyAdminGroup.flowersClubCall
                                          .initialDuration(
                                            (_model.flowerClub?.jsonBody ?? ''),
                                          )
                                          .toString()
                                    ],
                                  ),
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    context
                                        .pushNamed('Delivery_Pickup_Selected');
                                  },
                                  text: 'BUY NOW',
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
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
