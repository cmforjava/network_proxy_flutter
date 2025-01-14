import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

extension ListFirstWhere<T> on Iterable<T> {
  T? firstWhereOrNull(bool Function(T) test) {
    try {
      return firstWhere(test);
    } on StateError {
      return null;
    }
  }
}

extension DateTimeFormat on DateTime {
  String format() {
    return formatDate(this, [yyyy, '-', mm, '-', dd, ' ', HH, ':', nn, ':', ss]);
  }
}

class ValueWrap<V> {
  V? _v;

  ValueWrap();

  factory ValueWrap.of(V v) {
    var valueWrap = ValueWrap<V>();
    valueWrap._v = v;
    return valueWrap;
  }

  void set(V? v) => this._v = v;

  V? get() => this._v;

  bool isNull() => this._v == null;
}

class Strings {
  static MapEntry<String, String>? splitFirst(String str, Pattern pattern) {
    var index = str.indexOf(pattern);
    if (index > 0) {
      return MapEntry(str.substring(0, index), str.substring(index + 1));
    }

    return null;
  }

  static String trimWrap(String str, String wrap) {
    if (str.startsWith(wrap) && str.endsWith(wrap)) {
      return str.substring(1, str.length - 1);
    }
    return str;
  }

  ///防止文字自动换行
  static String autoLineString(String str) {
    return str.fixAutoLines();
  }
}

/// 防止文字自动换行
/// 当中英文混合，或者中文与数字或者特殊符号，或则英文单词时，文本会被自动换行，
/// 这样会导致，换行时上一行可能会留很大的空白区域
/// 把每个字符插入一个0宽的字符， \u{200B}
extension FixAutoLines on String {
  String fixAutoLines() {
    return Characters(this).join('\u{200B}');
  }
}

class Pair<K, V> {
  final K key;
  final V value;

  Pair(this.key, this.value);
}

class Maps {
  static K? getKey<K, V>(Map<K, V> map, V? value) {
    for (var entry in map.entries) {
      if (entry.value == value) {
        return entry.key;
      }
    }
    return null;
  }
}
