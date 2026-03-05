class MotResponseModel {
  bool? status;
  List<MotItemModel>? items;
  String? message;

  MotResponseModel({this.status, this.items, this.message});

  MotResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['items'] != null) {
      items = <MotItemModel>[];
      json['items'].forEach((v) {
        items!.add(MotItemModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MotItemModel {
  String? departmentName;
  String? reportName;
  String? enterDate;
  String? exitDate;
  String? reportDateTR;
  String? pdfUrl;

  MotItemModel(
      {this.departmentName,
      this.reportName,
      this.enterDate,
      this.exitDate,
      this.reportDateTR,
      this.pdfUrl});

  MotItemModel.fromJson(Map<String, dynamic> json) {
    departmentName = json['DepartmentName'];
    reportName = json['ReportName'];
    enterDate = json['EnterDate'];
    exitDate = json['ExitDate'];
    reportDateTR = json['ReportDateTR'];
    pdfUrl = json['pdfUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['DepartmentName'] = departmentName;
    data['ReportName'] = reportName;
    data['EnterDate'] = enterDate;
    data['ExitDate'] = exitDate;
    data['ReportDateTR'] = reportDateTR;
    data['pdfUrl'] = pdfUrl;
    return data;
  }
}
