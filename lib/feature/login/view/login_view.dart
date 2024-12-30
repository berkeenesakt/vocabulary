import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:vocabulary/feature/login/view_model/login_view_model.dart';
import 'package:vocabulary/feature/login/view_model/state/login_state.dart';
import 'package:vocabulary/product/navigation/app_router.dart';
import 'package:vocabulary/product/utils/validator/auth_validators.dart';
import 'package:vocabulary/product/widget/padding/project_padding.dart';
import 'package:vocabulary/product/widget/spacing/project_spacing.dart';
import 'package:vocabulary/product/widget/text_field/auth_text_field.dart';

part 'mixin/login_view_mixin.dart';

@RoutePage()
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with LoginViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: ProjectPadding.all,
        child: BlocListener<LoginViewModel, LoginState>(
          listener: blocListener,
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: SafeArea(
              bottom: false,
              child: Form(
                autovalidateMode: autovalidateMode,
                key: formKey,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: FocusScope.of(context).unfocus,
                  child: Column(
                    children: [
                      const SizedBox(height: ProjectSpacing.xxxLarge),
                      const Icon(Icons.person_rounded, size: 100),
                      const SizedBox(height: ProjectSpacing.common),
                      Text(
                        'Login',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: ProjectSpacing.common),
                      AuthTextField(
                        label: 'Email',
                        controller: emailController,
                        validator: AuthValidators.emailValidator,
                      ),
                      const SizedBox(height: ProjectSpacing.common),
                      AuthTextField(
                        label: 'Password',
                        controller: passwordController,
                        obscureText: true,
                        validator: AuthValidators.passwordValidator,
                      ),
                      const SizedBox(height: ProjectSpacing.large),
                      ElevatedButton(
                        onPressed: login,
                        child: const Text('Login'),
                      ),
                      const SizedBox(height: ProjectSpacing.common),
                      ElevatedButton(
                        onPressed: navigateToRegister,
                        child: const Text("Don't have an account? Register"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
