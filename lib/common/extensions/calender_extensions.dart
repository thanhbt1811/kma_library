import 'package:flutter/material.dart';
import 'package:getx_base_code/common/constants/constants_export.dart';

extension CalenderExtensions on Calender {
  String get label {
    switch (this) {
      case Calender.morning:
        return 'Buổi sáng';
      case Calender.afternoon:
        return 'Buổi chiều';
    }
  }

  TimeOfDay get time {
    switch (this) {
      case Calender.morning:
        return const TimeOfDay(hour: 8, minute: 0);
      case Calender.afternoon:
        return const TimeOfDay(hour: 14, minute: 0);
    }
  }
}
