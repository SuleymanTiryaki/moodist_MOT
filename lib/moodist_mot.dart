library moodist_mot;

export 'package:flutter_bloc/flutter_bloc.dart';

export 'cubit/mot_cubit.dart';
export 'model/mot_list_request_model.dart';
export 'model/mot_response_model.dart';
export 'service/IMotService.dart';
export 'service/mot_service.dart';
export 'view/mot_results_view.dart';

import 'package:flutter/material.dart';
import 'cubit/mot_cubit.dart';
import 'view/mot_results_view.dart';


class MoodistMot extends StatelessWidget {
  final int appId;
  final int userListId;
  final String? languageCode;
  final int? hospitalListId;
  final String? startDate;
  final String? endDate;
  final String? searchKey;

  final Widget loadingView;
  final Widget Function(BuildContext context, Widget body) baseViewBuilder;
  final Widget Function(BuildContext context, MotState state) successViewBuilder;
  final Widget Function(BuildContext context, MotState state) errorViewBuilder;

  final Function(BuildContext context)? pdfLoadingDialog;

  final Function(BuildContext context, MotState state) pdfSuccessDialog;

  final Function(BuildContext context, MotState state) pdfErrorDialog;

  const MoodistMot({
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
    return MotResultsView(
      appId: appId,
      userListId: userListId,
      languageCode: languageCode,
      hospitalListId: hospitalListId,
      startDate: startDate,
      endDate: endDate,
      searchKey: searchKey,
      loadingView: loadingView,
      baseViewBuilder: baseViewBuilder,
      successViewBuilder: successViewBuilder,
      errorViewBuilder: errorViewBuilder,
      pdfLoadingDialog: pdfLoadingDialog,
      pdfSuccessDialog: pdfSuccessDialog,
      pdfErrorDialog: pdfErrorDialog,
    );
  }
}
