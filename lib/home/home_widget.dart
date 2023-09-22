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
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultgjg = await ShopGroup.getSliderCall.call(
        accessToken: FFAppState().accessToken,
      );
      if ((_model.apiResultgjg?.succeeded ?? true)) {
        setState(() {
          FFAppState().listSlider =
              (_model.apiResultgjg?.jsonBody ?? '').toList().cast<dynamic>();
        });
      }
      _model.apiResultbtl = await ShopGroup.getPartnerCall.call(
        accessToken: FFAppState().accessToken,
      );
      if ((_model.apiResultbtl?.succeeded ?? true)) {
        setState(() {
          FFAppState().ListPartner =
              (_model.apiResultbtl?.jsonBody ?? '').toList().cast<dynamic>();
        });
      }
      _model.apiResultewn = await ShopGroup.getAllProfuctCall.call(
        accessToken: FFAppState().accessToken,
      );
      if ((_model.apiResultewn?.succeeded ?? true)) {
        setState(() {
          FFAppState().AllProduct =
              (_model.apiResultewn?.jsonBody ?? '').toList().cast<dynamic>();
        });
      }
    });
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: MediaQuery.sizeOf(context).height * 1.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 100.0,
                    height: 400.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(),
                          child: Builder(
                            builder: (context) {
                              final slider = FFAppState().listSlider.toList();
                              return Container(
                                width: double.infinity,
                                height: 300.0,
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 40.0),
                                      child: PageView.builder(
                                        controller: _model
                                                .pageViewController ??=
                                            PageController(
                                                initialPage:
                                                    min(0, slider.length - 1)),
                                        scrollDirection: Axis.horizontal,
                                        itemCount: slider.length,
                                        itemBuilder: (context, sliderIndex) {
                                          final sliderItem =
                                              slider[sliderIndex];
                                          return Container();
                                        },
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 0.50),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 0.0, 16.0),
                                        child: smooth_page_indicator
                                            .SmoothPageIndicator(
                                          controller: _model
                                                  .pageViewController ??=
                                              PageController(
                                                  initialPage: min(
                                                      0, slider.length - 1)),
                                          count: slider.length,
                                          axisDirection: Axis.horizontal,
                                          onDotClicked: (i) async {
                                            await _model.pageViewController!
                                                .animateToPage(
                                              i,
                                              duration:
                                                  Duration(milliseconds: 500),
                                              curve: Curves.ease,
                                            );
                                          },
                                          effect:
                                              smooth_page_indicator.SlideEffect(
                                            spacing: 8.0,
                                            radius: 16.0,
                                            dotWidth: 16.0,
                                            dotHeight: 16.0,
                                            dotColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            activeDotColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            paintStyle: PaintingStyle.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 30.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Container(
                                  width: 100.0,
                                  decoration: BoxDecoration(),
                                  child: wrapWithModel(
                                    model: _model.headerSearchModel,
                                    updateCallback: () => setState(() {}),
                                    child: HeaderSearchWidget(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Builder(
                                builder: (context) {
                                  final partner =
                                      FFAppState().ListPartner.toList();
                                  return Wrap(
                                    spacing: 8.0,
                                    runSpacing: 8.0,
                                    alignment: WrapAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.start,
                                    direction: Axis.horizontal,
                                    runAlignment: WrapAlignment.start,
                                    verticalDirection: VerticalDirection.down,
                                    clipBehavior: Clip.none,
                                    children: List.generate(partner.length,
                                        (partnerIndex) {
                                      final partnerItem = partner[partnerIndex];
                                      return Container(
                                        width: 100.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x33000000),
                                              offset: Offset(0.0, 2.0),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 8.0, 8.0, 8.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.network(
                                                  getJsonField(
                                                    partnerItem,
                                                    r'''$.image''',
                                                  ),
                                                  width: 100.0,
                                                  height: 100.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Text(
                                                getJsonField(
                                                  partnerItem,
                                                  r'''$.name''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ].divide(SizedBox(height: 4.0)),
                                          ),
                                        ),
                                      );
                                    }),
                                  );
                                },
                              ),
                            ),
                          ].divide(SizedBox(height: 8.0)),
                        ),
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              FlutterFlowTheme.of(context).error,
                              Color(0x18FF5963)
                            ],
                            stops: [0.0, 1.0],
                            begin: AlignmentDirectional(0.0, -1.0),
                            end: AlignmentDirectional(0, 1.0),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 12.0, 12.0, 12.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Sản phẩm',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Xem thêm',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_right,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        size: 24.0,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 280.0,
                                decoration: BoxDecoration(),
                                child: Builder(
                                  builder: (context) {
                                    final product =
                                        FFAppState().AllProduct.toList();
                                    return SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(product.length,
                                            (productIndex) {
                                          final productItem =
                                              product[productIndex];
                                          return wrapWithModel(
                                            model: _model.itemProductModels
                                                .getModel(
                                              getJsonField(
                                                productItem,
                                                r'''$.id''',
                                              ).toString(),
                                              productIndex,
                                            ),
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: ItemProductWidget(
                                              key: Key(
                                                'Keyi2m_${getJsonField(
                                                  productItem,
                                                  r'''$.id''',
                                                ).toString()}',
                                              ),
                                              width: 150.0,
                                              data: productItem,
                                            ),
                                          );
                                        }).divide(SizedBox(width: 8.0)),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ].divide(SizedBox(height: 16.0)),
                          ),
                        ),
                      ),
                    ].divide(SizedBox(height: 16.0)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
