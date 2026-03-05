import 'package:dio/dio.dart';

import '../model/mot_file_request_model.dart';
import '../model/mot_file_response_model.dart';
import '../model/mot_list_request_model.dart';
import '../model/mot_response_model.dart';

abstract class IMotService {
  final Dio dio;

  IMotService(this.dio);

  final String labResultsPath = IMotServicePath.labResults.rawValue;
  final String resultFilePath = IMotServicePath.resultFile.rawValue;

  Future<MotResponseModel?> postResults(MotListRequestModel requestModel);
  Future<MotFileResponseModel?> postReportFile(MotFileRequestModel motFileRequestModel);
}

enum IMotServicePath { labResults, resultFile }

// BaseUrl'nin sonuna MOT sayfasının requesti için gelecek olan eklenti için oluşturuldu
extension IMotServicePathExtension on IMotServicePath {
  String get rawValue {
    switch (this) {
      case IMotServicePath.labResults:
        return '/moodistLabResult.php';
      case IMotServicePath.resultFile:
        return '/moodistLabResultFile.php';
    }
  }
}
