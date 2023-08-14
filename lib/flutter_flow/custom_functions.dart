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

String removeBetween(
  String start,
  String end,
  String stringInput,
) {
  int startIndex = stringInput.indexOf(start);
  if (startIndex == -1) {
    return "";
  }

  int endIndex = stringInput.indexOf(end, startIndex + start.length);
  if (endIndex == -1) {
    return "";
  }

  String extractedText =
      stringInput.substring(startIndex + start.length, endIndex);

  return extractedText;
}

String removesletters(
  String stringInput,
  int? start,
) {
  start ??= 0;

  if (start < 0) {
    start = 0;
  }

  return stringInput.substring(start);
}

String? extractPageInfo(String fullUrl) {
  Uri parsedUrl = Uri.parse(fullUrl);
  Map<String, List<String>> queryParameters = parsedUrl.queryParametersAll;

  if (queryParameters.containsKey('page_info')) {
    return queryParameters['page_info']![0];
  } else {
    return ''; // Page info not found in URL
  }
}
