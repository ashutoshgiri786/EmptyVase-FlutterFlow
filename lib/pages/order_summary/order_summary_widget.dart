import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'order_summary_model.dart';
export 'order_summary_model.dart';

class OrderSummaryWidget extends StatefulWidget {
  const OrderSummaryWidget({Key? key}) : super(key: key);

  @override
  _OrderSummaryWidgetState createState() => _OrderSummaryWidgetState();
}

class _OrderSummaryWidgetState extends State<OrderSummaryWidget> {
  late OrderSummaryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrderSummaryModel());

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: Align(
            alignment: AlignmentDirectional(1.0, 1.0),
            child: FlutterFlowIconButton(
              borderColor: FlutterFlowTheme.of(context).primaryBackground,
              borderRadius: 15.0,
              borderWidth: 1.0,
              buttonSize: 40.0,
              fillColor: FlutterFlowTheme.of(context).primaryBackground,
              icon: Icon(
                Icons.arrow_back_ios,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 14.0,
              ),
              onPressed: () async {
                context.safePop();
              },
            ),
          ),
          title: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
            child: Text(
              'SUMMARY',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.normal,
                  ),
            ),
          ),
          actions: [],
          centerTitle: true,
          toolbarHeight: 80.0,
          elevation: 0.0,
        ),
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            '2 items ',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            'TAXES',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            'SHIPPING',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),
                      ].divide(SizedBox(height: 5.0)),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            '230.00',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            '23.00',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            '35.00',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),
                      ].divide(SizedBox(height: 5.0)),
                    ),
                  ].divide(SizedBox(width: 70.0)),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.0, -1.0),
                      child: Text(
                        'Gift Card ',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, -1.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.8,
                        height: MediaQuery.sizeOf(context).height * 0.05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80.0),
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: Color(0xFF2B4244),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                child: TextFormField(
                                  controller: _model.textController,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  validator: _model.textControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 1.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () {
                                  print('Button pressed ...');
                                },
                                text: 'Apply',
                                options: FFButtonOptions(
                                  width: 85.0,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Colors.white,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Color(0xFF2B4244),
                                        fontSize: 12.0,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 0.0,
                                  ),
                                  borderRadius: BorderRadius.circular(80.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ].divide(SizedBox(height: 10.0)),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed('Addresses');
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              'Saeed B\n123 Address\nLine 2\n12345, City\nCA',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                        ].divide(SizedBox(height: 10.0)),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-0.8, 0.0),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 20.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.chevron_right,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.0, -1.0),
                      child: Text(
                        'Payment Method',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, -1.0),
                      child: Text(
                        'Card Ending In 7887',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                  ].divide(SizedBox(height: 10.0)),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        'TOTAL',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Montserrat',
                              color: Color(0xFF2B4244),
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        '287.00',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ].divide(SizedBox(width: 100.0)),
                ),
              ),
              FFButtonWidget(
                onPressed: () async {
                  context.pushNamed('Order_Recieved');
                },
                text: 'CONTINUE',
                options: FFButtonOptions(
                  width: 313.0,
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
            ].divide(SizedBox(height: 40.0)),
          ),
        ),
      ),
    );
  }
}
