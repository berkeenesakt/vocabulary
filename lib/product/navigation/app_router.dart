import 'package:auto_route/auto_route.dart';
import 'package:template/feature/home/view/home_view.dart';
import 'package:template/feature/login/view/login_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: AppRouter._replaceRouteName)
class AppRouter extends RootStackRouter {
  static const _replaceRouteName = 'View|Page,Route';
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: LoginRoute.page),
      ];

  @override
  List<AutoRouteGuard> get guards => [
        // optionally add root guards here
      ];
}
