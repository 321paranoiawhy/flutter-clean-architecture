extension on Iterable {
  operator *(int count) => Iterable.generate(count, (int index) => this);

  /// 重复
  Iterable repeat(int count) => Iterable.generate(count, (int index) => this);
}
