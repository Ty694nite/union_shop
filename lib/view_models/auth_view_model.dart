import '../models/user.dart';

class AuthViewModel {
  User? currentUser;

  void login(String email, String password) {
    // Dummy login
    currentUser = User(id: '1', name: 'Test User', email: email);
  }

  void logout() {
    currentUser = null;
  }
}
