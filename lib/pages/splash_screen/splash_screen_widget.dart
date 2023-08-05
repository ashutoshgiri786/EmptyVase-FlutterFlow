import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'splash_screen_model.dart';
export 'splash_screen_model.dart';

class SplashScreenWidget extends StatefulWidget {
  const SplashScreenWidget({Key? key}) : super(key: key);

  @override
  _SplashScreenWidgetState createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget> {
  late SplashScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SplashScreenModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: MediaQuery.sizeOf(context).height * 1.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: Image.asset(
              'assets/images/Copy_of_EV_APP_(1).png',
            ).image,
          ),
        ),
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed('LoginPage');
                },
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.6,
                  height: MediaQuery.sizeOf(context).height * 0.06,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80.0),
                    border: Border.all(
                      color: Colors.white,
                    ),
                  ),
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'START HERE ',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: Color(0xFFF6F6F6),
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.chevron_right_sharp,
                        color: Color(0xFFF6F6F6),
                        size: 24.0,
                      ),
                    ],
                  ),
                ),
              ),
            ].addToEnd(SizedBox(height: 70.0)),
          ),
        ),
      ),
    );
  }
}
