import 'package:flutter/material.dart' show debugPrint;

typedef EventCallback<T> = void Function(T argument);

/// EventBus 单例模式全局事件总线
///
/// **Example**
///
/// ```dart
/// final EventBus eventBus = EventBus();
/// eventBus.on('login', (bool argument {
///   setState(() => _login = argument);
/// });
/// // 登录
/// eventBus.emit('login', true);
/// // 退出登录
/// eventBus.emit('login', false);
/// ```
class EventBus {
  EventBus._internal();
  static final EventBus _singleton = EventBus._internal();
  factory EventBus() => _singleton;

  final Map<String, List<EventCallback>> _eventsMap = {};

  Map<String, List<EventCallback>> get eventsMap => _eventsMap;

  /// 添加订阅者
  void on(dynamic eventName, EventCallback eventCallback) {
    if (eventName == null) {
      return;
    }

    _eventsMap[eventName] ??= <EventCallback>[];
    _eventsMap[eventName]!.add(eventCallback);
  }

  /// 移除订阅者
  ///
  /// 如果未传入回调函数, 则移除所有回调
  ///
  /// 否则, 仅移除传入回调
  void off(dynamic eventName, [EventCallback? eventCallback]) {
    final List<EventCallback>? callbackList = _eventsMap[eventName];

    if (eventName == null || callbackList == null) {
      return;
    }

    if (eventCallback == null) {
      // 移除事件的所有回调
      _eventsMap[eventName] = <EventCallback>[];
    } else {
      // 仅移除事件中的传入回调
      callbackList.remove(eventCallback);
    }
  }

  /// 触发事件
  ///
  /// 事件触发后该事件所有订阅者会被调用
  void emit(dynamic eventName, [dynamic argument]) {
    final List<EventCallback>? callbackList = _eventsMap[eventName];

    if (callbackList == null) {
      debugPrint('Event name ($eventName) does not exist in EventBus.');
      return;
    }

    for (int index = 0; index < callbackList.length - 1; index++) {
      callbackList[index](argument);
    }
  }
}

/// 全局单例
final EventBus eventBus = EventBus();
