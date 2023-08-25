import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
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
    await _safeInitAsync(() async {
      _customerId =
          await secureStorage.getString('ff_customerId') ?? _customerId;
    });
    await _safeInitAsync(() async {
      _wishlistProducts =
          await secureStorage.getStringList('ff_wishlistProducts') ??
              _wishlistProducts;
    });
    await _safeInitAsync(() async {
      _firstName = await secureStorage.getString('ff_firstName') ?? _firstName;
    });
    await _safeInitAsync(() async {
      _lastName = await secureStorage.getString('ff_lastName') ?? _lastName;
    });
    await _safeInitAsync(() async {
      _email = await secureStorage.getString('ff_email') ?? _email;
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

  String _cartId = '';
  String get cartId => _cartId;
  set cartId(String _value) {
    _cartId = _value;
    secureStorage.setString('ff_cartId', _value);
  }

  void deleteCartId() {
    secureStorage.delete(key: 'ff_cartId');
  }

  String _customerId = '';
  String get customerId => _customerId;
  set customerId(String _value) {
    _customerId = _value;
    secureStorage.setString('ff_customerId', _value);
  }

  void deleteCustomerId() {
    secureStorage.delete(key: 'ff_customerId');
  }

  List<String> _wishlistProducts = [];
  List<String> get wishlistProducts => _wishlistProducts;
  set wishlistProducts(List<String> _value) {
    _wishlistProducts = _value;
    secureStorage.setStringList('ff_wishlistProducts', _value);
  }

  void deleteWishlistProducts() {
    secureStorage.delete(key: 'ff_wishlistProducts');
  }

  void addToWishlistProducts(String _value) {
    _wishlistProducts.add(_value);
    secureStorage.setStringList('ff_wishlistProducts', _wishlistProducts);
  }

  void removeFromWishlistProducts(String _value) {
    _wishlistProducts.remove(_value);
    secureStorage.setStringList('ff_wishlistProducts', _wishlistProducts);
  }

  void removeAtIndexFromWishlistProducts(int _index) {
    _wishlistProducts.removeAt(_index);
    secureStorage.setStringList('ff_wishlistProducts', _wishlistProducts);
  }

  void updateWishlistProductsAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _wishlistProducts[_index] = updateFn(_wishlistProducts[_index]);
    secureStorage.setStringList('ff_wishlistProducts', _wishlistProducts);
  }

  String _firstName = '';
  String get firstName => _firstName;
  set firstName(String _value) {
    _firstName = _value;
    secureStorage.setString('ff_firstName', _value);
  }

  void deleteFirstName() {
    secureStorage.delete(key: 'ff_firstName');
  }

  String _lastName = '';
  String get lastName => _lastName;
  set lastName(String _value) {
    _lastName = _value;
    secureStorage.setString('ff_lastName', _value);
  }

  void deleteLastName() {
    secureStorage.delete(key: 'ff_lastName');
  }

  String _email = '';
  String get email => _email;
  set email(String _value) {
    _email = _value;
    secureStorage.setString('ff_email', _value);
  }

  void deleteEmail() {
    secureStorage.delete(key: 'ff_email');
  }

  final _collectionsListManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> collectionsList({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _collectionsListManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCollectionsListCache() => _collectionsListManager.clear();
  void clearCollectionsListCacheKey(String? uniqueKey) =>
      _collectionsListManager.clearRequest(uniqueKey);
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
