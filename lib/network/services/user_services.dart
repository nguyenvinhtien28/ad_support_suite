import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'constant.dart';
import 'globals.dart' as globals;

class UserService extends GetxService {
  // final user = MeData().obs;
  Future<void> setCurrentToken(String token) async {
    globals.accessToken = token;
    await GetStorage().write(StorageBox.CurrentToken, token);
  }

  Future<void> setUserNamePass(String username, String password) async {
    await GetStorage().write(StorageBox.CurrentUser, username);
    await GetStorage().write(StorageBox.CurrentPass, password);
  }

  // Future<void> saveUserData(MeData u) async {
  //   // globals.user = jsonUser;
  //   user.value = u;
  //   // setCurrentId(u.id ?? "");
  //   globals.idUser = user.value.id ?? '';
  //   final dataJson = jsonEncode(user.value.toJson());
  //   StorageBox.dataStorage.write(StorageBox.User, dataJson);
  // }

  Future<void> saveToSetting(
    String value,
  ) async {
    await GetStorage().write(StorageBox.PREF_INREVIEW, value);
  }
}
