import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSession {
  static const String PREF_NAME = "UserSessionPref";
  static const String IS_LOGIN = "IsLoggedIn";
  static const String KEY_NAME = "name";
  static const String KEY_EMAIL = "email";
  static const String KEY_MOBILE = "number";
  static const String KEY_PHOTO = "photo";
  static const String USERNAME = "username";
  static const String KEY_CART = "cartvalue";
  static const String KEY_WISHLIST = "wishlistvalue";
  static const String IS_FIRST_TIME_LAUNCH = "IsFirstTimeLaunch";

  SharedPreferences _preferences;

  UserSession() {
    _initPreferences();
  }

  void _initPreferences() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<void> createLoginSession(
      String name, String email, String mobile, String photo, String username) async {
    await _preferences.setBool(IS_LOGIN, true);
    await _preferences.setString(KEY_NAME, name);
    await _preferences.setString(KEY_EMAIL, email);
    await _preferences.setString(KEY_MOBILE, mobile);
    await _preferences.setString(KEY_PHOTO, photo);
    await _preferences.setString(USERNAME, username);
  }

  Future<void> checkLogin(BuildContext context) async {
    bool isLoggedIn = _preferences.getBool(IS_LOGIN) ?? false;
    if (!isLoggedIn) {
      Navigator.pushReplacementNamed(context, '/login'); // Replace with your login screen route.
    }
  }

  Map<String, String> getUserDetails() {
    return {
      KEY_NAME: _preferences.getString(KEY_NAME) ?? "",
      KEY_EMAIL: _preferences.getString(KEY_EMAIL) ?? "",
      KEY_MOBILE: _preferences.getString(KEY_MOBILE) ?? "",
      KEY_PHOTO: _preferences.getString(KEY_PHOTO) ?? "",
      USERNAME: _preferences.getString(USERNAME) ?? "",
    };
  }

  Future<void> logoutUser(BuildContext context) async {
    await _preferences.setBool(IS_LOGIN, false);
    Navigator.pushReplacementNamed(context, '/login'); // Replace with your login screen route.
  }

  bool isLoggedIn() {
    return _preferences.getBool(IS_LOGIN) ?? false;
  }

  int getCartValue() {
    return _preferences.getInt(KEY_CART) ?? 0;
  }

  int getWishlistValue() {
    return _preferences.getInt(KEY_WISHLIST) ?? 0;
  }

  bool getFirstTime() {
    return _preferences.getBool(IS_FIRST_TIME_LAUNCH) ?? true;
  }

  Future<void> setFirstTime(bool isFirstTime) async {
    await _preferences.setBool(IS_FIRST_TIME_LAUNCH, isFirstTime);
  }

  void increaseCartValue() {
    int val = getCartValue() + 1;
    _preferences.setInt(KEY_CART, val);
  }

  void increaseWishlistValue() {
    int val = getWishlistValue() + 1;
    _preferences.setInt(KEY_WISHLIST, val);
  }

  void decreaseCartValue() {
    int val = getCartValue() - 1;
    _preferences.setInt(KEY_CART, val);
  }

  void decreaseWishlistValue() {
    int val = getWishlistValue() - 1;
    _preferences.setInt(KEY_WISHLIST, val);
  }

  void setCartValue(int count) {
    _preferences.setInt(KEY_CART, count);
  }

  void setWishlistValue(int count) {
    _preferences.setInt(KEY_WISHLIST, count);
  }
}
