import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

class InternetConnectionService {
  static final InternetConnectionService _instance =
      InternetConnectionService._internal();
  factory InternetConnectionService() => _instance;

  final Connectivity _connectivity = Connectivity();
  final StreamController<bool> _connectionChangeController =
      StreamController<bool>.broadcast();

  bool _hasConnection = true;

  InternetConnectionService._internal() {
    _initialize();
  }

  void _initialize() async {
    _hasConnection = await _hasInternetAccess();
    _connectionChangeController.add(_hasConnection);

    _connectivity.onConnectivityChanged
        .listen((List<ConnectivityResult> results) async {
      if (results.isEmpty || results.contains(ConnectivityResult.none)) {
        _hasConnection = false;
      } else {
        _hasConnection = await _hasInternetAccess();
      }
      _connectionChangeController.add(_hasConnection);
    });
  }

  Stream<bool> get connectionChange => _connectionChangeController.stream;
  bool get hasConnection => _hasConnection;

  Future<bool> _hasInternetAccess() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (_) {
      return false;
    }
  }

  void dispose() {
    _connectionChangeController.close();
  }
}
