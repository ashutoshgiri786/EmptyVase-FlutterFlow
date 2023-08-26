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
  static CreateMetafieldsCall createMetafieldsCall = CreateMetafieldsCall();
  static GetMetafieldsCall getMetafieldsCall = GetMetafieldsCall();
  static GetproductlistCall getproductlistCall = GetproductlistCall();
  static GiftShopsCategoryCall giftShopsCategoryCall = GiftShopsCategoryCall();
  static DeleteMetafieldsCall deleteMetafieldsCall = DeleteMetafieldsCall();
  static RetrieveSpecificMetafieldCall retrieveSpecificMetafieldCall =
      RetrieveSpecificMetafieldCall();
  static CustomerDetailsCall customerDetailsCall = CustomerDetailsCall();
  static ListOfShippingZonesCall listOfShippingZonesCall =
      ListOfShippingZonesCall();
  static FetchCustomerInfoCall fetchCustomerInfoCall = FetchCustomerInfoCall();
  static FlowersCategoryCall flowersCategoryCall = FlowersCategoryCall();
  static SearchProductCall searchProductCall = SearchProductCall();
  static FlowersClubCall flowersClubCall = FlowersClubCall();
  static ResetPasswordCall resetPasswordCall = ResetPasswordCall();
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
  dynamic productId(dynamic response) => getJsonField(
        response,
        r'''$.product.id''',
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

class CreateMetafieldsCall {
  Future<ApiCallResponse> call({
    String? customerId = '',
    int? productId,
    int? productVariant,
  }) {
    final body = '''
{
  "metafield": {
    "namespace": "product",
    "key": ${productId},
    "type": "multi_line_text_field",
    "value": ${productVariant}
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create Metafields',
      apiUrl:
          '${ShopifyAdminGroup.baseUrl}customers/${customerId}/metafields.json',
      callType: ApiCallType.POST,
      headers: {
        ...ShopifyAdminGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetMetafieldsCall {
  Future<ApiCallResponse> call({
    String? customerId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Metafields',
      apiUrl:
          '${ShopifyAdminGroup.baseUrl}customers/${customerId}/metafields.json',
      callType: ApiCallType.GET,
      headers: {
        ...ShopifyAdminGroup.headers,
      },
      params: {
        'namespace': "product",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic metafieldsValue(dynamic response) => getJsonField(
        response,
        r'''$.metafields..key''',
        true,
      );
  dynamic metafieldsKey(dynamic response) => getJsonField(
        response,
        r'''$.metafields..value''',
        true,
      );
}

class GetproductlistCall {
  Future<ApiCallResponse> call({
    String? ids = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Getproductlist',
      apiUrl: '${ShopifyAdminGroup.baseUrl}products.json',
      callType: ApiCallType.GET,
      headers: {
        ...ShopifyAdminGroup.headers,
      },
      params: {
        'ids': ids,
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
}

class GiftShopsCategoryCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Gift Shops Category',
      apiUrl:
          '${ShopifyAdminGroup.baseUrl}custom_collections.json?ids=230519144603,231548813467,231550025883,230519177371,231549010075,231549075611,231549141147,266731585691,273095098523',
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

  dynamic collections(dynamic response) => getJsonField(
        response,
        r'''$.custom_collections''',
        true,
      );
  dynamic title(dynamic response) => getJsonField(
        response,
        r'''$.custom_collections..title''',
        true,
      );
  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.custom_collections..id''',
        true,
      );
  dynamic images(dynamic response) => getJsonField(
        response,
        r'''$.custom_collections..image..src''',
        true,
      );
}

class DeleteMetafieldsCall {
  Future<ApiCallResponse> call({
    String? customerId = '',
    String? metafieldId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Delete Metafields',
      apiUrl:
          '${ShopifyAdminGroup.baseUrl}customers/${customerId}/metafields/${metafieldId}.json',
      callType: ApiCallType.DELETE,
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
}

class RetrieveSpecificMetafieldCall {
  Future<ApiCallResponse> call({
    String? customerId = '',
    String? productid = '',
    String? productVariant = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Retrieve Specific Metafield',
      apiUrl:
          '${ShopifyAdminGroup.baseUrl}customers/${customerId}/metafields.json',
      callType: ApiCallType.GET,
      headers: {
        ...ShopifyAdminGroup.headers,
      },
      params: {
        'key': productid,
        'value': productVariant,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic metafieldId(dynamic response) => getJsonField(
        response,
        r'''$.metafields[0]..id''',
      );
}

class CustomerDetailsCall {
  Future<ApiCallResponse> call({
    String? customerId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Customer Details',
      apiUrl: '${ShopifyAdminGroup.baseUrl}customers/${customerId}.json',
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

  dynamic defaultAddress(dynamic response) => getJsonField(
        response,
        r'''$..customer.default_address''',
      );
}

class ListOfShippingZonesCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'List of shipping zones',
      apiUrl: '${ShopifyAdminGroup.baseUrl}shipping_zones.json',
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

  dynamic countries(dynamic response) => getJsonField(
        response,
        r'''$.shipping_zones..countries[0].name''',
        true,
      );
  dynamic provinces(dynamic response) => getJsonField(
        response,
        r'''$.shipping_zones..countries..name''',
        true,
      );
}

class FetchCustomerInfoCall {
  Future<ApiCallResponse> call({
    String? customerid = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Fetch customer info',
      apiUrl: '${ShopifyAdminGroup.baseUrl}customers/${customerid}.json',
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

  dynamic customerEmail(dynamic response) => getJsonField(
        response,
        r'''$.customer.email''',
      );
  dynamic firstName(dynamic response) => getJsonField(
        response,
        r'''$.customer.first_name''',
      );
  dynamic lastName(dynamic response) => getJsonField(
        response,
        r'''$.customer.last_name''',
      );
}

class FlowersCategoryCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Flowers Category ',
      apiUrl:
          '${ShopifyAdminGroup.baseUrl}custom_collections.json?ids=405240676598,227433545883,404392313078,265837969563,207275622555,207275393179,391735836918,402852380918,207275458715,207275753627,',
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

  dynamic collections(dynamic response) => getJsonField(
        response,
        r'''$.custom_collections''',
        true,
      );
  dynamic title(dynamic response) => getJsonField(
        response,
        r'''$.custom_collections..title''',
        true,
      );
}

class SearchProductCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'search product',
      apiUrl: '${ShopifyAdminGroup.baseUrl}products.json?title=100*',
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
}

class FlowersClubCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Flowers Club',
      apiUrl: '${ShopifyAdminGroup.baseUrl}products/5496359616667.json',
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

  dynamic duration(dynamic response) => getJsonField(
        response,
        r'''$.product..options[1].values''',
        true,
      );
  dynamic pricing(dynamic response) => getJsonField(
        response,
        r'''$.product..options[0].values''',
        true,
      );
  dynamic title(dynamic response) => getJsonField(
        response,
        r'''$.product.title''',
      );
  dynamic description(dynamic response) => getJsonField(
        response,
        r'''$.product.body_html''',
      );
  dynamic images(dynamic response) => getJsonField(
        response,
        r'''$.product.images..src''',
        true,
      );
  dynamic initialPricing(dynamic response) => getJsonField(
        response,
        r'''$.product..options[0].values[0]''',
      );
  dynamic initialDuration(dynamic response) => getJsonField(
        response,
        r'''$.product..options[1].values[0]''',
      );
}

class ResetPasswordCall {
  Future<ApiCallResponse> call({
    String? customerId = '',
    String? password = '',
  }) {
    final body = '''
{
  "customer": {
"id":"${customerId}",
    "password": "${password}",
    "password_confirmation": "${password}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Reset Password',
      apiUrl: '${ShopifyAdminGroup.baseUrl}customers/${customerId}.json',
      callType: ApiCallType.PUT,
      headers: {
        ...ShopifyAdminGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Shopify Admin Group Code

class ProductsCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Products',
      apiUrl:
          'https://EmptyVase.myshopify.com/admin/api/2023-04/products/5496359616667.json',
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
