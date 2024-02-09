import 'package:calculadora/helpers/storage_helper.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late StorageHelper storageHelper;
  // Initialize SharedPreferences with mock values before running tests.
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    storageHelper = StorageHelper();
  });

  test('saveSubjectData successfully saves data', () async {
    final bool result =
        await storageHelper.saveSubjectData('testKey', 'testValue');

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString('testKey');
    expect(value, 'testValue');
    expect(result, true);
  });

  test('getData successfully retrieves data', () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('testKey', 'testValue');
    final String result = await storageHelper.getData('testKey');

    expect(result, 'testValue');
  });

  test('getAllKeys successfully retrieves all keys', () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('testKey1', 'testValue1');
    await prefs.setString('testKey2', 'testValue2');

    final Set<String> keys = await storageHelper.getAllKeys();

    expect(keys, containsAll(['testKey1', 'testKey2']));
  });

  test('clear successfully clears all data', () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('testKey', 'testValue');

    await storageHelper.clear();

    final Set<String> keys = prefs.getKeys();
    expect(keys, isEmpty);
  });

  test('clearSubject successfully removes specific data', () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('testKey', 'testValue');

    await storageHelper.clearSubject('testKey');

    String? value = prefs.getString('testKey');
    expect(value, isNull);
  });

  // Reset SharedPreferences after each test
  tearDown(() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  });
}
