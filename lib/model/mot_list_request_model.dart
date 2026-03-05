class MotListRequestModel {
  int? appId;
  int? hospitalListId;
  int? userListId;
  String? language;
  String? startDate;
  String? endDate;
  String? searchKey;

  MotListRequestModel(
      {this.appId,
      this.hospitalListId,
      this.userListId,
      this.language,
      this.startDate,
      this.endDate,
      this.searchKey});

  MotListRequestModel.fromJson(Map<String, dynamic> json) {
    appId = json['appId'];
    hospitalListId = json['hospitalListId'];
    userListId = json['userListId'];
    language = json['language'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    searchKey = json['searchKey'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['appId'] = appId;
    data['hospitalListId'] = hospitalListId;
    data['userListId'] = userListId;
    data['language'] = language;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['searchKey'] = searchKey;
    return data;
  }
}
