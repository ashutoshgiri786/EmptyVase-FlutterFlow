import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'price_model.dart';
export 'price_model.dart';

class PriceWidget extends StatefulWidget {
  const PriceWidget({
    Key? key,
    this.parameter1,
    this.parameter2,
    this.parameter3,
  }) : super(key: key);

  final String? parameter1;
  final dynamic parameter2;
  final dynamic parameter3;

  @override
  _PriceWidgetState createState() => _PriceWidgetState();
}

class _PriceWidgetState extends State<PriceWidget> {
  late PriceModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PriceModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Visibility(
      visible: widget.parameter2 != null,
      child: Align(
        alignment: AlignmentDirectional(-1.0, 0.0),
        child: FutureBuilder<ApiCallResponse>(
          future: ShopifyAdminGroup.productCall.call(
            prId: widget.parameter3?.toString(),
          ),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                ),
              );
            }
            final textProductResponse = snapshot.data!;
            return InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                setState(() {});
              },
              child: Text(
                ShopifyAdminGroup.productCall
                    .price(
                      textProductResponse.jsonBody,
                    )
                    .toString(),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Montserrat',
                      color: Color(0xFF2B4244),
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            );
          },
        ),
      ),
    );
  }
}
