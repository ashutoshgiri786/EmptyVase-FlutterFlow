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

Future<dynamic> retreiveCollectionProductNextPage(
  String collectionId,
  String endcursor,
) async {
  final httpLink = HttpLink(
    FFAppState().graphqlEndpoint,
    defaultHeaders: {
      'X-Shopify-Storefront-Access-Token': FFAppState().storefrontAccessToken,
    },
  );

  final client = GraphQLClient(link: httpLink, cache: GraphQLCache());

  final String mutation = '''
{
  collection(id: "gid://shopify/Collection/$collectionId") {
    products(first: 10, after:"$endcursor") {
      pageInfo {
        hasNextPage
        endCursor
      }
      edges {
        cursor
        node {
         
          id
          title
          variants(first: 1) {
            edges {
              node {
                price {
                  amount
                  currencyCode
                }

              }

            }

          }
           images(first: 1) {
            edges {
              node {
                src
              }
            }
          }
        }
      }
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

  return result.data;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
