import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube/controllers/blocs/fetch_data_bloc/home_bloc.dart';
import 'package:youtube/controllers/blocs/playback_bloc/playback_bloc.dart';

import 'views/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => PlayBackBloc()),
      ],
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
