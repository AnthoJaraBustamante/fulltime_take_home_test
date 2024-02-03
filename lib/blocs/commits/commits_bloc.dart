import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../app/data/comits_models.dart';


part 'commits_event.dart';
part 'commits_state.dart';

class CommitsBloc extends Bloc<CommitsEvent, CommitsState> {
  CommitsBloc() : super(const CommitsState()) {
    on<CommitsEvent>((event, emit) {
       
    });
  }
}
