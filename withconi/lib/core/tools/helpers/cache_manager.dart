// ignore_for_file: constant_identifier_names
import 'package:get_storage/get_storage.dart';
import '../../../data/enums/enum.dart';

class CacheManager {
  static Future<bool> saveCache(
    CacheControllerKey cacheControllerKey,
    dynamic value,
  ) async {
    final box = GetStorage();
    await box.write(cacheControllerKey.toString(), value);
    return true;
  }

  static String? getCache(CacheControllerKey cacheControllerKey) {
    final box = GetStorage();
    String? cacheResult = box.read(cacheControllerKey.toString());
    return cacheResult;
  }

  static bool getAppInitedCache() {
    final box = GetStorage();
    bool? appInited = box.read<bool?>(CacheControllerKey.appInited.toString());
    if (appInited == null) {
      return false;
    } else {
      return appInited;
    }
  }

  static Future<void> removeCache(CacheControllerKey cacheControllerKey) async {
    final box = GetStorage();
    await box.remove(cacheControllerKey.toString());
    return;
  }

  static Future<void> clearCache() async {
    final box = GetStorage();
    await box.erase();
  }
}
