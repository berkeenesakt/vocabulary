import 'package:equatable/equatable.dart';

enum RegisterStatus {
  initial,
  loading,
  success,
  failure;
}

final class RegisterState extends Equatable {
  const RegisterState({
    this.status = RegisterStatus.initial,
    this.errorMessage,
  });

  final RegisterStatus status;
  final String? errorMessage;

  RegisterState copyWith({
    RegisterStatus? status,
    String? errorMessage,
  }) {
    return RegisterState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage];
}
