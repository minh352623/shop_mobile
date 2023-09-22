import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'item_product_model.dart';
export 'item_product_model.dart';

class ItemProductWidget extends StatefulWidget {
  const ItemProductWidget({
    Key? key,
    this.data,
    this.width,
  }) : super(key: key);

  final dynamic data;
  final double? width;

  @override
  _ItemProductWidgetState createState() => _ItemProductWidgetState();
}

class _ItemProductWidgetState extends State<ItemProductWidget> {
  late ItemProductModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemProductModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: widget.width != null
          ? widget.width
          : MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(1.00, -1.00),
                  child: Stack(
                    alignment: AlignmentDirectional(1.0, -1.0),
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          getJsonField(
                            widget.data,
                            r'''$.file_path''',
                          ),
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 150.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      ToggleIcon(
                        onPressed: () async {
                          setState(() => _model.heath = !_model.heath);
                        },
                        value: _model.heath,
                        onIcon: Icon(
                          Icons.favorite_sharp,
                          color: FlutterFlowTheme.of(context).alternate,
                          size: 25.0,
                        ),
                        offIcon: Icon(
                          Icons.favorite_border_rounded,
                          color: FlutterFlowTheme.of(context).alternate,
                          size: 25.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  '\$${getJsonField(
                    widget.data,
                    r'''$.price''',
                  ).toString()}',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).alternate,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        getJsonField(
                          widget.data,
                          r'''$.name''',
                        ).toString().maybeHandleOverflow(maxChars: 34),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              lineHeight: 1.0,
                            ),
                      ),
                    ),
                  ],
                ),
              ].divide(SizedBox(height: 8.0)),
            ),
            FFButtonWidget(
              onPressed: () {
                print('Button pressed ...');
              },
              text: 'Thêm vào giỏ',
              options: FFButtonOptions(
                height: 40.0,
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).error,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                elevation: 3.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(100.0),
              ),
            ),
          ].divide(SizedBox(height: 8.0)),
        ),
      ),
    );
  }
}
