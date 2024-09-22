import 'package:intl/intl.dart';
import 'package:email_validator/email_validator.dart';

import 'formatters.dart';

class AppValidator {
  static String? validatorText(
    String? value, {
    String? text,
    Function()? function,
  }) {
    String? valueT = value?.trim().toString();
    if (valueT == '' || valueT == null || valueT == 'null') {
      return text ?? 'กรุณากรอกข้อมูล';
    }

    if (function != null) {
      return function();
    }
    return null;
  }

  static String? validatorEmail(String? value) {
    String? valueT = value?.trim().toString();
    if (valueT == '' || valueT == null || valueT == 'null') {
      return 'กรุณากรอกอีเมล';
    } else if (!EmailValidator.validate(valueT)) {
      return 'กรอกอีเมลให้ถูกต้อง';
    }
    return null;
  }

  static String? validatorTimeRange({
    required DateTime? startTime,
    bool? isStart = false,
    required DateTime? endTime,
    bool? isEnd = false,
    String? text,
  }) {
    final kStartTime = convertDateTimeToTimeString(startTime);
    final kEndTime = convertDateTimeToTimeString(endTime);

    if (kStartTime == null && isStart == true) {
      return text ?? 'กรุณากรอกข้อมูล';
    }

    if (kEndTime == null && isEnd == true) {
      return text ?? 'กรุณากรอกข้อมูล';
    }

    if (kStartTime == null || kEndTime == null) {
      return null;
    }
    // กำหนดรูปแบบเวลาที่ต้องการ เช่น "HH:mm"
    final format = DateFormat("HH:mm");

    // แปลง String เป็น DateTime
    final startTimeDateTime = format.parse(kStartTime);
    final endTimeDateTime = format.parse(kEndTime);

    // เปรียบเทียบเวลา
    if (startTimeDateTime.isBefore(endTimeDateTime)) {
      return null;
    } else {
      return 'เวลาเริ่มต้นต้องน้อยกว่าเวลาสิ้นสุด';
    }
  }
}
