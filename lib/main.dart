import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/cubit/launch_cubit.dart';
import 'package:spacex/repository/launch_repository.dart';
import 'package:spacex/screens/details/launch_details.dart';
import 'package:spacex/theme/theme_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpaceX Latest Flight',
      theme: themeData(),
      home: BlocProvider(
        child: LaunchDetails(),
        create: (context) => LaunchCubit(
          LaunchRepository(),
        ),
      ),
    );
  }
}
