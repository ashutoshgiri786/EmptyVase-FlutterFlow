import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

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

int subractOne(int input) {
  return input - 1;
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

List<dynamic> getVariantsIdAndPrice(
  String title,
  List<dynamic> variants,
) {
  // Get Id of collection from collection that matches the title
  for (var variant in variants) {
    if (variant['title'] == title) {
      return [variant['price'], variant['id']];
    }
  }
  return [];
}

String removeBetweenOccurence(
  String stringInput,
  int occurrence,
  String start,
  String end,
) {
  int startIndex = -1;
  for (int i = 0; i < occurrence; i++) {
    startIndex = stringInput.indexOf(start, startIndex + 1);
    if (startIndex == -1) {
      return "";
    }
  }

  int endIndex = stringInput.indexOf(end, startIndex + start.length);
  if (endIndex == -1) {
    return "";
  }

  String extractedText =
      stringInput.substring(startIndex + start.length, endIndex);

  return extractedText;
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

String removeletters(
  String from,
  String input,
) {
  final fromIndex = input.indexOf(from);
  if (fromIndex != -1) {
    return input.substring(fromIndex + from.length);
  }
  return input;
}

int addOne(int input) {
  return input + 1;
}

String urlDecoder(List<String> input) {
  String result = input.join(',');

  return result;
}

String getCountryProvinces(
  String countryId,
  List<dynamic> provinces,
) {
  for (var collection in provinces) {
    if (collection['country_id'] == countryId) {
      return collection['name'] as String;
    }
  }
  return "";
}

List<dynamic> listconcat(
  List<dynamic> list1,
  List<dynamic> list2,
) {
  List<dynamic> concatenatedList = [];
  concatenatedList.addAll(list1);
  concatenatedList.addAll(list2);
  return concatenatedList;
}

List<String> stringListToSet(List<String>? stringList) {
  stringList?.sort();
  return stringList != null ? stringList.toSet().toList() : [];
}
