import 'package:vocabulary/feature/login/view_model/state/login_state.dart';
import 'package:vocabulary/product/base/base_cubit.dart';
import 'package:vocabulary/product/cache/hive_manager.dart';
import 'package:vocabulary/product/service/auth_service.dart';

final class LoginViewModel extends BaseCubit<LoginState> {
  LoginViewModel() : super(const LoginState());

  Future<void> login(String email, String password) async {
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      final token = await AuthService.login(email, password);
      await HiveManager.instance.saveToken(token);
      emit(state.copyWith(status: LoginStatus.success));
    } on Exception catch (e) {
      emit(
        state.copyWith(
          status: LoginStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
