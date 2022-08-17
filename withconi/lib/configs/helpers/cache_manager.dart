// ignore_for_file: constant_identifier_names
import 'package:get_storage/get_storage.dart';
import '../constants/enum.dart';

mixin CacheManager {
  Future<bool> saveCache(
    CacheControllerKey cacheControllerKey,
    String? value,
  ) async {
    final box = GetStorage();
    await box.write(cacheControllerKey.toString(), value);
    return true;
  }

  String getCache(CacheControllerKey cacheControllerKey) {
    final box = GetStorage();
    String? cacheResult = box.read(cacheControllerKey.toString());
    return (cacheResult == null) ? '' : cacheResult;
  }

  Future<void> removeCache(CacheControllerKey cacheControllerKey) async {
    final box = GetStorage();
    await box.remove(cacheControllerKey.toString());
  }

  Future<void> clearCache() async {
    final box = GetStorage();
    await box.erase();
  }
}
