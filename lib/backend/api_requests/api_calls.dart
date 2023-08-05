import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Shopify Admin Group Code

class ShopifyAdminGroup {
  static String baseUrl = 'https://EmptyVase.myshopify.com/admin/api/2023-04/';
  static Map<String, String> headers = {
    'X-Shopify-Access-Token': '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',
  };
  static RetrieveCollectionsProductCall retrieveCollectionsProductCall =
      RetrieveCollectionsProductCall();
  static CollectionsListCall collectionsListCall = CollectionsListCall();
}

class RetrieveCollectionsProductCall {
  Future<ApiCallResponse> call({
    int? id,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Retrieve Collections Product',
      apiUrl: '${ShopifyAdminGroup.baseUrl}collections/${id}/products.json',
      callType: ApiCallType.GET,
      headers: {
        ...ShopifyAdminGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic product(dynamic response) => getJsonField(
        response,
        r'''$.products''',
        true,
      );
}

class CollectionsListCall {
  Future<ApiCallResponse> call({
    String? limit = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: ' Collections List ',
      apiUrl: '${ShopifyAdminGroup.baseUrl}custom_collections.json?limit=5',
      callType: ApiCallType.GET,
      headers: {
        ...ShopifyAdminGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic title(dynamic response) => getJsonField(
        response,
        r'''$.custom_collections..title''',
        true,
      );
  dynamic collections(dynamic response) => getJsonField(
        response,
        r'''$.custom_collections''',
        true,
      );
  dynamic initialtitle(dynamic response) => getJsonField(
        response,
        r'''$.custom_collections[0].title''',
      );
}

/// End Shopify Admin Group Code

class ProductsCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Products',
      apiUrl: 'https://EmptyVase.myshopify.com/admin/api/2023-04/products.json',
      callType: ApiCallType.GET,
      headers: {
        'X-Shopify-Access-Token': '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',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic image(dynamic response) => getJsonField(
        response,
        r'''$.products..images..src''',
        true,
      );
}

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
