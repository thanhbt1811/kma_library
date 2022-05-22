import 'package:flutter/cupertino.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/common/config/network/session_data.dart';
import 'package:getx_base_code/data/local_repository.dart';
import 'package:getx_base_code/data/remote/authentication_repository.dart';
import 'package:getx_base_code/data/remote/user_repository.dart';
import 'package:getx_base_code/domain/models/login_model.dart';
import 'package:getx_base_code/domain/models/user_model.dart';
import 'package:getx_base_code/domain/request/login_request.dart';
import 'package:getx_base_code/presentation/widgets/export.dart';

class AuthenticationUsecase {
  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;
  final LocalRepository _localRepository;

  AuthenticationUsecase(this._authenticationRepository, this._localRepository,
      this._userRepository);

  Future<UserModel?> checkAutoLogin(BuildContext context) async {
    final studentId = await _localRepository.getUsername();
    final password = await _localRepository.getPassword();
    if (studentId.isNotEmpty && password.isNotEmpty) {
      return await login(
          context, LoginRequest(studentId: studentId, password: password));
    }
    return null;
  }

  Future<UserModel?> login(
    BuildContext context,
    LoginRequest loginRequest,
  ) async {
    final response = await requestApi(
        () => _authenticationRepository.login(
              loginRequest.toJson(),
            ),
        context);
    if (response.result ?? false) {
      final loginModel = LoginModel.fromJson(response.data);
      if (loginModel.token.isNotEmpty) {
        SessionData.authToken = 'Bearer ${loginModel.token}';
        final user = await _userRepository.getUser(SessionData.authToken);
        showTopSnackBar(context,
            message: 'Đăng nhập thành công', type: SnackBarType.done);
        await _localRepository.setUsername(loginRequest.studentId);
        await _localRepository.setPassword(loginRequest.password);
        return UserModel.fromJson(user.data['data']);
      }
    } else {
      return null;
    }
    return null;
  }

  Future<void> logout() async {
    await _localRepository.setUsername("");
    await _localRepository.setPassword("");
    SessionData.authToken = "";
  }
}
