// ignore_for_file: unused_element

extension on String {
  /// 首字母大写, 余者皆小写
  String get capitalizeFirst => _capitalizeFirst();

  /// 首字母大写, 余者皆小写
  /// admin -> Admin
  String _capitalizeFirst() {
    if (isEmpty) {
      return this;
    } else if (length == 1) {
      return toUpperCase();
    } else {
      return this[0].toUpperCase() + substring(1).toLowerCase();
    }
  }

  /// Checks if string only consists numeric.
  ///
  /// Numeric only doesn't accepting "." which double data type have
  ///
  /// that is, '2.0'.isNumericOnly => false
  bool get isNumericOnly => RegExp(r'^\d+$').hasMatch(this);

  /// Checks if string only consists Alphabet. (No Whitespace)
  bool get isAlphabetOnly => RegExp(r'^[a-zA-Z]+$').hasMatch(this);

  /// 是否可转换为 bool
  ///
  /// 仅 'true' 和 'false' 可转换为 bool
  bool get canConvertToBool => this == 'true' || this == 'false';
}
