import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  static late SharedPreferences sharedPreferences;
  static late FlutterSecureStorage flutterSecureStorage;

  static init() async {
    flutterSecureStorage = const FlutterSecureStorage();

    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putBoolean({
    required String key,
    required bool value,
  }) async {
    return await sharedPreferences.setBool(key, value);
  }

  /// Gets a  value from SharedPreferences with given [key].
  static dynamic getData({
    required String key,
  }) {
    return sharedPreferences.get(key);
  }

  /// Saves a [value] with a [key] in the SharedPreferences.
  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    debugPrint(
        "SharedPrefHelper : SaveData with key : $key and value : $value");

    if (value is String) return await sharedPreferences.setString(key, value);
    if (value is int) return await sharedPreferences.setInt(key, value);
    if (value is bool) return await sharedPreferences.setBool(key, value);

    return await sharedPreferences.setDouble(key, value);
  }

  /// Removes a value from SharedPreferences with given [key].
  static Future<bool> removeData({
    required String key,
  }) async {
    return await sharedPreferences.remove(key);
  }

  /// Removes all keys and values in the SharedPreferences
  static clearAllData() async {
    debugPrint('SharedPrefHelper : all data has been cleared');
    return await sharedPreferences.clear();
  }

  /// Saves a [value] with a [key] in the FlutterSecureStorage.
  static saveSecuredString({required String key, required String value}) async {
    debugPrint(
        "FlutterSecureStorage : setSecuredString with key : $key and value : $value");
    return await flutterSecureStorage.write(key: key, value: value);
  }

  /// Gets an String value from FlutterSecureStorage with given [key].
  static getSecuredString({required String key}) async {
    debugPrint('FlutterSecureStorage : getSecuredString with key :');
    return await flutterSecureStorage.read(key: key) ?? '';
  }

  /// Removes all keys and values in the FlutterSecureStorage
  static clearAllSecuredData() async {
    debugPrint('FlutterSecureStorage : all data has been cleared');
    await flutterSecureStorage.deleteAll();
  }


}