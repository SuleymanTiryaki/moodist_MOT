part of 'mot_cubit.dart';

enum MotStatus { initial, completed, error, pdfLoading, pdfView, pdfError }

class MotState {
  final MotStatus status;
  final MotResponseModel? resultModel;
  final String? pdfUrl;
  final String? errorMessage;

  const MotState({
    this.status = MotStatus.initial,
    this.resultModel,
    this.pdfUrl,
    this.errorMessage,
  });

  MotState copyWith({
    MotStatus? status,
    MotResponseModel? resultModel,
    String? pdfUrl,
    String? errorMessage,
  }) {
    return MotState(
      status: status ?? this.status,
      resultModel: resultModel ?? this.resultModel,
      pdfUrl: pdfUrl ?? this.pdfUrl,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
