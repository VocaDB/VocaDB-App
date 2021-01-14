import 'dart:io';

import 'package:dio/dio.dart';

class ErrorUtils {
  static String read(Object err) {
    if (err is DioError) {
      return readDioError(err);
    }

    return err.toString();
  }

  static String readDioError(DioError err) {
    if (err.type == DioErrorType.DEFAULT) {
      return readDynamicError(err.error);
    }

    return err.message;
  }

  static String readDynamicError(dynamic err) {
    if (err is SocketException) {
      return err.message;
    }

    return err.toString();
  }
}
