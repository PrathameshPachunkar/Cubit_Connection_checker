import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_connectivity_cubit/cubit/Internet_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocConsumer<InternetBloc,InternetState>(
            builder: (context, state) {
              if (state == InternetState.InternetGainedState) {
                return Text("Connected");
              } else if (state == InternetState.InternetLostState) {
                return Text("Not Connected");
              } else {
                return Text("Loading....");
              }
            },
            listener: (context, state) {
              if (state == InternetState.InternetGainedState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: SnackBar(
                      content: Text("Connected"),
                      backgroundColor: Colors.green,
                    ),
                  ),
                );
              }

              else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: SnackBar(
                      content: Text("Not Connected"),
                      backgroundColor: Colors.red,
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
