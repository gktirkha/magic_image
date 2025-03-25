extension StringExtension on String {
  bool get isURL => StringUtil.isURL(Uri.parse(this).toString());
  bool get isSVG => endsWith('.svg');
}

class StringUtil {
  static bool isURL(String s) => hasMatch(
        s,
        r"^((https?|ftps?)://)?(www\.)?([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,15}(:\d{1,5})?(\/[^\s]*)?$",
      );

  static bool hasMatch(String? value, String pattern) {
    return (value == null) ? false : RegExp(pattern).hasMatch(value);
  }
}
