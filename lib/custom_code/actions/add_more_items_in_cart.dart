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

Future<dynamic> addMoreItemsInCart(
  String productVariantId,
  int quantity,
) async {
  final httpLink = HttpLink(
    FFAppState().graphqlEndpoint,
    defaultHeaders: {
      'X-Shopify-Storefront-Access-Token': FFAppState().storefrontAccessToken,
    },
  );

  final client = GraphQLClient(link: httpLink, cache: GraphQLCache());
  final cart_id = FFAppState().cartId;

  final String mutation = '''
  mutation {
  cartLinesAdd(cartId: "$cart_id", lines: [
    {
      merchandiseId: "gid://shopify/ProductVariant/$productVariantId",
      quantity: $quantity
    }
  ]) {
    cart {
      id
      lines(first: 10) {
        edges {
          node {
            id
            quantity
            merchandise {
              ... on ProductVariant {

                id,
                
              },
            }
          }
        }
      }
    }
    userErrors {
      field
      message
    }
  }
}

  ''';

  final MutationOptions options = MutationOptions(
    document: gql(mutation),
  );

  final QueryResult result = await client.mutate(options);

  if (result.hasException) {
    print('Error: ${result.exception.toString()}');
    return null;
  }

  return result.data?["cartLinesAdd"];
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
