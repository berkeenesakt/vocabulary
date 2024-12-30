import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocabulary/feature/login/view_model/login_view_model.dart';
import 'package:vocabulary/feature/register/view_model/register_view_model.dart';

class AppProviders extends StatelessWidget {
  const AppProviders({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RegisterViewModel()),
        BlocProvider(create: (context) => LoginViewModel()),
      ],
      child: child,
    );
  }
}
