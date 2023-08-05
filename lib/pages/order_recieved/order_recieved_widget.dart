import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'order_recieved_model.dart';
export 'order_recieved_model.dart';

class OrderRecievedWidget extends StatefulWidget {
  const OrderRecievedWidget({Key? key}) : super(key: key);

  @override
  _OrderRecievedWidgetState createState() => _OrderRecievedWidgetState();
}

class _OrderRecievedWidgetState extends State<OrderRecievedWidget> {
  late OrderRecievedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrderRecievedModel());
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
        body: Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: MediaQuery.sizeOf(context).height * 1.0,
          decoration: BoxDecoration(
            color: Color(0xFFF2EFEB),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: Image.asset(
                'assets/images/Copy_of_EV_APP_(1).png',
              ).image,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Text(
                  'ORDER RECEIVED !',
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Text(
                  'we will send you \na confirmation email \nshortly',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ),
              FFButtonWidget(
                onPressed: () async {
                  context.pushNamed('Homepage');
                },
                text: 'CONTINUE TO HOME',
                options: FFButtonOptions(
                  width: 300.0,
                  height: 50.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: Color(0xFF2B4244),
                  textStyle: FlutterFlowTheme.of(context).titleMedium.override(
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
            ].divide(SizedBox(height: 20.0)).addToEnd(SizedBox(height: 10.0)),
          ),
        ),
      ),
    );
  }
}
