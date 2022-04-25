import 'package:getx_base_code/common/common_export.dart';

extension ErrorEnumExtensions on ErrorEnum {
  int get code {
    switch (this) {
      case ErrorEnum.unauthorized:
        return 401;
    }
  }

  String get stringCode {
    switch (this) {
      case ErrorEnum.unauthorized:
        return 'Unauthorized';
    }
  }

  String get message {
    switch (this) {
      case ErrorEnum.unauthorized:
        return "Phiên đăng nhập hết hạn vui lòng đăng nhập lại";
    }
  }
}
