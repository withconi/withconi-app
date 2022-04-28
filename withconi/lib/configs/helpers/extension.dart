extension EnumTransform on List {
  String? string<T>(T value) {
    if (value == null || (isEmpty)) return null;
    var occurence = singleWhere(
        (enumItem) => enumItem.toString() == value.toString(),
        orElse: () => null);
    if (occurence == null) return null;
    return occurence.toString().split('.').last;
  }

  T enumFromString<T>(String value) {
    return firstWhere((type) => type.toString().split('.').last == value,
        orElse: () => null);
  }
}
