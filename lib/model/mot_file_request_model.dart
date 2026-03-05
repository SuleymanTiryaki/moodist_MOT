class MotFileRequestModel {
  int? webServiceListId;
  int? userListId;
  String? language;
  String? reportGUID;

  MotFileRequestModel(
      {this.webServiceListId, this.userListId, this.language, this.reportGUID});

  MotFileRequestModel.fromJson(Map<String, dynamic> json) {
    webServiceListId = json['webServiceListId'];
    userListId = json['userListId'];
    language = json['language'];
    reportGUID = json['ReportGUID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['webServiceListId'] = webServiceListId;
    data['userListId'] = userListId;
    data['language'] = language;
    data['ReportGUID'] = reportGUID;
    return data;
  }
}
