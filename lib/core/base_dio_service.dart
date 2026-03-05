// hata yakalamaya yardımcı olur
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class BaseDioService {
  BaseDioService._();
  static final BaseDioService service = BaseDioService._();

  String handleDioError(DioException e, String? responseMessage) {
    String message;
    Logger().d("handleDioError $responseMessage");
    if (responseMessage != null) {
      Logger().d("handleDioError0");
      message = responseMessage;
    } else {
      switch (e.type) {
        case DioExceptionType.connectionError:
          Logger().d("handleDioError1");
          message = "İnternet bağlantınızı kontrol edip daha sonra tekrar deneyin.";
          break;
        case DioExceptionType.connectionTimeout:
          Logger().d("handleDioError2");
          message = responseMessage ?? "Bağlantı zaman aşımına uğradı.";
          break;
        case DioExceptionType.badCertificate:
          Logger().d("handleDioError3");
          message = responseMessage ?? "Bir sorun oluştu: Hata kodu #1";
          break;
        case DioExceptionType.badResponse:
          Logger().d("handleDioError4");
          message = responseMessage ?? "Bir sorun oluştu: Hata kodu #2";
          break;
        case DioExceptionType.receiveTimeout:
          Logger().d("handleDioError5");
          message = responseMessage ?? "Bir sorun oluştu: Hata kodu #3";
          break;
        default:
          Logger().d("handleDioError6");
          message = responseMessage ?? "Bir sorun oluştu: Hata kodu #5";
          break;
      }
    }
    return message;
  }
}
