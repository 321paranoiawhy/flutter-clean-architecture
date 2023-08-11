// log.dart
import 'package:flutter/foundation.dart';
import 'package:stack_trace/stack_trace.dart';

enum LogMode {
  debug, // 💚 DEBUG
  warning, // 💛 WARNING
  info, // 💙 INFO
  error, // ❤️ ERROR
}

/// 时间格式化
///
/// **Example:**
///
/// ```dart
/// formatTime(dateTime: DateTime.now())
/// ```
///
String formatTime({required DateTime dateTime}) {
  return "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}:${dateTime.second.toString().padLeft(2, '0')}";
}

// Unamed extensions
// https://dart.dev/language/extension-methods#unnamed-extensions
extension on DateTime {
  /// DateTime 上的扩展方法: format
  ///
  /// **Example:**
  ///
  /// ```dart
  /// DateTime.now().format
  /// ```
  ///
  String format() {
    return "${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}:${second.toString().padLeft(2, '0')}";
  }
}

/// TODO
/// Logger.debug/info/warning/error
/// 文本颜色 ANSI
/// https://en.wikipedia.org/wiki/ANSI_escape_code
/// https://www.lihaoyi.com/post/BuildyourownCommandLinewithANSIescapecodes.html
/// 选择性输出到本地日志 shouldReport
class Logger {
  // final dynamic message;
  // final LogMode mode;

  // const Logger({required this.message, this.mode = LogMode.debug});
  const Logger();

  void debug(dynamic message) {
    log(mode: LogMode.debug, message: message);
  }

  void warning(dynamic message) {
    log(mode: LogMode.warning, message: message);
  }

  void info(dynamic message) {
    log(mode: LogMode.info, message: message);
  }

  void error(dynamic message) {
    log(mode: LogMode.error, message: message);
  }

  void log({
    required LogMode mode,
    required dynamic message,
  }) {
    // release 模式下不打印
    if (kReleaseMode) {
      return;
    }

    final Chain chain = Chain.current(); // Chain.forTrace(StackTrace.current);
    print(chain);

    final Chain newChain = chain.foldFrames(
        (Frame frame) => frame.isCore || frame.package == "flutter");
    // 取出所有信息帧
    final List<Frame> frames = newChain.toTrace().frames;
    print(frames);
    print(frames.length);
    // 找到当前函数的信息帧
    final currentFrameIndex = frames.indexWhere(
        (Frame element) => element.member == runtimeType.toString());
    // assert(currentFrameIndex != -1 && currentFrameIndex <= frames.length - 1,
    //     'Could not find current frame with name: Logger.');
    print(this.runtimeType);
    print(currentFrameIndex);

    if (currentFrameIndex == -1 || currentFrameIndex + 1 >= frames.length) {
      return;
    }
    // 调用当前函数的函数信息帧
    final Frame frame = frames[currentFrameIndex + 1];

    String modeStr = "";
    switch (mode) {
      case LogMode.debug:
        modeStr = "💚 [DEBUG]";
        break;
      case LogMode.warning:
        modeStr = "💛 [WARNING]";
        break;
      case LogMode.info:
        modeStr = "💙 [INFO]";
        break;
      case LogMode.error:
        modeStr = "❤️ [ERROR]";
        break;
    }

    // Logger.debug(){}
    // print('\u001b[4m/main.dart');
    print('\u001b[4m./lib/main.dart');
    print('./lib/main.dart');

    print('https://github.com/Dart-Code/Dart-Code/issues/2099');

    // debugPrint("$modeStr ${frame.uri} (${frame.line}) - $msg");
    debugPrint(
        '${DateTime.now().format()} [${formatTime(dateTime: DateTime.now())}] $modeStr File: ${frame.uri.toString().replaceFirst("package:${frame.package}/", "")} Line: (${frame.line}) - $message');
    // print(
    //     "$modeStr ${frame.uri.toString().split("/").last}(${frame.line}) - $msg");
  }
}
