import 'package:dio/dio.dart';
import 'package:nkey/app/shared/custom_dio/custom_dio.dart';
import 'package:nkey/app/shared/models/moeda_model.dart';

import '../interfaces/home_repository_interface.dart';

class HomeRepository implements IHomeRepository {
  final CustomDio _dio;

  HomeRepository(this._dio);

  Future<MoedaModel> getMoedasByBase(String base) async {
    try {
      final response =
          await _dio.client.get('/latest', queryParameters: {"base": base});
      return MoedaModel.fromJson(response.data);
    } on DioError catch (e) {
      throw e;
    }
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
