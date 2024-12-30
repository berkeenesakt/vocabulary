import 'package:auto_route/auto_route.dart';
import 'package:vocabulary/feature/home/view/home_view.dart';
import 'package:vocabulary/feature/login/view/login_view.dart';
import 'package:vocabulary/feature/register/view/register_view.dart';
import 'package:vocabulary/product/cache/hive_manager.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: AppRouter._replaceRouteName)
class AppRouter extends RootStackRouter {
  static const _replaceRouteName = 'View|Page,Route';

  final bool loggedIn = HiveManager.instance.hasToken;
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: loggedIn),
        AutoRoute(page: LoginRoute.page, initial: !loggedIn),
        AutoRoute(page: RegisterRoute.page),
      ];

  @override
  List<AutoRouteGuard> get guards => [
        // optionally add root guards here
      ];
}
