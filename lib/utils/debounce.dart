import 'dart:async';

typedef DebouceCallback = void Function();

/// **Example:**
/// ```dart
/// Debounce(interval: const Duration(seconds: 1)).call(() {
///   debugPrint('debounce');
/// });
/// ```
class Debounce {
  /// 时间间隔
  final Duration interval;

  /// 回调
  DebouceCallback? _callback;

  /// 定时器
  Timer? _timer;

  Debounce({
    required this.interval,
  });

  /// 开始
  void call(DebouceCallback callback) {
    _callback = callback;

    _timer?.cancel();

    _timer = Timer(interval, _callAction);
  }

  /// 到期回调
  void _callAction() {
    _callback?.call();
    _timer?.cancel();
  }

  /// 重置 Debounce
  void reset() {
    _callback = null;
    _timer?.cancel();
  }
}
