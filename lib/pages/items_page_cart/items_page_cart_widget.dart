import '/components/item_added/item_added_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'items_page_cart_model.dart';
export 'items_page_cart_model.dart';

class ItemsPageCartWidget extends StatefulWidget {
  const ItemsPageCartWidget({
    Key? key,
    required this.productName,
    required this.productDescription,
  }) : super(key: key);

  final String? productName;
  final String? productDescription;

  @override
  _ItemsPageCartWidgetState createState() => _ItemsPageCartWidgetState();
}

class _ItemsPageCartWidgetState extends State<ItemsPageCartWidget> {
  late ItemsPageCartModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemsPageCartModel());
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
        body: Stack(
          children: [
            Builder(
              builder: (context) {
                final productImage = List.generate(
                    random_data.randomInteger(5, 6),
                    (index) => random_data.randomName(true, true)).toList();
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children:
                        List.generate(productImage.length, (productImageIndex) {
                      final productImageItem = productImage[productImageIndex];
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/WhatsApp_Image_2023-07-14_at_00.56.31_(2).jpeg',
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 0.5,
                          fit: BoxFit.cover,
                        ),
                      );
                    }),
                  ),
                );
              },
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FlutterFlowIconButton(
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
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(1.0, -1.0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 20.0,
                        borderWidth: 1.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          Icons.ios_share_sharp,
                          color: Colors.white,
                          size: 24.0,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                    ),
                  ),
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 20.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      context.pushNamed('Cart_2');
                    },
                  ),
                ],
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
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ToggleIcon(
                          onPressed: () async {
                            setState(() => _model.expaded = !_model.expaded);
                          },
                          value: _model.expaded,
                          onIcon: Icon(
                            Icons.keyboard_arrow_down_sharp,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 25.0,
                          ),
                          offIcon: Icon(
                            Icons.keyboard_arrow_up,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 25.0,
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, -1.0),
                          child: Text(
                            widget.productName!,
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
                            '\$185',
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
                            data: widget.productDescription!,
                          ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, -1.0),
                              child: FlutterFlowDropDown<String>(
                                controller: _model.dropDownValueController ??=
                                    FormFieldController<String>(null),
                                options: <String>[],
                                onChanged: (val) =>
                                    setState(() => _model.dropDownValue = val),
                                width: 159.0,
                                height: 50.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      fontSize: 12.0,
                                    ),
                                hintText: 'Select Your Size',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                elevation: 2.0,
                                borderColor: Colors.transparent,
                                borderWidth: 2.0,
                                borderRadius: 8.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 4.0, 16.0, 4.0),
                                hidesUnderline: true,
                                isSearchable: false,
                              ),
                            ),
                            ToggleIcon(
                              onPressed: () async {
                                setState(
                                    () => _model.expaded = !_model.expaded);
                              },
                              value: _model.expaded,
                              onIcon: Icon(
                                Icons.favorite,
                                color: Color(0xFFFA0038),
                                size: 25.0,
                              ),
                              offIcon: Icon(
                                Icons.favorite_border,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 25.0,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 20.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () => FocusScope.of(context)
                                        .requestFocus(_model.unfocusNode),
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: ItemAddedWidget(),
                                    ),
                                  );
                                },
                              ).then((value) => setState(() {}));
                            },
                            text: 'ADD',
                            icon: Icon(
                              Icons.shopping_cart_outlined,
                              size: 15.0,
                            ),
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
                        ),
                      ]
                          .divide(SizedBox(height: 20.0))
                          .around(SizedBox(height: 20.0)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
