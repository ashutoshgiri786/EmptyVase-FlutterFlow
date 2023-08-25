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

Future<dynamic> defaultAddress(
  String addressId,
  String customerAccessToken,
) async {
  final httpLink = HttpLink(
    FFAppState().graphqlEndpoint,
    defaultHeaders: {
      'X-Shopify-Storefront-Access-Token': FFAppState().storefrontAccessToken,
    },
  );

  final client = GraphQLClient(link: httpLink, cache: GraphQLCache());

  final String mutation = r'''
  mutation SetDefaultAddress(
    $customerAccessToken: String!, 
    $addressId: ID!,
) {
    customerDefaultAddressUpdate(
        customerAccessToken: $customerAccessToken,
        addressId: $addressId, 
    ) {
        customer {
            defaultAddress {
                id
            }
        }
        customerUserErrors {
            code
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
