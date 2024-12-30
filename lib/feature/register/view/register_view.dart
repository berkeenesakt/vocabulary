import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:vocabulary/feature/register/view_model/register_view_model.dart';
import 'package:vocabulary/feature/register/view_model/state/register_state.dart';
import 'package:vocabulary/product/navigation/app_router.dart';
import 'package:vocabulary/product/utils/mixin/mounted_mixin.dart';
import 'package:vocabulary/product/utils/validator/auth_validators.dart';
import 'package:vocabulary/product/widget/padding/project_padding.dart';
import 'package:vocabulary/product/widget/spacing/project_spacing.dart';
import 'package:vocabulary/product/widget/text_field/auth_text_field.dart';

part 'mixin/register_view_mixin.dart';

@RoutePage()
class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> with MountedMixin, RegisterViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Register'),
        ),
        body: BlocListener<RegisterViewModel, RegisterState>(
          listener: blocListener,
          child: ListView(
            padding: ProjectPadding.all,
            children: [
              Form(
                key: formKey,
                autovalidateMode: autovalidateMode,
                child: Column(
                  children: [
                    const SizedBox(height: ProjectSpacing.xxxLarge),
                    AuthTextField(
                      controller: usernameController,
                      validator: AuthValidators.usernameValidator,
                      label: 'Username',
                    ),
                    const SizedBox(height: ProjectSpacing.common),
                    AuthTextField(
                      controller: emailController,
                      validator: AuthValidators.emailValidator,
                      label: 'Email',
                    ),
                    const SizedBox(height: ProjectSpacing.common),
                    AuthTextField(
                      controller: passwordController,
                      validator: AuthValidators.passwordValidator,
                      label: 'Password',
                      obscureText: true,
                    ),
                    const SizedBox(height: ProjectSpacing.large),
                    ElevatedButton(
                      onPressed: register,
                      child: const Text('Register'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
