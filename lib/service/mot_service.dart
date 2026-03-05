import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../core/base_dio_service.dart';
import '../exception/network_exception.dart';
import '../model/mot_list_request_model.dart';
import '../model/mot_response_model.dart';
import 'IMotService.dart';

class MotService extends IMotService {
  MotService(Dio dio) : super(dio);

  @override
  Future<MotResponseModel?> postResults(
      MotListRequestModel requestModel) async {
    try {
      return await postResultsFunc(requestModel);
    } on DioException catch (e) {
      Logger().d("postResults hata -> status: ${e.response?.statusCode}, data: ${e.response?.data}");
      throw NetworkException(BaseDioService.service.handleDioError(e, null));
    } catch (e) {
      Logger().d(e);
      return null;
    }
  }

  postResultsFunc(MotListRequestModel requestModel) async {
    Logger().d(requestModel.toJson());
    final response = await dio.post(labResultsPath, data: requestModel.toJson());
    Logger().d("mot sonuçları listesi");
    Logger().d(response.data);
    if (response.statusCode == HttpStatus.ok) {
      return MotResponseModel.fromJson(response.data);
    } else {
      return null;
    }
  }
}
