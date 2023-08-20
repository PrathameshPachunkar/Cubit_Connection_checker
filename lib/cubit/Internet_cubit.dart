
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

enum InternetState{
  InternetInitialState,InternetGainedState,InternetLostState
}


class InternetBloc extends Cubit<InternetState>{
  StreamSubscription? _sub;
  Connectivity _connect = Connectivity();
  InternetBloc():super(InternetState.InternetInitialState){
    _sub = _connect.onConnectivityChanged.listen((result) {
      if(result == ConnectivityResult.wifi||result==ConnectivityResult.mobile){
        emit(InternetState.InternetGainedState);
      }
      else{
        emit(InternetState.InternetLostState);
      }
    });


  }
  @override
  Future<void> close() {
   _sub?.cancel();
    return super.close();
  }
}