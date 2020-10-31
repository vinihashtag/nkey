import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheInterceptors extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) async {
    if (options.extra.containsKey("refresh")) {
      // ? Busca dados do cache
      if (!options.extra["refresh"]) {
        // * igual a false busca no cache
        SharedPreferences prefs = await SharedPreferences.getInstance();
        if (prefs.containsKey("${options.uri}")) {
          var res = jsonDecode(prefs.getString("${options.uri}"));
          return Response(data: res, statusCode: 200);
        }
      }
    }
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("${response.request.uri}", jsonEncode(response.data));
    return super.onResponse(response);
  }

  @override
  Future onError(DioError error) async {
    // ? Caso tenha dado erro de timeout ou erro padrão tenta buscar dados do cache
    if (error.type == DioErrorType.CONNECT_TIMEOUT ||
        error.type == DioErrorType.DEFAULT) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (prefs.containsKey("${error.request.uri}")) {
        print("Response Cache[${error.type}] => PATH: ${error.request.uri}");
        var res = jsonDecode(prefs.getString("${error.request.uri}"));
        res['atualizado'] = false;
        return Response(data: res, statusCode: 200);
      }
    }
    return super.onError(error);
  }
}
