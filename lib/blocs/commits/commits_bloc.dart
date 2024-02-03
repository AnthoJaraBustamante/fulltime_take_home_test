import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';

import '../../app/data/models/commits_models.dart';
import '../../app/services/commits_service.dart';

part 'commits_event.dart';
part 'commits_state.dart';

class CommitsBloc extends Bloc<CommitsEvent, CommitsState> {
  final _commitsService = GetIt.I<CommitsService>(); // Usa get_it para obtener una instancia de CommitsService

  CommitsBloc() : super(const CommitsState()) {
    on<FetchCommits>(_onFetchCommits);
  }

  Future<FutureOr<void>> _onFetchCommits(FetchCommits event, Emitter<CommitsState> emit) async {
    emit(state.copyWith(isLoading: true));
    final response = await _commitsService.getService();

    if (response.success) {
      emit(state.copyWith(isLoading: false, commits: response.data));
    } else {
      emit(state.copyWith(isLoading: false));
    }
  }
}
