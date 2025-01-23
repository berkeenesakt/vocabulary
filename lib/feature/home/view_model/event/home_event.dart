import 'package:equatable/equatable.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

final class FetchInitialWords extends HomeEvent {
  const FetchInitialWords();
}

final class FetchNewWord extends HomeEvent {
  const FetchNewWord();
}
