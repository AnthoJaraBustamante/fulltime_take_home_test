import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fulltime_take_home_test/app/data/network/consts.dart';
import 'package:fulltime_take_home_test/blocs/commits/commits_bloc.dart';

class CommitsPage extends StatefulWidget {
  const CommitsPage({super.key});

  @override
  State<CommitsPage> createState() => _CommitsPageState();
}

class _CommitsPageState extends State<CommitsPage> {
  @override
  void initState() {
    super.initState();
    context.read<CommitsBloc>().add(const FetchCommits());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CommitsBloc, CommitsState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.commits.isEmpty) {
            return const Center(
              child: Text('No commits yet'),
            );
          }
          return Column(
            children: [
              const SafeArea(child: const SizedBox(height: 20)),
              Wrap(
                children: [
                  const Text('${Const.user} / ${Const.repo}'),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: state.commits.length,
                  itemBuilder: (context, index) {
                    final commit = state.commits[index];
                    return ListTile(
                      title: Text(commit.commit.message),
                      subtitle: Text(commit.commit.author.name),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
