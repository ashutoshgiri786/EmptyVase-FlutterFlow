import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';

int getFlowersId(
  String title,
  List<dynamic> collections,
) {
  // Get Id of collection from collection that matches the title
  for (var collection in collections) {
    if (collection['title'] == title) {
      return collection['id'];
    }
  }
  return 0;
}

bool? productvariants(List<String> input) {
  // generate a code which take input as a list and returns false if the list more than 1 item
  if (input.length > 1) {
    return false;
  }
  return true;
}
