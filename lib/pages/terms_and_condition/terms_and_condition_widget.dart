import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'terms_and_condition_model.dart';
export 'terms_and_condition_model.dart';

class TermsAndConditionWidget extends StatefulWidget {
  const TermsAndConditionWidget({Key? key}) : super(key: key);

  @override
  _TermsAndConditionWidgetState createState() =>
      _TermsAndConditionWidgetState();
}

class _TermsAndConditionWidgetState extends State<TermsAndConditionWidget> {
  late TermsAndConditionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermsAndConditionModel());
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
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Color(0x80000000),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: FlutterFlowPdfViewer(
            assetPath: 'assets/pdfs/Terms_and_Conditions_for_Mobile_E.pdf',
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            horizontalScroll: false,
          ),
        ),
      ),
    );
  }
}
