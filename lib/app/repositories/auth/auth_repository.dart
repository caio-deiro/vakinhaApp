import 'package:vakinha_burguer_mobile/app/models/user_model.dart';

abstract class AuthRepository {
  Future<UserModel> register(
    String name,
    String password,
    String email,
  );

  Future<UserModel> login(String email, String password);
}
