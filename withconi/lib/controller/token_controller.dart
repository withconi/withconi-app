import 'package:get_storage/get_storage.dart';

mixin TokenController {
  Future<bool> saveToken(String? token) async {
    final box = GetStorage();
    await box.write(TokenControllerKey.TOKEN.toString(), token);
    return true;
  }

  String? getToken() {
    final box = GetStorage();
    return box.read(TokenControllerKey.TOKEN.toString());
  }

  Future<void> removeToken() async {
    final box = GetStorage();
    await box.remove(TokenControllerKey.TOKEN.toString());
  }
}

enum TokenControllerKey { TOKEN }
