import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:vocabulary/product/init/app_init.dart';
import 'package:vocabulary/product/init/theme/custom_theme.dart';
import 'package:vocabulary/product/navigation/app_router.dart';
import 'package:vocabulary/product/widget/provider/app_providers.dart';

Future<void> main() async {
  await AppInit.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  static final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return AppProviders(
      child: GlobalLoaderOverlay(
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: _appRouter.config(),
          theme: CustomLightTheme().themeData,
        ),
      ),
    );
  }
}
