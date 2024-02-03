part of 'commits_bloc.dart';

class CommitsState extends Equatable {
  final bool isLoading;
  final List<Commits> commits;

  const CommitsState({this.isLoading = true, this.commits = const []});

  CommitsState copyWith({bool? isLoading, List<Commits>? commits}) {
    return CommitsState(
      isLoading: isLoading ?? this.isLoading,
      commits: commits ?? this.commits,
    );
  }

  @override
  List<Object?> get props => [isLoading, commits];
}
