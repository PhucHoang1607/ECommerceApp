import 'package:e_commerce_app_project/core/common/singletons/cache.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  const CacheHelper(this._prefs);

  final SharedPreferences _prefs;

  static const _sessionTokenKey = 'user-session-token';
  static const _userIdKey = 'user-id';
  static const _firstTimeKey = 'is-user-first-timer';

  Future<bool> cacheSessionToken(String token) async {
    try {
      final result = await _prefs.setString(_sessionTokenKey, token);
      Cache.instance.setSessionToken(token);
      return result;
    } catch (_) {
      return false;
    }
  }

  Future<bool> cacheUserId(String userId) async {
    try {
      final result = await _prefs.setString(_userIdKey, userId);
      Cache.instance.setUserId(userId);
      return result;
    } catch (_) {
      return false;
    }
  }

  Future<void> cacheFirstTimer() async {
    await _prefs.setBool(_firstTimeKey, false);
  }

  String? getSessionToken() {
    final sessionToken = _prefs.getString(_sessionTokenKey);
    if (sessionToken case String()) {
      Cache.instance.setSessionToken(sessionToken);
    }
    return sessionToken;
  }

  String? getUserId() {
    final userId = _prefs.getString(_userIdKey);
    if (userId case String()) {
      Cache.instance.setUserId(userId);
    }
    return userId;
  }

  Future<void> resetSession() async {
    await _prefs.remove(_sessionTokenKey);
    await _prefs.remove(_userIdKey);
    Cache.instance.resetSession();
  }

  bool isFirstTime() => _prefs.getBool(_firstTimeKey) ?? true;
}