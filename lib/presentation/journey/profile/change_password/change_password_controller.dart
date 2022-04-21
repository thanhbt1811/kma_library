import 'package:flutter/cupertino.dart';
import 'package:getx_base_code/presentation/controllers/core_controller.dart';

class ChangePasswordController extends CoreController {
  final TextEditingController oldPasswordCtl = TextEditingController();
  final TextEditingController newPasswordCtl = TextEditingController();
  final TextEditingController reNewPasswordCtl = TextEditingController();
}
