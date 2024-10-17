import '../models/user_model.dart';
import '../datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  Future<UserModel> login(String email, String password) {
    return remoteDataSource.login(email, password);
  }
}
