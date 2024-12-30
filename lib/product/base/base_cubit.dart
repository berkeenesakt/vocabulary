import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseCubit<T extends Object> extends Cubit<T> {
  BaseCubit(super.initialState);

  /// Overrides the default [emit] method to add safety checks.
  /// Prevents emission of new states if the cubit is already closed,
  /// which helps avoid memory leaks and crashes.
  @override
  void emit(T state) {
    if (isClosed) return;
    super.emit(state);
  }
}
