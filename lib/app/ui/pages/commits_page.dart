import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fulltime_take_home_test/blocs/commits/commits_bloc.dart';

class CommitsPage extends StatelessWidget {
  const CommitsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CommitsBloc, CommitsState>(
        builder: (context, state) {
          return Text('Is Loading: ${state.isLoading}');
        },
      ),
    );
  }
}
