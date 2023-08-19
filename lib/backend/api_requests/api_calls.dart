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
  static ProductCall productCall = ProductCall();
  static OrdersCall ordersCall = OrdersCall();
  static ProductVariantCall productVariantCall = ProductVariantCall();
  static RetrieveCollectionsProductFirstResponseCall
      retrieveCollectionsProductFirstResponseCall =
      RetrieveCollectionsProductFirstResponseCall();
}

class RetrieveCollectionsProductCall {
  Future<ApiCallResponse> call({
    int? id,
    String? pageInfo = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Retrieve Collections Product',
      apiUrl: '${ShopifyAdminGroup.baseUrl}collections/${id}/products.json',
      callType: ApiCallType.GET,
      headers: {
        ...ShopifyAdminGroup.headers,
      },
      params: {
        'limit': 10,
        'page_info': pageInfo,
      },
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
    int? limit = 50,
    String? pageInfo = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: ' Collections List ',
      apiUrl:
          '${ShopifyAdminGroup.baseUrl}custom_collections.json?limit=${limit}',
      callType: ApiCallType.GET,
      headers: {
        ...ShopifyAdminGroup.headers,
      },
      params: {
        'page_info': pageInfo,
      },
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
        r'''$.custom_collections[1].title''',
      );
  dynamic initialid(dynamic response) => getJsonField(
        response,
        r'''$.custom_collections[1].id''',
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

class ProductCall {
  Future<ApiCallResponse> call({
    String? prId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Product',
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
        r'''$.product.variants[0]..price''',
      );
  dynamic variants(dynamic response) => getJsonField(
        response,
        r'''$.product.variants''',
        true,
      );
  dynamic variantstitle(dynamic response) => getJsonField(
        response,
        r'''$.product.variants..title''',
        true,
      );
  dynamic images(dynamic response) => getJsonField(
        response,
        r'''$.product.images..src''',
        true,
      );
  dynamic productVariant(dynamic response) => getJsonField(
        response,
        r'''$.product.variants[0].id''',
      );
  dynamic productitle(dynamic response) => getJsonField(
        response,
        r'''$.product.title''',
      );
  dynamic coverimage(dynamic response) => getJsonField(
        response,
        r'''$.product.images[0].src''',
      );
}

class OrdersCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Orders',
      apiUrl: '${ShopifyAdminGroup.baseUrl}customers/${id}/orders.json',
      callType: ApiCallType.GET,
      headers: {
        ...ShopifyAdminGroup.headers,
      },
      params: {
        'status': "any",
        'limit': 1,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.orders''',
        true,
      );
}

class ProductVariantCall {
  Future<ApiCallResponse> call({
    String? vrId = '35107817717915',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Product Variant',
      apiUrl: '${ShopifyAdminGroup.baseUrl}variants/${vrId}.json',
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

  dynamic productid(dynamic response) => getJsonField(
        response,
        r'''$.variant.product_id''',
      );
  dynamic variantprice(dynamic response) => getJsonField(
        response,
        r'''$.variant.price''',
      );
}

class RetrieveCollectionsProductFirstResponseCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Retrieve Collections Product First Response',
      apiUrl: '${ShopifyAdminGroup.baseUrl}collections/${id}/products.json',
      callType: ApiCallType.GET,
      headers: {
        ...ShopifyAdminGroup.headers,
      },
      params: {
        'limit': 10,
      },
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
