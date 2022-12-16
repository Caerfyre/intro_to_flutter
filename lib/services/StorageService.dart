import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/StorageItem.dart';

class StorageService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  AndroidOptions _androiOpt() =>
      const AndroidOptions(encryptedSharedPreferences: true);

  Future<void> saveData(StorageItem item) async {
    await _storage.write(
        key: item.key, value: item.value, aOptions: _androiOpt());
  }

  Future<String?> readData(String key) async {
    return await _storage.read(key: key, aOptions: _androiOpt());
  }

  Future<List<StorageItem>> readAllData() async {
    final Map<String, String> allData =
        await _storage.readAll(aOptions: _androiOpt());

    final List<StorageItem> items = allData.entries
        .map((entry) => StorageItem(entry.key, entry.value))
        .toList();

    return items;
  }

  Future<void> deleteData(String key) async {
    await _storage.delete(key: key, aOptions: _androiOpt());
  }

  Future<void> deleteAllData() async {
    await _storage.deleteAll(aOptions: _androiOpt());
  }
}
