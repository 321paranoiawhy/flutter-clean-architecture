import 'dart:convert';

import 'package:flutter/material.dart' show debugPrint;
import 'package:shared_preferences/shared_preferences.dart';

/// 存储键 枚举
enum SPEnum {
  token,
}

/// 持久化数据(本地存储) 工具类
///
/// 支持以下类型
///
/// bool / int / double / String / StringList / json
class SPUtil {
  late final SharedPreferences _sharedPreferences;

  /// 类私有构造函数
  // SP._internal();
  SPUtil._internal() {
    SharedPreferences.getInstance()
        .then((SharedPreferences value) => _sharedPreferences = value);
    debugPrint('Shared Preferences initialized.');
  }

  factory SPUtil() => _instance;

  static final SPUtil _instance = SPUtil._internal();

  /// 获取 bool
  ///
  /// 如果 key 对应的值不存在 (null), 则返回 defaultValue
  bool getBool(SPEnum key, {bool defaultValue = false}) {
    return _sharedPreferences.getBool(key.name) ?? defaultValue;
  }

  /// 设置 bool
  Future<bool> setBool(SPEnum key, bool value) {
    return _sharedPreferences.setBool(key.name, value);
  }

  /// 获取 int
  ///
  /// 如果 key 对应的值不存在 (null),则返回 defaultValue
  int getInt(SPEnum key, {int defaultValue = 0}) {
    return _sharedPreferences.getInt(key.name) ?? defaultValue;
  }

  /// 设置 int
  Future<bool> setInt(SPEnum key, int value) {
    return _sharedPreferences.setInt(key.name, value);
  }

  /// 获取 double
  ///
  /// 如果 key 对应的值不存在 (null),则返回 defaultValue
  double getDouble(SPEnum key, {double defaultValue = 0}) {
    return _sharedPreferences.getDouble(key.name) ?? defaultValue;
  }

  /// 设置 double
  Future<bool> setDouble(SPEnum key, double value) {
    return _sharedPreferences.setDouble(key.name, value);
  }

  /// 获取 String
  ///
  /// 如果 key 对应的值不存在 (null),则返回 defaultValue
  String getString(SPEnum key, {String defaultValue = ''}) {
    return _sharedPreferences.getString(key.name) ?? defaultValue;
  }

  /// 设置 String
  Future<bool> setString(SPEnum key, String value) {
    return _sharedPreferences.setString(key.name, value);
  }

  /// 获取字符串数组
  List<String> getStringList(SPEnum key,
      {List<String> defaultValue = const []}) {
    return _sharedPreferences.getStringList(key.name) ?? defaultValue;
  }

  /// 设置字符串数组
  Future<bool> setStringList(SPEnum key, List<String> value) {
    return _sharedPreferences.setStringList(key.name, value);
  }

  /// 获取 json 对象
  Map getJson(SPEnum key, {Map defaultValue = const {}}) {
    final String? data = _sharedPreferences.getString(key.name);
    return data != null ? jsonDecode(data) : defaultValue;
  }

  /// 设置 json 对象
  Future<bool> setJson(SPEnum key, Map value) {
    return _sharedPreferences.setString(key.name, jsonEncode(value));
  }

  /// 是否存储有指定 key
  bool hasKey(SPEnum key) {
    return _sharedPreferences.containsKey(key.name);
  }

  /// 删除指定 key
  Future<bool> deleteKey(SPEnum key) {
    return _sharedPreferences.remove(key.name);
  }
}
