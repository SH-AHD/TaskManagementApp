
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
static late final SharedPreferences prefs ;
static String nameKey="name";
static String imgKey="img";
static String isCompleteprofile="complete";

static Future<void> init()async{

   prefs= await SharedPreferences.getInstance();
}

static Future<void> setUsrinfo({required String nameValue, String imgValue=""})async{
  await setString(nameKey, nameValue);
  await setString(imgKey, imgValue);

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

}