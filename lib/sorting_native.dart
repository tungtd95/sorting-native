import 'dart:async';

import 'package:flutter/services.dart';

class SortingNative {
  static const MethodChannel _channel = MethodChannel('sorting_native');

  static const String _methodSort = 'sorting_native_sort';
  static const String _methodSortArgInput = 'input';

  static Future<List<int>> sort(List<int> input) async {
    final List<dynamic> response = await _channel.invokeMethod(
      _methodSort,
      {_methodSortArgInput: input},
    );
    List<int> result = [];
    for (var element in response) {
      if (element is int) result.add(element);
    }
    return result;
  }
}
