import '/components/header_search_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ShopModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for header_search component.
  late HeaderSearchModel headerSearchModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headerSearchModel = createModel(context, () => HeaderSearchModel());
  }

  void dispose() {
    unfocusNode.dispose();
    headerSearchModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
