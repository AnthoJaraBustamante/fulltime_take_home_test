import 'package:dio/dio.dart';
import 'package:fulltime_take_home_test/app/data/models/api_responde.dart';
import 'package:get_it/get_it.dart';

import '../comits_models.dart';
import '../network/endpoints.dart';

class CommitsApi {
  final Dio _dio = GetIt.instance<Dio>();

  Future<ApiResponse> getApi() async {
    try {
      final Response<dynamic> response = await _dio.get(
        Endpoints.commits,
      );
      if (response.statusCode == 200) {
        return ApiResponse(
          message: 'Lista de commits cargada correctamente',
          data: <Commits>[],
          success: true,
        );
      }
      return ApiResponse(
        message: 'Error al cargar la lista de commits',
        data: <Commits>[],
        success: false,
      );
    } on DioException  catch (e) {
      const String checkInternetMessage = 'Revise su conexión a Internet y vuelva a intentarlo.';
      return ApiResponse(
        message: e.type.name == 'other'
            ? checkInternetMessage
            : e.type.name == 'connectTimeout'
                ? 'Se acabo el tiempo de espera. $checkInternetMessage'
                : e.message!,
        data: <Commits>[],
        success: false,
      );
    }
  }
}
