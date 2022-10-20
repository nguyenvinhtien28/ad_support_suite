import 'package:get_storage/get_storage.dart';

class StorageBox {
  StorageBox._();
  static GetStorage dataStorage = GetStorage();

  static const String User = 'User';

  static const String appReviewverSion = 'appReviewverSion';
  static const String ShowOnboarding = 'ShowOnboarding';
  static const String CurrentToken = 'CurrentToken';
  static const String CurrentPhone = 'CurrentPhone';
  static const String CurrentUser = 'CurrentPhone';
  static const String CurrentPass = 'CurrentPass';
  static const String CurrentSaved = 'CurrentSaved';
  static const String CurrentSecure = 'CurrentSecure';
  static const String PREF_INREVIEW = "PREF_INREVIEW";
}
