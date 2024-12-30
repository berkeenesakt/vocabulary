import 'package:vocabulary/feature/register/view_model/state/register_state.dart';
import 'package:vocabulary/product/base/base_cubit.dart';
import 'package:vocabulary/product/cache/hive_manager.dart';
import 'package:vocabulary/product/service/auth_service.dart';

final class RegisterViewModel extends BaseCubit<RegisterState> {
  RegisterViewModel() : super(const RegisterState());

  Future<void> register(
    String username,
    String password,
    String email,
  ) async {
    emit(state.copyWith(status: RegisterStatus.loading));
    try {
      final token = await AuthService.register(username, password, email);
      await HiveManager.instance.saveToken(token);
      emit(state.copyWith(status: RegisterStatus.success));
    } on Exception catch (e) {
      emit(
        state.copyWith(
          status: RegisterStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
