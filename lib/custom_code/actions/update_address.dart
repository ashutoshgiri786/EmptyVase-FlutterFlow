// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:graphql_flutter/graphql_flutter.dart';

Future<dynamic> updateAddress(
  String addressId,
  String customerAccessToken,
  String address1,
  String province,
  String city,
  String zip,
) async {
  final httpLink = HttpLink(
    FFAppState().graphqlEndpoint,
    defaultHeaders: {
      'X-Shopify-Storefront-Access-Token': FFAppState().storefrontAccessToken,
    },
  );

  final client = GraphQLClient(link: httpLink, cache: GraphQLCache());

  final String mutation = r'''
  mutation UpdateAddress(
    $addressId: ID!,
    $customerAccessToken: String!, 
    $address1: String!,
    $country: String!,
    $province: String!,
    $city: String!,
    $zip: String!
  ) {
    customerAddressUpdate(
      id: $addressId,
      customerAccessToken: $customerAccessToken,
      address: {
        address1: $address1, 
        country: $country, 
        province: $province, 
        city: $city, 
        zip: $zip
      }
    ) { 
      customerAddress {
        id
      }
      customerUserErrors {
        code
        message
      }
      userErrors {
        message
      }
    }
  }
''';

  final MutationOptions options = MutationOptions(
    document: gql(mutation),
    variables: {
      "addressId": addressId,
      "customerAccessToken": customerAccessToken,
      'address1': address1,
      'country': "United States",
      "province": province,
      "city": city,
      "zip": zip,
    },
  );

  final QueryResult result = await client.mutate(options);

  if (result.hasException) {
    print('Error: ${result.exception.toString()}');
    return null;
  }

  return result.data;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
