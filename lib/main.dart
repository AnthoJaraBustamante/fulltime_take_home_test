import 'package:flutter/material.dart';
import 'package:fulltime_take_home_test/blocs/commits/commits_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/ui/pages/commits_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CommitsBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CommitsPage(),
      ),
    );
  }
}
