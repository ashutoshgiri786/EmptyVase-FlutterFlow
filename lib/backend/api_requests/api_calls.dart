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
  static ProductImageCall productImageCall = ProductImageCall();
  static ProductPriceCall productPriceCall = ProductPriceCall();
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
  dynamic productid(dynamic response) => getJsonField(
        response,
        r'''$.products..id''',
        true,
      );
  dynamic images(dynamic response) => getJsonField(
        response,
        r'''$.products..images..src''',
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

class ProductImageCall {
  Future<ApiCallResponse> call({
    int? id = 7867779186934,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Product Image',
      apiUrl: '${ShopifyAdminGroup.baseUrl}products/${id}/images.json',
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

  dynamic image(dynamic response) => getJsonField(
        response,
        r'''$.images..src''',
        true,
      );
}

class ProductPriceCall {
  Future<ApiCallResponse> call({
    int? prId = 5403721891995,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Product Price',
      apiUrl: '${ShopifyAdminGroup.baseUrl}/products/${prId}.json',
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

  dynamic price(dynamic response) => getJsonField(
        response,
        r'''$.product.variants..price''',
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
