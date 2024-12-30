import 'package:hive_flutter/hive_flutter.dart';

/// HiveManager is a singleton class that manages the Hive database.
/// It provides methods to save, retrieve, and delete the token from the database.
final class HiveManager {
  HiveManager._();
  static final HiveManager instance = HiveManager._();

  static const String _tokenKey = 'token';
  static const String _boxName = 'auth_box';
  late Box<String> _box;

  Future<void> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox<String>(_boxName);
  }

  Future<void> saveToken(String token) async {
    await _box.put(_tokenKey, token);
  }

  String? getToken() {
    return _box.get(_tokenKey);
  }

  Future<void> removeToken() async {
    await _box.delete(_tokenKey);
  }

  Future<void> clearBox() async {
    await _box.clear();
  }

  bool get hasToken => _box.containsKey(_tokenKey);
}
