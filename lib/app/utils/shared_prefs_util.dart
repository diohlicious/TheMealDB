// utils/shared_prefs.dart
import 'package:shared_preferences/shared_preferences.dart';
// constants/strings.dart
const String keyFav = 'fav';

class SharedPrefsUtil {
  static SharedPreferences _sharedPrefs;

  Future init() async {
    if (_sharedPrefs == null) {
      _sharedPrefs = await SharedPreferences.getInstance();
    }
  }

  String get fav => _sharedPrefs.getString(keyFav) ?? "";

  set fav(String value) {
    _sharedPrefs.setString(keyFav, value);
  }
}

final sharedPrefs = SharedPrefsUtil();
