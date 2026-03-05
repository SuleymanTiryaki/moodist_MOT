import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

import '../exception/network_exception.dart';
import '../model/mot_list_request_model.dart';
import '../model/mot_response_model.dart';
import '../service/IMotService.dart';

part 'mot_state.dart';

class MotCubit extends Cubit<MotState> {
  final IMotService service;
  final int appId;
  final int userListId;
  final String? languageCode;

  MotCubit(
      {required this.service,
      required this.appId,
      required this.userListId,
      this.languageCode})
      : super(const MotState());

  MotResponseModel? resultListModel;
  String searchKeyword = "";
  MotResponseModel currentList = MotResponseModel(items: []);

  fecthResult(int? hospitalListId, String? startDate, String? endDate,
      String? searchKey) async {
    Logger().d("user info");
    Logger().d(userListId);
    try {
      var data = await service.postResults(MotListRequestModel(
          userListId: userListId,
          appId: appId,
          hospitalListId: hospitalListId,
          language: languageCode,
          startDate: startDate,
          endDate: endDate,
          searchKey: searchKey));
      if (data is MotResponseModel) {
        Logger().d(data);
        if (data.status == true) {
          resultListModel = data;
          Logger().d("status true");
          currentList = data;
          emit(state.copyWith(
              status: MotStatus.completed, resultModel: data));
        } else {
          Logger().d("status false");
          emit(state.copyWith(status: MotStatus.error));
        }
      } else {
        Logger().d("model yanlış");
        emit(state.copyWith(status: MotStatus.error));
      }
    } on NetworkException catch (e) {
      Logger().d(e);
      emit(state.copyWith(status: MotStatus.error));
    } catch (e) {
      Logger().d(e);
      emit(state.copyWith(status: MotStatus.error));
    }
  }

  fecthResultAgain(int? hospitalListId, String? startDate, String? endDate,
      String? searchKey) {
    emit(state.copyWith(status: MotStatus.initial));
    fecthResult(hospitalListId, startDate, endDate, searchKey);
  }

  fecthReportFile(String pdfUrl) {
    Logger().d("pdfUrl: $pdfUrl");
    emit(state.copyWith(status: MotStatus.pdfLoading));
    if (pdfUrl.isNotEmpty) {
      emit(state.copyWith(status: MotStatus.pdfView, pdfUrl: pdfUrl));
    } else {
      emit(state.copyWith(status: MotStatus.pdfError));
    }
  }

  searchResult(String keyword) {
    Logger().d(keyword);
    if (resultListModel is MotResponseModel) {
      if (keyword.isEmpty) {
        currentList = resultListModel!;
        emit(state.copyWith(
            status: MotStatus.completed, resultModel: resultListModel));
      } else {
        MotResponseModel searchResultListModel =
            MotResponseModel(items: []);
        for (MotItemModel? motModel in (resultListModel!.items ?? [])) {
          if (motModel is MotItemModel) {
            String name = (motModel.reportName ?? "");
            String date = (motModel.reportDateTR ?? "");
            String dept = (motModel.departmentName ?? "");
            String lowerName = name.toLowerCase();
            if (lowerName.contains(keyword) ||
                date.contains(keyword) ||
                dept.toLowerCase().contains(keyword)) {
              searchResultListModel.items!.add(motModel);
              Logger().d(lowerName);
              Logger().d(dept);
            }
          }
        }
        currentList = searchResultListModel;
        emit(state.copyWith(
            status: MotStatus.completed,
            resultModel: searchResultListModel));
      }
    }
  }
}
