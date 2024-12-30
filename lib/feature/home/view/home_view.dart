import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vocabulary/product/cache/hive_manager.dart';
import 'package:vocabulary/product/navigation/app_router.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
          onPressed: () {
            HiveManager.instance.removeToken();
            context.replaceRoute(const LoginRoute());
          },
          icon: const Icon(Icons.logout),
        ),
      ),
    );
  }
}
