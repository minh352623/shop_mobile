import '/backend/api_requests/api_calls.dart';
import '/components/header_search_widget.dart';
import '/components/item_product_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool heath = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Get Slider)] action in Home widget.
  ApiCallResponse? apiResultgjg;
  // Stores action output result for [Backend Call - API (Get Partner)] action in Home widget.
  ApiCallResponse? apiResultbtl;
  // Stores action output result for [Backend Call - API (Get All Profuct)] action in Home widget.
  ApiCallResponse? apiResultewn;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for header_search component.
  late HeaderSearchModel headerSearchModel;
  // Models for item_product dynamic component.
  late FlutterFlowDynamicModels<ItemProductModel> itemProductModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headerSearchModel = createModel(context, () => HeaderSearchModel());
    itemProductModels = FlutterFlowDynamicModels(() => ItemProductModel());
  }

  void dispose() {
    unfocusNode.dispose();
    headerSearchModel.dispose();
    itemProductModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
