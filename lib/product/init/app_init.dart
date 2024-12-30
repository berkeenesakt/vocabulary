import 'package:flutter/material.dart';
import 'package:vocabulary/product/cache/hive_manager.dart';
import 'package:vocabulary/product/init/config/app_environment.dart';

class AppInit {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await HiveManager.instance.init();
    AppEnvironment.general();
  }
}
