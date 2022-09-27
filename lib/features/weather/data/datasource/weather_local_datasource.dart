import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/weather_model.dart';

abstract class WeatherLocalPreferenceManager {
  static const keyToken = "token";
  static const domainKey = "domain";

  Future<List<Weather>>getCacheWeatherList(String city);
  Future<void> setCacheWeatherList(List<Weather> weatherList);

  Future<String> getString(String key, {String defaultValue = ""});

  Future<bool> setString(String key, String value);

  Future<int> getInt(String key, {int defaultValue = 0});

  Future<bool> setInt(String key, int value);

  Future<double> getDouble(String key, {double defaultValue = 0.0});

  Future<bool> setDouble(String key, double value);

  Future<bool> getBool(String key, {bool defaultValue = false});

  Future<bool> setBool(String key, bool value);

  Future<List<String>> getStringList(String key,
      {List<String> defaultValue = const []});

  Future<bool> setStringList(String key, List<String> value);

  Future<bool> remove(String key);

  Future<bool> clear();
}

const CACHED_WEATHER = 'CACHED_WEATHER';

class HRISLocalPreferenceManagerImpl implements WeatherLocalPreferenceManager {
  final _preference = SharedPreferences.getInstance();


  @override
  Future<void> setCacheWeatherList(List<Weather> weatherList) {
    return _preference.then((preference) => preference.setString(CACHED_WEATHER, jsonEncode(weatherList.toString()),)
    );
  }
  @override
  Future<List<Weather>> getCacheWeatherList(String city) async{
    final jsonString = await _preference.then((preference) => preference.getString(CACHED_WEATHER));
    if (jsonString != null) {
      return (json.decode(jsonString) as List).map((e) => Weather.fromJson(e)).toList();
    } else {
      throw Exception("Not Get Cache Weather Data");
    }
  }
  @override
  Future<String> getString(String key, {String defaultValue = ""}) {
    return _preference
        .then((preference) => preference.getString(key) ?? defaultValue);
  }

  @override
  Future<bool> setString(String key, String value) {
    return _preference.then((preference) => preference.setString(key, value));
  }

  @override
  Future<int> getInt(String key, {int defaultValue = 0}) {
    return _preference
        .then((preference) => preference.getInt(key) ?? defaultValue);
  }

  @override
  Future<bool> setInt(String key, int value) {
    return _preference.then((preference) => preference.setInt(key, value));
  }

  @override
  Future<double> getDouble(String key, {double defaultValue = 0.0}) {
    return _preference
        .then((preference) => preference.getDouble(key) ?? defaultValue);
  }

  @override
  Future<bool> setDouble(String key, double value) {
    return _preference.then((preference) => preference.setDouble(key, value));
  }

  @override
  Future<bool> getBool(String key, {bool defaultValue = false}) {
    return _preference
        .then((preference) => preference.getBool(key) ?? defaultValue);
  }

  @override
  Future<bool> setBool(String key, bool value) {
    return _preference.then((preference) => preference.setBool(key, value));
  }

  @override
  Future<List<String>> getStringList(String key,
      {List<String> defaultValue = const []}) {
    return _preference
        .then((preference) => preference.getStringList(key) ?? defaultValue);
  }

  @override
  Future<bool> setStringList(String key, List<String> value) {
    return _preference
        .then((preference) => preference.setStringList(key, value));
  }

  @override
  Future<bool> remove(String key) {
    return _preference.then((preference) => preference.remove(key));
  }

  @override
  Future<bool> clear() {
    return _preference.then((preference) => preference.clear());
  }

}