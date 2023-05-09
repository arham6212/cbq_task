import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final connectivityProvider = StreamProvider<ConnectivityResult>((ref) async* {
  final connectivity = Connectivity();

  await for (var connectivityResult in connectivity.onConnectivityChanged) {
    yield connectivityResult;
  }
});
