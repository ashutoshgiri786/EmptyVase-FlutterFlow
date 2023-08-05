// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:graphql_flutter/graphql_flutter.dart';

Future<dynamic> signUp(
  String email,
  String password,
  String firstName,
  String lastName,
  bool acceptsMarketing,
  String confirmPassword,
) async {
  if (password == confirmPassword) {
    final httpLink = HttpLink(
      FFAppState().graphqlEndpoint,
      defaultHeaders: {
        'X-Shopify-Storefront-Access-Token': FFAppState().storefrontAccessToken,
      },
    );

    final client = GraphQLClient(link: httpLink, cache: GraphQLCache());

    final String mutation = '''
    mutation RegisterAccount(
      \$email: String!, 
      \$password: String!,  
      \$firstName: String!, 
      \$lastName: String!, 
      \$acceptsMarketing: Boolean = false,
    ) {
      customerCreate(input: {
        email: \$email, 
        password: \$password, 
        firstName: \$firstName, 
        lastName: \$lastName,
        acceptsMarketing: \$acceptsMarketing, 
      }) {
        customer {
          id
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
        'email': email,
        'password': password,
        'firstName': firstName,
        'lastName': lastName,
        'acceptsMarketing': acceptsMarketing,
      },
    );

    final QueryResult result = await client.mutate(options);

    if (result.hasException) {
      print('Error: ${result.exception.toString()}');
      return null;
    }

    return result.data?['customerCreate'];
  } else {
    return "Password Does Not Matched";
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
