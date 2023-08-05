import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'notification_model.dart';
export 'notification_model.dart';

class NotificationWidget extends StatefulWidget {
  const NotificationWidget({Key? key}) : super(key: key);

  @override
  _NotificationWidgetState createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  late NotificationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationModel());
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
        body: Align(
          alignment: AlignmentDirectional(0.0, 1.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FlutterFlowIconButton(
                    borderRadius: 20.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      context.safePop();
                    },
                  ),
                  Align(
                    alignment: AlignmentDirectional(-0.5, 0.0),
                    child: Text(
                      'NOTIFICATIONS',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                ]
                    .divide(SizedBox(width: 30.0))
                    .addToStart(SizedBox(width: 20.0)),
              ),
              Align(
                alignment: AlignmentDirectional(1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                  child: Text(
                    'Mark As All Read',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Montserrat',
                          fontSize: 9.0,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed('Flowers');
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(
                          'assets/images/WhatsApp_Image_2023-07-14_at_00.56.31_(2).jpeg',
                          width: MediaQuery.sizeOf(context).width * 0.211,
                          height: MediaQuery.sizeOf(context).height * 0.103,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '10% Off on All Roses',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Discount will automatically \napplied atthe time of checkout',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ].divide(SizedBox(width: 10.0)),
                          ),
                        ].divide(SizedBox(height: 10.0)),
                      ),
                      Text(
                        '7d ago',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Montserrat',
                              fontSize: 9.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'WALK INS ONLY! 10% Off \non all Roses Bouquets',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Montserrat',
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        Text(
                          'Valid until 5/20/23 4PM',
                          textAlign: TextAlign.start,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Montserrat',
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ].divide(SizedBox(height: 10.0)),
                    ),
                    Flexible(
                      child: Align(
                        alignment: AlignmentDirectional(1.0, 1.0),
                        child: Text(
                          '7d ago',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Montserrat',
                                    fontSize: 9.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'MINIMUM ORDER TODAY \$350',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Montserrat',
                              fontSize: 12.0,
                            ),
                      ),
                      Text(
                        '7d ago',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Montserrat',
                              fontSize: 9.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: wrapWithModel(
                    model: _model.navbarModel,
                    updateCallback: () => setState(() {}),
                    child: NavbarWidget(),
                  ),
                ),
              ),
            ].divide(SizedBox(height: 20.0)).addToStart(SizedBox(height: 10.0)),
          ),
        ),
      ),
    );
  }
}
