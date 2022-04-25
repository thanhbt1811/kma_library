import 'package:flutter/cupertino.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/data/local_repository.dart';
import 'package:getx_base_code/data/remote/authentication_repository.dart';
import 'package:getx_base_code/domain/models/login_model.dart';
import 'package:getx_base_code/domain/request/login_request.dart';
import 'package:getx_base_code/presentation/widgets/export.dart';

class AuthenticationUsecase {
  final AuthenticationRepository _authenticationRepository;
  final LocalRepository _localRepository;

  AuthenticationUsecase(this._authenticationRepository, this._localRepository);

  Future<bool> login(
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
        _localRepository.setToken(loginModel.token);
        showTopSnackBar(context,
            message: 'Đăng nhập thành công', type: SnackBarType.done);
      }
    }
    return response.result ?? false;
  }
}
