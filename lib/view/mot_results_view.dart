// Moodist MOT sonuçlar sayfası
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/mot_cubit.dart';
import '../service/mot_service.dart';
import 'widget/app_dialog.dart';

class MotResultsView extends StatelessWidget {
  final int appId;
  final int userListId;
  final String? languageCode;
  final int? hospitalListId;
  final String? startDate;
  final String? endDate;
  final String? searchKey;

  final Widget loadingView;
  final Widget Function(BuildContext context, Widget body) baseViewBuilder;
  final Widget Function(BuildContext context, MotState state)
      successViewBuilder;
  final Widget Function(BuildContext context, MotState state) errorViewBuilder;

  /// PDF yüklenirken gösterilecek dialog (opsiyonel, verilmezse varsayılan spinner gösterilir)
  final Function(BuildContext context)? pdfLoadingDialog;

  /// PDF URL'i hazır olduğunda çağrılır
  final Function(BuildContext context, MotState state) pdfSuccessDialog;

  /// PDF yüklenirken hata oluştuğunda çağrılır
  final Function(BuildContext context, MotState state) pdfErrorDialog;

  const MotResultsView({
    super.key,
    required this.appId,
    required this.userListId,
    this.languageCode,
    this.hospitalListId,
    this.startDate,
    this.endDate,
    this.searchKey,
    required this.loadingView,
    required this.baseViewBuilder,
    required this.successViewBuilder,
    required this.errorViewBuilder,
    this.pdfLoadingDialog,
    required this.pdfSuccessDialog,
    required this.pdfErrorDialog,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MotCubit>(
      create: (context) => MotCubit(
        service: MotService(
            Dio(BaseOptions(baseUrl: 'https://prtk.gen.tr/allHospitalV1/'))),
        appId: appId,
        userListId: userListId,
        languageCode: languageCode,
      )..fecthResult(hospitalListId, startDate, endDate, searchKey),
      child: BlocConsumer<MotCubit, MotState>(
        listener: (context, state) {
          switch (state.status) {
            case MotStatus.pdfLoading:
              if (pdfLoadingDialog != null) {
                pdfLoadingDialog!(context);
              } else {
                AppDialog(context).loadingDialog();
              }
              break;
            case MotStatus.pdfView:
              Navigator.pop(context);
              pdfSuccessDialog(context, state);
              break;
            case MotStatus.pdfError:
              Navigator.pop(context);
              pdfErrorDialog(context, state);
              break;
            default:
              break;
          }
        },
        builder: (context, state) {
          return baseViewBuilder(context, _bodyWidget(state, context));
        },
      ),
    );
  }

  Widget _bodyWidget(MotState state, BuildContext context) {
    switch (state.status) {
      case MotStatus.initial:
        return loadingView;
      case MotStatus.completed:
      case MotStatus.pdfLoading:
      case MotStatus.pdfView:
      case MotStatus.pdfError:
        return successViewBuilder(context, state);
      default:
        return errorViewBuilder(context, state);
    }
  }
}
