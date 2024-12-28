import 'package:flutter/material.dart';
import 'package:vocabulary/product/init/app_init.dart';
import 'package:vocabulary/product/init/theme/custom_theme.dart';
import 'package:vocabulary/product/navigation/app_router.dart';

Future<void> main() async {
  await AppInit.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  static final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(),
      theme: CustomLightTheme().themeData,
    );
  }
}
