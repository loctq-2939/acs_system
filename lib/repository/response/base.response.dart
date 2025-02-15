

import '../models/errorMessage.model.dart';

class BaseResponse {
  int? status;
  int? code;
  int? isBlock;
  int? isFirstLogin;
  bool? success;
  String? message;
  dynamic data;
  List<ErrorMessageModel>? errors;

  BaseResponse(
      {this.status,
      this.success,
      this.message,
      this.data,
      this.isFirstLogin,
      this.isBlock,
      this.errors,
      this.code
      });

  factory BaseResponse.fromMap(dynamic map) {
    return map is Map
        ? BaseResponse(
            status: map['status'] as int?,
            code: map['code'] as int?,
            isBlock: map['isBlock'] as int?,
            isFirstLogin: map['isFirstLogin'] as int?,
            success: map['success'] as bool?,
            message: map['message'] as String?,
            data: map['data'],
            errors: map['errors'] as List<ErrorMessageModel>?,
          )
        : BaseResponse();
  }

  Map<String, dynamic> toMap() => {
        'status': status,
        'code': code,
        'isBlock': isBlock,
        'isFirstLogin': isFirstLogin,
        'success': success,
        'message': message,
        'data': data,
        'errors': errors,
      };
}
