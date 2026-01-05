import 'package:dio/dio.dart';
import '../models/auth_token_model.dart';

class AuthRemoteDatasource {
  final Dio dio;

  AuthRemoteDatasource(this.dio);

  Future<AuthTokenModel> loginWithGoogle(String idToken) async {
    final response = await dio.post(
      '/auth/google',
      data: {
        'id_token': idToken,
      },
    );

    return AuthTokenModel.fromJson(response.data);
  }
}
