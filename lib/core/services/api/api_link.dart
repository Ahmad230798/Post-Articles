class ApiLink {
  static const String baseUrl = 'http://10.0.2.2:8000/api/v1';

  /// ================= Auth =================
  static const String register = '$baseUrl/auth/register/';
  static const String login = '$baseUrl/auth/login/';
  static const String getMyProfile = '$baseUrl/users/me/';
  static const String getMySavedArticls = '$baseUrl/articles/bookmarks/';
  static String getUserProfile(String userName) {
    return '$baseUrl/users/$userName/';
  }

  static String followUser(String userName) {
    return '$baseUrl/users/$userName/follow/';
  }
}
