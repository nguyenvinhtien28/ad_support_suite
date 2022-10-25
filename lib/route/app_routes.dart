part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const LOGIN = _Paths.LOGIN;
  static const LOGIN_FACEBOOK = _Paths.LOGIN_FACEBOOK;
  static const HOME = _Paths.HOME;
  static const OPTION = _Paths.OPTION;
  static const SPLASH = _Paths.SPLASH;
}
abstract class _Paths {
  _Paths._();
  static const SPLASH = '/splash';
  static const LOGIN = '/login';
  static const LOGIN_FACEBOOK = '/login-facebook';
  static const HOME = '/home';
  static const OPTION = '/option';
}