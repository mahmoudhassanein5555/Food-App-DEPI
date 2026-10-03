import 'package:food_app_depi/features/auth/data/models/user_model.dart';

class AuthData {
  static final List<UserModel> _users = [
    UserModel(
        id: '1',
        email: 'mahmoud@gmail.com',
        name: 'Mahmoud Hassanein',
        password: 'Password123'),
    UserModel(
        id: '2',
        email: 'ahmed@gmail.com',
        name: 'Ahmed Hassan',
        password: 'Password911'),
  ];

  static addUser(UserModel user) {
    _users.add(user);
  }

  static bool authenticateUser(String email, String password) {
    return _users
        .any((user) => user.email == email && user.password == password);
  }
}
