import 'package:equatable/equatable.dart';
import 'package:gen/gen.dart';

enum HomeStatus {
  initial,
  loading,
  success,
  failure,
}

class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.initial,
    this.words = const [],
    this.errorMessage,
  });

  final HomeStatus status;
  final List<WordModel> words;
  final String? errorMessage;

  @override
  List<Object?> get props => [status, words, errorMessage];

  HomeState copyWith({
    HomeStatus? status,
    List<WordModel>? words,
    String? errorMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      words: words ?? this.words,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
