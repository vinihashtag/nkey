import 'package:dio/dio.dart';

import 'interceptor_cache.dart';

class CustomDio {
  final Dio client;

  CustomDio(this.client) {
    client.options.baseUrl = "https://api.exchangeratesapi.io";
    client.interceptors.add(CacheInterceptors());

    client.options.connectTimeout = 4000;
    client.options.receiveTimeout = 4000;
  }
}
