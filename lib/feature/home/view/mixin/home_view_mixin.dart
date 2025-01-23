part of '../home_view.dart';

mixin HomeViewMixin on State<HomeView> {
  void logout() {
    HiveManager.instance.removeToken();
    AutoRouter.of(context).replace(const LoginRoute());
  }
}
