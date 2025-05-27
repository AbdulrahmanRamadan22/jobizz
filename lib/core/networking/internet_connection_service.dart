// import 'dart:async';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';

// class InternetConnectionService {
//   static final InternetConnectionService _instance =
//       InternetConnectionService._internal();
//   factory InternetConnectionService() => _instance;

//   final Connectivity _connectivity = Connectivity();
//   final InternetConnectionChecker _internetChecker =
//       InternetConnectionChecker.instance;

//   final StreamController<bool> _connectionChangeController =
//       StreamController<bool>.broadcast();

//   bool _hasConnection = false;

//   InternetConnectionService._internal() {
//     _initialize();
//   }

//   void _initialize() async {
//     _hasConnection = await _checkInternet();

//     _connectivity.onConnectivityChanged.listen((List<ConnectivityResult> results) {
//       for (var result in results) {
//         _updateConnectionStatus(result);
//       }
//     });
//   }

//   Stream<bool> get connectionChange => _connectionChangeController.stream;
//   bool get hasConnection => _hasConnection;

//   Future<void> _updateConnectionStatus(ConnectivityResult result) async {
//     bool previousConnection = _hasConnection;
//     bool currentConnection = await _checkInternet();
//     if (currentConnection != previousConnection) {
//       _hasConnection = currentConnection;
//       _connectionChangeController.add(_hasConnection);
//     }
//   }

//   Future<bool> _checkInternet() async {
//     return await _internetChecker.hasConnection;
//   }

//   void dispose() {
//     _connectionChangeController.close();
//   }
// }

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

    _connectivity.onConnectivityChanged.listen((List<ConnectivityResult> results) async {
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
