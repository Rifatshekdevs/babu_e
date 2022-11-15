// ignore_for_file: unnecessary_statements, unnecessary_null_comparison

import 'package:agora_test/src/api/api_url.dart';
import 'package:agora_test/src/api/local_cash_controller.dart';
import 'package:dio/dio.dart' as DIO;


class ApiRequest {
  final String url;
  // final gs = GetStorage();
  final dynamic data;

  ApiRequest({
    required this.url,
    this.data,
  });
  String token = LocalStorage.getId() ?? '';

  static DIO.Dio dio = DIO.Dio(
    DIO.BaseOptions(
      baseUrl: ApiUrl.baseUrl,
      headers: {
        'content-type': 'application/json',
        'authorization': 'Bearer ${LocalStorage.getId() ?? ''}',
      },
    ),
  );
  // ..interceptors
  //     .add(DIO.LogInterceptor(responseBody: true, requestBody: true))
  // ..interceptors;

  Future<DIO.Response>? get({
    required Function() beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
  }) {
    beforeSend();
    // printInfo(
    //     info:
    //         "GET /$url queryParameters:$data Token: ${preferences!.getString(AppStrings.token)}");
    dio.get(this.url, queryParameters: this.data).then((res) {
      if (onSuccess != null) onSuccess(res.data);
      return res;
    }).catchError((error, s) {
      // print("------------>$s");
      onError(error);
    });
    return null;
  }

  Future<DIO.Response>? post({
    required Function() beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
  }) {
    // Hive.openBox("tokenBox");
    beforeSend == null ? null : beforeSend();
    // printInfo(
    //     info:
    //         "POST /$url DATA:$data Token: ${preferences!.getString(AppStrings.token)}");

    dio.post(url, data: data).then((res) {
      if (res.statusCode == 400) {
        onError(res.data);
      } else {
        onSuccess(res.data);
      }
      return res;
    }).catchError((error) {
      // printError(info: error.toString());
      onError(error);
    });
    return null;
  }

  Future<DIO.Response>? delete({
    required Function() beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
  }) {
    beforeSend == null ? null : beforeSend();
    // printInfo(
    //     info:
    //         "DELETE /$url DATA:$data Token: ${preferences!.getString(AppStrings.token)}");

    dio.delete(url, data: data).then((res) {
      if (res.statusCode == 400) {
        onError(res.data);
      } else {
        onSuccess(res.data);
      }
      return res;
    }).catchError((error) {
      // printError(info: error.toString());
      onError(error);
    });
    return null;
  }

  Future<DIO.Response>? patch({
    required Function() beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
  }) {
    beforeSend == null ? null : beforeSend();
    // printInfo(
    //     info:
    //         "PATCH /$url DATA:$data Token: ${preferences!.getString(AppStrings.token)}");

    dio.patch(url, data: data).then((res) {
      if (res.statusCode == 202) {
        onError(res.data);
      } else {
        onSuccess(res.data);
      }
      return res;
    }).catchError((error) {
      // printError(info: error.toString());
      onError(error);
    });
    return null;
  }

  Future<DIO.Response>? put({
    required Function() beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
  }) {
    beforeSend == null ? null : beforeSend();
    // printInfo(
    //     info:
    //         "PUT /$url DATA:$data Token: ${preferences!.getString(AppStrings.token)}");

    dio.put(url, data: data).then((res) {
      if (res.statusCode == 202) {
        onError(res.data);
      } else {
        onSuccess(res.data);
      }
      return res;
    }).catchError((error) {
      // printError(info: error.toString());
      onError(error);
    });
    return null;
  }
}

resetDIO() {
  ApiRequest.dio = DIO.Dio(
    DIO.BaseOptions(
      baseUrl: ApiUrl.baseUrl,
      headers: {
        'content-type': 'application/json',
        'authorization': 'Bearer ${LocalStorage.getId() ?? ''}',
      },
    ),
  );
  // ..interceptors
  //     .add(DIO.LogInterceptor(responseBody: true, requestBody: true))
  // ..interceptors;
}
