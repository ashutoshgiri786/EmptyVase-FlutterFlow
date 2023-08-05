import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
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
              Builder(
                builder: (context) {
                  final products = List.generate(
                      random_data.randomInteger(0, 5),
                      (index) => random_data.randomImageUrl(
                            0,
                            0,
                          )).toList();
                  return ListView.separated(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: products.length,
                    separatorBuilder: (_, __) => SizedBox(height: 5.0),
                    itemBuilder: (context, productsIndex) {
                      final productsItem = products[productsIndex];
                      return Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          'New Arrivals',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Montserrat',
                                    color: Color(0xFF2B4244),
                                  ),
                        ),
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
                    setState(() => _model.condition = !_model.condition);
                  },
                  value: _model.condition,
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
            if (_model.condition)
              Builder(
                builder: (context) {
                  final products = List.generate(
                      random_data.randomInteger(0, 5),
                      (index) => random_data.randomImageUrl(
                            0,
                            0,
                          )).toList();
                  return ListView.separated(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: products.length,
                    separatorBuilder: (_, __) => SizedBox(height: 5.0),
                    itemBuilder: (context, productsIndex) {
                      final productsItem = products[productsIndex];
                      return Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          'New Arrivals',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Montserrat',
                                    color: Color(0xFF2B4244),
                                  ),
                        ),
                      );
                    },
                  );
                },
              ),
          ].divide(SizedBox(height: 10.0)).around(SizedBox(height: 10.0)),
        ),
      ),
    );
  }
}
