import 'package:allerg/provider/auth_provider.dart';
import 'package:allerg/user_model.dart';

class AuthRepository {

  final AuthProvider _authProvider = AuthProvider();

  static AuthRepository? _instance;

  factory AuthRepository() => _instance ??= AuthRepository._();

  AuthRepository._();



  Future<UserModel> loginUser() async {
    final response = await _authProvider.loginUser();

    return UserModel();
  }
}
