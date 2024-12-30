part of '../login_view.dart';

mixin LoginViewMixin on State<LoginView> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  void blocListener(BuildContext context, LoginState state) {
    if (state.status == LoginStatus.loading) {
      context.loaderOverlay.show();
    } else if (state.status == LoginStatus.failure) {
      context.loaderOverlay.hide();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email or password is incorrect'),
        ),
      );
    } else if (state.status == LoginStatus.success) {
      context.loaderOverlay.hide();
      context.replaceRoute(const HomeRoute());
    }
  }

  void login() {
    if (formKey.currentState!.validate()) {
      context.read<LoginViewModel>().login(
            emailController.text,
            passwordController.text,
          );
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.onUserInteraction;
      });
    }
  }

  void navigateToRegister() {
    context.pushRoute(const RegisterRoute());
  }
}
