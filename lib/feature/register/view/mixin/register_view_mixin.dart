part of '../register_view.dart';

mixin RegisterViewMixin on State<RegisterView>, MountedMixin<RegisterView> {
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  void blocListener(BuildContext context, RegisterState state) {
    if (state.status == RegisterStatus.loading) {
      safeOperation(() {
        context.loaderOverlay.show();
      });
    } else if (state.status == RegisterStatus.success) {
      safeOperation(() {
        context.loaderOverlay.hide();
        context.replaceRoute(const HomeRoute());
      });
    } else if (state.status == RegisterStatus.failure) {
      safeOperation(() {
        context.loaderOverlay.hide();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Register failed'),
          ),
        );
      });
    }
  }

  Future<void> register() async {
    if (formKey.currentState!.validate()) {
      await context.read<RegisterViewModel>().register(
            usernameController.text,
            passwordController.text,
            emailController.text,
          );
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.onUserInteraction;
      });
    }
  }
}
