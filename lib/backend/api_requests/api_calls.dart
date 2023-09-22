import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Shop Group Code

class ShopGroup {
  static String baseUrl = 'https://shoppet.site/api';
  static Map<String, String> headers = {};
  static GetSliderCall getSliderCall = GetSliderCall();
  static GetPartnerCall getPartnerCall = GetPartnerCall();
  static GetAllProfuctCall getAllProfuctCall = GetAllProfuctCall();
}

class GetSliderCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Slider',
      apiUrl: '${ShopGroup.baseUrl}/slider/all',
      callType: ApiCallType.GET,
      headers: {
        ...ShopGroup.headers,
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetPartnerCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Partner',
      apiUrl: '${ShopGroup.baseUrl}/partner/all',
      callType: ApiCallType.GET,
      headers: {
        ...ShopGroup.headers,
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetAllProfuctCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get All Profuct',
      apiUrl: '${ShopGroup.baseUrl}/product/top10?all=all',
      callType: ApiCallType.GET,
      headers: {
        ...ShopGroup.headers,
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Shop Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
