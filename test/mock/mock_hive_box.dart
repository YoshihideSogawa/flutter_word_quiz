import 'dart:io';

import 'package:hive/hive.dart';

class MockHiveBox<T> implements Box<T> {
  MockHiveBox({Map<dynamic, T>? initData}) : data = initData ?? {};

  final Map<dynamic, T> data;

  @override
  Future<int> add(T value) {
    throw UnimplementedError();
  }

  @override
  Future<Iterable<int>> addAll(Iterable<T> values) {
    throw UnimplementedError();
  }

  @override
  Future<int> clear() async {
    data.clear();
    return 0;
  }

  @override
  Future<void> close() async {}

  @override
  Future<void> compact() {
    throw UnimplementedError();
  }

  @override
  bool containsKey(dynamic key) {
    return data.containsKey(key);
  }

  @override
  Future<void> delete(dynamic key) async {
    data.remove(key);
  }

  @override
  Future<void> deleteAll(Iterable<dynamic> keys) async {
    data.clear();
  }

  @override
  Future<void> deleteAt(int index) async {
    data.remove(keyAt(index));
  }

  @override
  Future<void> deleteFromDisk() async {
    data.clear();
  }

  @override
  Future<void> flush() {
    throw UnimplementedError();
  }

  @override
  T? get(dynamic key, {T? defaultValue}) {
    return data[key] ?? defaultValue;
  }

  @override
  T? getAt(int index) {
    return data[keyAt(index)];
  }

  @override
  bool get isEmpty => data.isEmpty;

  @override
  bool get isNotEmpty => data.isNotEmpty;

  @override
  bool get isOpen => true;

  @override
  dynamic keyAt(int index) {
    return data.keys.elementAt(index);
  }

  @override
  Iterable<dynamic> get keys => data.keys;

  @override
  bool get lazy => throw UnimplementedError();

  @override
  int get length => data.length;

  @override
  String get name => throw UnimplementedError();

  @override
  String? get path => '${Directory.current.path}/.dart_tool/test';

  @override
  Future<void> put(dynamic key, T value) async {
    data[key] = value;
  }

  @override
  Future<void> putAll(Map<dynamic, T> entries) async {
    data.addAll(entries);
  }

  @override
  Future<void> putAt(int index, T value) {
    throw UnimplementedError();
  }

  @override
  Map<dynamic, T> toMap() {
    return data;
  }

  @override
  Iterable<T> get values => data.values;

  @override
  Iterable<T> valuesBetween({dynamic startKey, dynamic endKey}) {
    throw UnimplementedError();
  }

  @override
  Stream<BoxEvent> watch({dynamic key}) {
    throw UnimplementedError();
  }
}
