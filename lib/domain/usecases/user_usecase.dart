import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/common/config/network/session_data.dart';
import 'package:getx_base_code/data/remote/user_repository.dart';
import 'package:getx_base_code/domain/models/user_model.dart';

class UserUsecase {
  final UserRepository _userRepository;

  UserUsecase(this._userRepository);

  Future<UserModel?> getUser(BuildContext context) async {
    final response = await requestApi(
        () => _userRepository.getUser(SessionData.authToken), context);
    if (response.result ?? false) {
      return null;
    } else {
      final user = UserModel.fromJson(response.data['data']);
      return user;
    }
  }

  Future<UserModel?> uploadAvatar(BuildContext context, File avatar) async {
    final Map<String, dynamic> request = {
      ArgumentConstants.thumbnail: await MultipartFile.fromFile(avatar.path),
    };
    final response = await requestApi(
        () => _userRepository.updateAvatar(SessionData.authToken, request),
        context);
    if (response.result ?? false) {
      return UserModel.fromJson(response.data);
    }
    return null;
  }
}
