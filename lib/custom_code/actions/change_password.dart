// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart';

Future<void> changePassword(String password) async {
  try {
    // Create an instance of the current user.
    User user = FirebaseAuth.instance.currentUser!;

    // Pass in the password to updatePassword.
    await user.updatePassword(password);

    print("Successfully changed password");
  } catch (error) {
    print("Password can't be changed: $error");
    // This might happen when the wrong password is provided,
    // the user isn't found, or if the user hasn't logged in recently.
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
