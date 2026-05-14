// data/repository/auth_repository_impl.dart
import '../../domain/repositories/auth_repository.dart';
import '../datasource/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;

  AuthRepositoryImpl(this.remote);

  @override
  Future<bool> sendOtp(String mobile) => remote.sendOtp(mobile);

  @override
  Future<bool> verifyOtp(String code) => remote.verifyOtp(code);
}