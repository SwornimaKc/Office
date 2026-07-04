class AuthService {
  static const String _validEmail = "admin@gmail.com";
  static const String _validPassword = "adminpassword";

  // Tracks whether someone is currently "logged in" this session
  static bool _isLoggedIn = false;

  static bool get isLoggedIn => _isLoggedIn;

  static Future<bool> loginAdmin(String email, String password) async {
    if (email.trim() == _validEmail && password == _validPassword) {
      _isLoggedIn = true;
      return true;
    }
    return false;
  }

  static void logout() {
    _isLoggedIn = false;
  }
}