import 'dart:ui';

import 'package:withconi/ui/theme/text_theme.dart';

import '../../import_basic.dart';

List<TextSpan> highlightOccurrences(
    String source, String? query, TextStyle? highlightStyle) {
  if (query == null || query.isEmpty) {
    return [TextSpan(text: source)];
  }

  var matches = <Match>[];
  for (final token in query.trim().toLowerCase().split(' ')) {
    matches.addAll(token.allMatches(source.toLowerCase()));
  }

  if (matches.isEmpty) {
    return [TextSpan(text: source)];
  }
  matches.sort((a, b) => a.start.compareTo(b.start));

  int lastMatchEnd = 0;
  final List<TextSpan> children = [];
  for (final match in matches) {
    if (match.end <= lastMatchEnd) {
      // already matched -> ignore
    } else if (match.start <= lastMatchEnd) {
      children.add(TextSpan(
          text: source.substring(lastMatchEnd, match.end),
          style: highlightStyle ??
              TextStyle(
                  fontFamily: WcFontFamily.notoSans,
                  fontSize: 16,
                  color: WcColors.black,
                  fontWeight: FontWeight.w600)));
    } else if (match.start > lastMatchEnd) {
      children.add(TextSpan(
        text: source.substring(lastMatchEnd, match.start),
      ));

      children.add(TextSpan(
          text: source.substring(match.start, match.end),
          style: highlightStyle ??
              TextStyle(
                  fontFamily: WcFontFamily.notoSans,
                  fontSize: 16,
                  color: WcColors.black,
                  fontWeight: FontWeight.w600)));
    }

    if (lastMatchEnd < match.end) {
      lastMatchEnd = match.end;
    }
  }

  if (lastMatchEnd < source.length) {
    children.add(TextSpan(
      text: source.substring(lastMatchEnd, source.length),
    ));
  }

  return children;
}
