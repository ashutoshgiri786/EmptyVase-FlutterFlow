import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/Copy_of_EV_APP.png',
            fit: BoxFit.cover,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'SplashScreen': ParameterData.none(),
  'LoginPage': ParameterData.none(),
  'ForgotPasswordPage': ParameterData.none(),
  'SignUp': ParameterData.none(),
  'Homepage': ParameterData.none(),
  'Flowers': (data) async => ParameterData(
        allParams: {
          'id': getParameter<int>(data, 'id'),
          'choiceinitialvalue':
              getParameter<String>(data, 'choiceinitialvalue'),
        },
      ),
  'Notification': ParameterData.none(),
  'Wallet': ParameterData.none(),
  'Profile': ParameterData.none(),
  'Addresses': ParameterData.none(),
  'NewAddress': (data) async => ParameterData(
        allParams: {
          'address': getParameter<String>(data, 'address'),
          'province': getParameter<String>(data, 'province'),
          'city': getParameter<String>(data, 'city'),
          'zip': getParameter<String>(data, 'zip'),
          'country': getParameter<String>(data, 'country'),
          'update': getParameter<bool>(data, 'update'),
          'id': getParameter<String>(data, 'id'),
        },
      ),
  'PetalsPoints': ParameterData.none(),
  'Apply_Coupon': ParameterData.none(),
  'Reset': ParameterData.none(),
  'OrderHistory': ParameterData.none(),
  'Cart': ParameterData.none(),
  'ContactUs': ParameterData.none(),
  'Cart_2': ParameterData.none(),
  'Delivery_Pickup': ParameterData.none(),
  'Delivery_Pickup_Selected': ParameterData.none(),
  'Payment': ParameterData.none(),
  'Order_Summary': ParameterData.none(),
  'Order_Recieved': ParameterData.none(),
  'items_page_cart': (data) async => ParameterData(
        allParams: {
          'id': getParameter<String>(data, 'id'),
        },
      ),
  'TermsAndCondition': ParameterData.none(),
  'GiftShop': ParameterData.none(),
  'FlowersPage': (data) async => ParameterData(
        allParams: {
          'id': getParameter<int>(data, 'id'),
          'categorytitle': getParameter<String>(data, 'categorytitle'),
        },
      ),
  'wishlist': ParameterData.none(),
  'FlowersClub': ParameterData.none(),
  'search': ParameterData.none(),
  'GiftShopPage': (data) async => ParameterData(
        allParams: {
          'id': getParameter<int>(data, 'id'),
          'categorytitle': getParameter<String>(data, 'categorytitle'),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
