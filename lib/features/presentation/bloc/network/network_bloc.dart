import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'network_event.dart';
part 'network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  Connectivity connectivity;
  late StreamSubscription subscription;

  NetworkBloc({required this.connectivity})
      : super(NetworkInitial()) {
    on<NetworkObserve>(_observe);
    on<NetworkNotify>(_notifyStatus);
  }

  Future<void> _observe(event, emit) async {
    print('Netwrok Observe');
    subscription = await connectivity
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      print('Netwrok result in Observe:$result');
      final networkState = (result == ConnectivityResult.none)
          ? NetworkFailure()
          : NetworkSuccess();
      add(NetworkNotify(connection: networkState));
    });
  }

  void _notifyStatus(NetworkNotify event, emit) {
    print('_notifyStatus:${event.connection}');
    emit(event.connection);
  }

  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }
}
