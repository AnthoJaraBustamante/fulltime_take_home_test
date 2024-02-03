part of 'commits_bloc.dart';

abstract class CommitsEvent extends Equatable {
  const CommitsEvent();

  @override
  List<Object> get props => [];
}

class FetchCommits extends CommitsEvent {
  const FetchCommits();

  @override
  List<Object> get props => [];
}
