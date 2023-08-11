import 'package:flutter/material.dart';

typedef IterateAction = void Function(int index, dynamic key, dynamic value);

@immutable
final class Props<int, K, V> {
  final int index;
  final K key;
  final V value;

  const Props(this.index, this.key, this.value);

  @override
  String toString() => "Props(index: $index, key: $key, value: $value)";
}

extension on Map {
  /// 获取 props
  get props => _props();

  /// 遍历的同时获取 index, key, value
  void iterate(IterateAction action) {
    for (int index = 0; index < length; index++) {
      action(index, keys.elementAt(index), values.elementAt(index));
    }
  }

  /// 生成 Iterable<Props>
  Iterable<Props> _props() {
    return Iterable<Props>.generate(
        length,
        (index) =>
            Props(index, keys.elementAt(index), values.elementAt(index)));
  }
}
