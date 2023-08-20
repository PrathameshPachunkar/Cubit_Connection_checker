import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_connectivity_cubit/Screen.dart';
import 'package:flutter_connectivity_cubit/cubit/Internet_cubit.dart';

void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>InternetBloc(),

    child: MaterialApp(
      home: HomePage(),
    ),
    );
  }
}
