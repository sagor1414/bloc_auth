import '../../data/repositories/auth_repository.dart';
import '../../data/models/user_model.dart';

class LoginUseCase {
  final AuthRepositoryImpl repository;

  LoginUseCase(this.repository);

  Future<UserModel> call(String email, String password) {
    return repository.login(email, password);
  }
}
