import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sign_up_model.dart';
export 'sign_up_model.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  late SignUpModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SignUpModel());

    _model.firstnameController ??= TextEditingController();
    _model.textController2 ??= TextEditingController();
    _model.textController3 ??= TextEditingController();
    _model.textController4 ??= TextEditingController();
    _model.textController5 ??= TextEditingController();
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
        body: Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: MediaQuery.sizeOf(context).height * 1.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/images/page_3_SignUp.jpeg',
              ).image,
            ),
            borderRadius: BorderRadius.circular(0.0),
          ),
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/Empty_Vase_Logo_HD.png',
                      width: 225.0,
                      height: 112.0,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Form(
                  key: _model.formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(1.0, 0.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.4,
                                    child: TextFormField(
                                      controller: _model.firstnameController,
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Montserrat',
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle: FontStyle.italic,
                                            ),
                                        hintText: 'First Name',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Montserrat',
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle: FontStyle.italic,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(80.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(80.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(80.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(80.0),
                                        ),
                                        filled: true,
                                        fillColor: Color(0xA4FFFFFF),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      validator: _model
                                          .firstnameControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.4,
                                    child: TextFormField(
                                      controller: _model.textController2,
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Montserrat',
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle: FontStyle.italic,
                                            ),
                                        hintText: 'Last Name',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Montserrat',
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle: FontStyle.italic,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(80.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(80.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(80.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(80.0),
                                        ),
                                        filled: true,
                                        fillColor: Color(0xA4FFFFFF),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      validator: _model.textController2Validator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.02, 0.23),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.8,
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
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.italic,
                                        ),
                                    hintText: 'Email',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.italic,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(80.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(80.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(80.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(80.0),
                                    ),
                                    filled: true,
                                    fillColor: Color(0xA4FFFFFF),
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  validator: _model.textController3Validator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.41),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.8,
                                child: TextFormField(
                                  controller: _model.textController4,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.italic,
                                        ),
                                    hintText: 'Password',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.italic,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(80.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(80.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(80.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(80.0),
                                    ),
                                    filled: true,
                                    fillColor: Color(0xA4FFFFFF),
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      size: 20.0,
                                    ),
                                    suffixIcon: Icon(
                                      Icons.remove_red_eye_outlined,
                                      size: 20.0,
                                    ),
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  validator: _model.textController4Validator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.41),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.8,
                                child: TextFormField(
                                  controller: _model.textController5,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Confirm Password',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.italic,
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(80.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(80.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(80.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(80.0),
                                    ),
                                    filled: true,
                                    fillColor: Color(0xA4FFFFFF),
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      size: 20.0,
                                    ),
                                    suffixIcon: Icon(
                                      Icons.remove_red_eye_outlined,
                                      size: 20.0,
                                    ),
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  validator: _model.textController5Validator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Theme(
                                data: ThemeData(
                                  checkboxTheme: CheckboxThemeData(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                  ),
                                  unselectedWidgetColor: Colors.white,
                                ),
                                child: Checkbox(
                                  value: _model.checkboxValue1 ??= false,
                                  onChanged: (newValue) async {
                                    setState(() =>
                                        _model.checkboxValue1 = newValue!);
                                  },
                                  activeColor: Colors.white,
                                  checkColor: Colors.black,
                                ),
                              ),
                              Text(
                                'Remember Password',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: Colors.white,
                                      fontSize: 10.0,
                                    ),
                              ),
                            ]
                                .divide(SizedBox(width: 10.0))
                                .addToStart(SizedBox(width: 40.0)),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Theme(
                                data: ThemeData(
                                  checkboxTheme: CheckboxThemeData(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                  ),
                                  unselectedWidgetColor: Colors.white,
                                ),
                                child: Checkbox(
                                  value: _model.checkboxValue2 ??= false,
                                  onChanged: (newValue) async {
                                    setState(() =>
                                        _model.checkboxValue2 = newValue!);
                                    if (newValue!) {
                                      setState(() {
                                        FFAppState().TermsAndCondition =
                                            _model.checkboxValue2!;
                                      });
                                    }
                                  },
                                  activeColor: Colors.white,
                                  checkColor: Colors.black,
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'I have read the ',
                                      style: TextStyle(),
                                    ),
                                    TextSpan(
                                      text: 'terms and conditions',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                      ),
                                      mouseCursor: SystemMouseCursors.click,
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () async {
                                          context
                                              .pushNamed('TermsAndCondition');
                                        },
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Colors.white,
                                        fontSize: 10.0,
                                      ),
                                ),
                              ),
                            ]
                                .divide(SizedBox(width: 10.0))
                                .addToStart(SizedBox(width: 40.0)),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              if (FFAppState().TermsAndCondition == true) {
                                if (_model.formKey.currentState == null ||
                                    !_model.formKey.currentState!.validate()) {
                                  return;
                                }
                                _model.signup = await actions.signUp(
                                  _model.textController3.text,
                                  _model.textController4.text,
                                  _model.firstnameController.text,
                                  _model.textController2.text,
                                  true,
                                  _model.textController5.text,
                                );
                                if (_model.signup != null) {
                                  context.pushNamed('LoginPage');
                                }
                              }

                              setState(() {});
                            },
                            text: 'Sign Up',
                            options: FFButtonOptions(
                              width: 312.0,
                              height: 50.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Colors.white,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: Color(0xFF2B4244),
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
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Already Have Account? ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                                TextSpan(
                                  text: ' Sign In',
                                  style: TextStyle(),
                                  mouseCursor: SystemMouseCursors.click,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () async {
                                      context.pushNamed('LoginPage');
                                    },
                                )
                              ],
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                  ),
                            ),
                          ),
                        ].divide(SizedBox(height: 10.0)),
                      ),
                    ),
                  ),
                ),
              ].divide(SizedBox(height: 10.0)),
            ),
          ),
        ),
      ),
    );
  }
}
