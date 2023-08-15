import 'package:flutter/material.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _graphqlEndpoint = await secureStorage.getString('ff_graphqlEndpoint') ??
          _graphqlEndpoint;
    });
    await _safeInitAsync(() async {
      _storefrontAccessToken =
          await secureStorage.getString('ff_storefrontAccessToken') ??
              _storefrontAccessToken;
    });
    await _safeInitAsync(() async {
      _accessToken =
          await secureStorage.getString('ff_accessToken') ?? _accessToken;
    });
    await _safeInitAsync(() async {
      _adminAccesToken = await secureStorage.getString('ff_adminAccesToken') ??
          _adminAccesToken;
    });
    await _safeInitAsync(() async {
      _cartId = await secureStorage.getString('ff_cartId') ?? _cartId;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _graphqlEndpoint =
      'https://EmptyVase.myshopify.com/api/2022-01/graphql.json';
  String get graphqlEndpoint => _graphqlEndpoint;
  set graphqlEndpoint(String _value) {
    _graphqlEndpoint = _value;
    secureStorage.setString('ff_graphqlEndpoint', _value);
  }

  void deleteGraphqlEndpoint() {
    secureStorage.delete(key: 'ff_graphqlEndpoint');
  }

  String _storefrontAccessToken = '5502480d0d7294c19398721028a62f1b';
  String get storefrontAccessToken => _storefrontAccessToken;
  set storefrontAccessToken(String _value) {
    _storefrontAccessToken = _value;
    secureStorage.setString('ff_storefrontAccessToken', _value);
  }

  void deleteStorefrontAccessToken() {
    secureStorage.delete(key: 'ff_storefrontAccessToken');
  }

  bool _TermsAndCondition = false;
  bool get TermsAndCondition => _TermsAndCondition;
  set TermsAndCondition(bool _value) {
    _TermsAndCondition = _value;
  }

  String _accessToken = '';
  String get accessToken => _accessToken;
  set accessToken(String _value) {
    _accessToken = _value;
    secureStorage.setString('ff_accessToken', _value);
  }

  void deleteAccessToken() {
    secureStorage.delete(key: 'ff_accessToken');
  }

  String _adminAccesToken = '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';
  String get adminAccesToken => _adminAccesToken;
  set adminAccesToken(String _value) {
    _adminAccesToken = _value;
    secureStorage.setString('ff_adminAccesToken', _value);
  }

  void deleteAdminAccesToken() {
    secureStorage.delete(key: 'ff_adminAccesToken');
  }

  String _customerId = '';
  String get customerId => _customerId;
  set customerId(String _value) {
    _customerId = _value;
  }

  String _cartId = 'gid://shopify/Cart/c1-ce8abd8186e310e028a488184ca2f37a';
  String get cartId => _cartId;
  set cartId(String _value) {
    _cartId = _value;
    secureStorage.setString('ff_cartId', _value);
  }

  void deleteCartId() {
    secureStorage.delete(key: 'ff_cartId');
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
