import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'item_added_model.dart';
export 'item_added_model.dart';

class ItemAddedWidget extends StatefulWidget {
  const ItemAddedWidget({
    Key? key,
    required this.productimage,
  }) : super(key: key);

  final String? productimage;

  @override
  _ItemAddedWidgetState createState() => _ItemAddedWidgetState();
}

class _ItemAddedWidgetState extends State<ItemAddedWidget> {
  late ItemAddedModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemAddedModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: AlignmentDirectional(-1.0, -1.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 20.0,
              borderWidth: 1.0,
              buttonSize: 40.0,
              icon: Icon(
                Icons.close_outlined,
                color: Colors.white,
                size: 24.0,
              ),
              onPressed: () async {
                context.safePop();
              },
            ),
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
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 20.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.done,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, -1.0),
                        child: Text(
                          'Added To Cart',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),
                    ].divide(SizedBox(width: 10.0)),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, -1.0),
                    child: Text(
                      'GIFT SHOP',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          widget.productimage!,
                          width: 149.0,
                          height: 132.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed('Cart_2');
                      },
                      text: 'VIEW CART',
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        size: 15.0,
                      ),
                      options: FFButtonOptions(
                        width: 313.0,
                        height: 50.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0xFF2B4244),
                        textStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
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
                  ),
                ].divide(SizedBox(height: 20.0)).around(SizedBox(height: 20.0)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
