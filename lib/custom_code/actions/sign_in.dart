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

Future<String> signIn(
  String email,
  String password,
) async {
  final httpLink = HttpLink(
    FFAppState().graphqlEndpoint,
    defaultHeaders: {
      'X-Shopify-Storefront-Access-Token': FFAppState().storefrontAccessToken,
    },
  );

  final client = GraphQLClient(link: httpLink, cache: GraphQLCache());

  final String mutation = '''
  mutation RegisterAccount(\$email: String!, \$password: String!) {
    customerAccessTokenCreate(input: { 
      email: \$email, 
      password: \$password,
    }) {
      customerAccessToken {
        accessToken
        expiresAt
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
    variables: {'email': email, 'password': password},
  );

  final QueryResult result = await client.mutate(options);

  if (result.hasException) {
    print('Error: ${result.exception.toString()}');
    return "Invalid Error";
  }
  try {
    FFAppState().update(() {
      FFAppState().accessToken = (result.data!["customerAccessTokenCreate"]
                  ["customerAccessToken"]["accessToken"] ??
              "")
          .toString();
    });
    return "Logged In";
  } catch (e) {
    return "Invalid Id Or Password";
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
