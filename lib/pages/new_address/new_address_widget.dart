import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'new_address_model.dart';
export 'new_address_model.dart';

class NewAddressWidget extends StatefulWidget {
  const NewAddressWidget({
    Key? key,
    this.address,
    this.province,
    this.city,
    this.zip,
    this.country,
    bool? update,
    this.id,
  })  : this.update = update ?? false,
        super(key: key);

  final String? address;
  final String? province;
  final String? city;
  final String? zip;
  final String? country;
  final bool update;
  final String? id;

  @override
  _NewAddressWidgetState createState() => _NewAddressWidgetState();
}

class _NewAddressWidgetState extends State<NewAddressWidget> {
  late NewAddressModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewAddressModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.updateAddress = widget.update;
      });
      await showDialog(
        context: context,
        builder: (alertDialogContext) {
          return AlertDialog(
            title: Text('ok'),
            content: Text(_model.updateAddress.toString()),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(alertDialogContext),
                child: Text('Ok'),
              ),
            ],
          );
        },
      );
    });

    _model.textController1 ??= TextEditingController(text: widget.address);
    _model.textController2 ??= TextEditingController(text: widget.province);
    _model.textController3 ??= TextEditingController(text: widget.city);
    _model.textController4 ??= TextEditingController(text: widget.zip);
    _model.textController5 ??= TextEditingController(text: widget.country);
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
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.sizeOf(context).height * 0.1),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              title: Container(
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
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
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
              ),
              centerTitle: true,
              expandedTitleScale: 1.0,
            ),
            elevation: 0.0,
          ),
        ),
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: AlignmentDirectional(-1.0, -1.0),
                child: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  icon: Icon(
                    Icons.chevron_left_sharp,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    context.safePop();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                child: TextFormField(
                  controller: _model.textController1,
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Montserrat',
                              color: Color(0xFF2B4244),
                              fontSize: 12.0,
                              fontStyle: FontStyle.italic,
                            ),
                    hintText: 'Address 123',
                    hintStyle: FlutterFlowTheme.of(context).labelMedium,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Montserrat',
                        fontSize: 12.0,
                        fontStyle: FontStyle.italic,
                      ),
                  validator:
                      _model.textController1Validator.asValidator(context),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                child: TextFormField(
                  controller: _model.textController2,
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Montserrat',
                              color: Color(0xFF2B4244),
                              fontSize: 12.0,
                              fontStyle: FontStyle.italic,
                            ),
                    hintText: 'Province',
                    hintStyle: FlutterFlowTheme.of(context).labelMedium,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Montserrat',
                        fontSize: 12.0,
                        fontStyle: FontStyle.italic,
                      ),
                  validator:
                      _model.textController2Validator.asValidator(context),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                        child: TextFormField(
                          controller: _model.textController3,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  fontSize: 12.0,
                                  fontStyle: FontStyle.italic,
                                ),
                            hintText: 'City',
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: Color(0xFF2B4244),
                                  fontSize: 12.0,
                                  fontStyle: FontStyle.italic,
                                ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Montserrat',
                                    color: Color(0xFF2B4244),
                                    fontSize: 12.0,
                                    fontStyle: FontStyle.italic,
                                  ),
                          validator: _model.textController3Validator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                        child: TextFormField(
                          controller: _model.textController4,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Zip',
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  fontSize: 12.0,
                                  fontStyle: FontStyle.italic,
                                ),
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: Color(0xFF2B4244),
                                  fontSize: 12.0,
                                  fontStyle: FontStyle.italic,
                                ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Montserrat',
                                    color: Color(0xFF2B4244),
                                    fontSize: 12.0,
                                    fontStyle: FontStyle.italic,
                                  ),
                          validator: _model.textController4Validator
                              .asValidator(context),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(width: 10.0)),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                child: TextFormField(
                  controller: _model.textController5,
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Montserrat',
                              color: Color(0xFF2B4244),
                              fontSize: 12.0,
                              fontStyle: FontStyle.italic,
                            ),
                    hintText: 'Country',
                    hintStyle: FlutterFlowTheme.of(context).labelMedium,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Montserrat',
                        fontSize: 12.0,
                        fontStyle: FontStyle.italic,
                      ),
                  validator:
                      _model.textController5Validator.asValidator(context),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Theme(
                      data: ThemeData(
                        checkboxTheme: CheckboxThemeData(
                          visualDensity: VisualDensity.compact,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                        unselectedWidgetColor: Color(0xFF4F0C87),
                      ),
                      child: Checkbox(
                        value: _model.checkboxValue ??= false,
                        onChanged: (newValue) async {
                          setState(() => _model.checkboxValue = newValue!);
                        },
                        activeColor: Color(0xFFF6F6F6),
                        checkColor: Colors.black,
                      ),
                    ),
                  ),
                  Text(
                    'SET AS BILLING',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Montserrat',
                          color: Color(0xFF2B4244),
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ],
              ),
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      if (_model.updateAddress == true) {
                        _model.updatedAddress = await actions.updateAddress(
                          widget.id!,
                          FFAppState().accessToken,
                          _model.textController1.text,
                          _model.textController5.text,
                          _model.textController2.text,
                          widget.city!,
                          _model.textController4.text,
                        );
                      } else {
                        _model.createAddress = await actions.createAddress(
                          FFAppState().accessToken,
                          _model.textController1.text,
                          _model.textController5.text,
                          _model.textController2.text,
                          _model.textController3.text,
                          _model.textController5.text,
                        );
                      }

                      context.goNamed('Addresses');

                      setState(() {});
                    },
                    text: 'SAVE',
                    options: FFButtonOptions(
                      width: 134.0,
                      height: 50.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Colors.white,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Montserrat',
                                color: Color(0xFF2B4244),
                                fontSize: 12.6,
                                fontWeight: FontWeight.w600,
                              ),
                      borderSide: BorderSide(
                        color: Color(0xFF2B4244),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(80.0),
                    ),
                  ),
                ),
              ),
            ].divide(SizedBox(height: 10.0)),
          ),
        ),
      ),
    );
  }
}
