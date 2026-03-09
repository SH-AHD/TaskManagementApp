
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
static late final SharedPreferences prefs ;
static String nameKey="name";
static String imgKey="img";
static String isCompleteprofile="complete";
static String isDarkModeKey='darkMode';
static ValueNotifier<bool> isDarkModeNotifier= ValueNotifier<bool>(false);
static ValueNotifier<String> nameNotifier = ValueNotifier<String>("");
  static ValueNotifier<String> imgNotifier = ValueNotifier<String>("");
static Future<void> init()async{

  prefs= await SharedPreferences.getInstance();
  isDarkModeNotifier.value=prefs.getBool(isDarkModeKey)??false;
nameNotifier.value = prefs.getString(nameKey) ??"User";
    imgNotifier.value = prefs.getString(imgKey) ?? "";
}

static Future<void> setUsrinfo({required String nameValue, String imgValue = ""}) async {
    await prefs.setString(nameKey, nameValue);
    await prefs.setString(imgKey, imgValue);
    nameNotifier.value = nameValue;
    imgNotifier.value = imgValue;
  }

static Future<void> setString(String key, String value)async{
  await prefs.setString(key, value);
}

static String getString (String key){

  return prefs.getString(key)??"";
}

static Future<void> setBool(String key, bool value)async{
  await prefs.setBool(key, value);
}

static bool getBool (String key){

  return prefs.getBool(key)??false;
}

  // static void cacheThemeMode(bool value) {
  //   prefs.setBool(isDarkModeKey, value);
  // }

  static bool getCachedThemeMode() {

    return prefs.getBool(isDarkModeKey) ?? false;
  }

static Future<void> setDarkMode(bool value) async{
  prefs.setBool(isDarkModeKey, value);
  isDarkModeNotifier.value=value;
}

}