extension StringExtensions on String {
  bool get isNullEmpty => "" == this || this == "null";
  String get cleanCurrencyFormatter {
    if (isNullEmpty) {
      return '';
    }
    return replaceAll('.', '').replaceAll(' ₫', '');
  }
}
