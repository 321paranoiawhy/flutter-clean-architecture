# flutter_clean_architecture

A Flutter project using clean architecture.

## Reading Resources

- [The Clean Code Blog by Robert C. Martin (Uncle Bob)](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [Axion-Technologies-HnH](https://github.com/ShadyBoukhary/Axion-Technologies-HnH)

# web

`URL` 策略:

- `Hash`, 默认策略, 例如 `flutterexample.dev/#/path/to/screen`
- `Path`, 例如 `flutterexample.dev/path/to/screen`

如果想从 `Hash` 策略改为 `Path` 策略, 可使用 `flutter_web_plugins` 中的 `usePathUrlStrategy()` 方法:

```dart
// main.dart
void main() {
  // 使用 PathUrlStrategy
  // https://flutter.cn/docs/development/ui/navigation/url-strategies#configuring-the-url-strategy
  usePathUrlStrategy();
  runApp(const MainApp());
}
```

`run`:

```bash
flutter run -d chrome
# flutter 在 web 平台上默认渲染方式为 canvaskit
# flutter run -d chrome --web-renderer canvaskit

# 更改渲染方式为 html
flutter run -d chrome --web-renderer html
```

`build`:

```bash
flutter build web
# flutter build web --release

flutter build web --web-renderer html --release
flutter build web --web-renderer canvaskit --release

// tree-shake
flutter build web --tree-shake-icons
```

# json_annotation

`dart template`:

```dart
// user.dart
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';
@JsonSerializable()
class User {
  final String name;
  final int age;
  User({required this.name, required this.age});
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
```

一次性生成 \*_.g.dart_ :

```bash
# https://docs.flutter.dev/data-and-backend/json#one-time-code-generation
flutter pub run build_runner build --delete-conflicting-outputs
# flutter pub run build_runner build
```

持续生成 \*_.g.dart_ :

```bash
# https://docs.flutter.dev/data-and-backend/json#generating-code-continuously
flutter pub run build_runner watch --delete-conflicting-outputs
# flutter pub run build_runner watch
```

运行后提示 `Deprecated. Use `dart run` instead.`, 将 `flutter pub run` 改为 `dart run`:

```bash
# 一次性
dart run build_runner build
# 持续
dart run build_runner watch
```
