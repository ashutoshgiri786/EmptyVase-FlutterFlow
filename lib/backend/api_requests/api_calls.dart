import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';
import '../cloud_functions/cloud_functions.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Shopify Admin Group Code

class ShopifyAdminGroup {
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
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'RetrieveCollectionsProductCall',
        'variables': {
          'id': id,
          'pageInfo': pageInfo,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
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
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CollectionsListCall',
        'variables': {
          'limit': limit,
          'pageInfo': pageInfo,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
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
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ProductImageCall',
        'variables': {
          'id': id,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
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
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ProductCall',
        'variables': {
          'prId': prId,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
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
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'OrdersCall',
        'variables': {
          'id': id,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
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
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ProductVariantCall',
        'variables': {
          'vrId': vrId,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
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
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateMetafieldsCall',
        'variables': {
          'customerId': customerId,
          'productId': productId,
          'productVariant': productVariant,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class GetMetafieldsCall {
  Future<ApiCallResponse> call({
    String? customerId = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GetMetafieldsCall',
        'variables': {
          'customerId': customerId,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
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
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GetproductlistCall',
        'variables': {
          'ids': ids,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  dynamic product(dynamic response) => getJsonField(
        response,
        r'''$.products''',
        true,
      );
}

class GiftShopsCategoryCall {
  Future<ApiCallResponse> call() async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GiftShopsCategoryCall',
        'variables': {},
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
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
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'DeleteMetafieldsCall',
        'variables': {
          'customerId': customerId,
          'metafieldId': metafieldId,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class RetrieveSpecificMetafieldCall {
  Future<ApiCallResponse> call({
    String? customerId = '',
    String? productid = '',
    String? productVariant = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'RetrieveSpecificMetafieldCall',
        'variables': {
          'customerId': customerId,
          'productid': productid,
          'productVariant': productVariant,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  dynamic metafieldId(dynamic response) => getJsonField(
        response,
        r'''$.metafields[0]..id''',
      );
}

class CustomerDetailsCall {
  Future<ApiCallResponse> call({
    String? customerId = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CustomerDetailsCall',
        'variables': {
          'customerId': customerId,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  dynamic defaultAddress(dynamic response) => getJsonField(
        response,
        r'''$..customer.default_address''',
      );
}

class ListOfShippingZonesCall {
  Future<ApiCallResponse> call() async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ListOfShippingZonesCall',
        'variables': {},
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
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
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'FetchCustomerInfoCall',
        'variables': {
          'customerid': customerid,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
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
  Future<ApiCallResponse> call() async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'FlowersCategoryCall',
        'variables': {},
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
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
  Future<ApiCallResponse> call() async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'SearchProductCall',
        'variables': {},
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class FlowersClubCall {
  Future<ApiCallResponse> call() async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'FlowersClubCall',
        'variables': {},
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
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
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ResetPasswordCall',
        'variables': {
          'customerId': customerId,
          'password': password,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
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
      cache: true,
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
