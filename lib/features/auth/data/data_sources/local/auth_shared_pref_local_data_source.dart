import 'package:ecommerce/core/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthSharedPrefLocalDataSource {
  Future<void> saveToken(String token) async {
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString(CacheConstants.tokenKey, token);
  }

  Future<String> getToken() async {
    final sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getString(CacheConstants.tokenKey)!;
  }
}
