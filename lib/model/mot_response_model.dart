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
  int? webServiceId;
  int? hospitalID;
  String? hospitalName;
  int? departmentID;
  String? departmentName;
  int? doctorID;
  String? doctorName;
  String? reportName;
  String? reportDateTR;
  String? reportStatus;
  String? reportGUID;
  String? doctorImage;

  MotItemModel(
      {this.webServiceId,
      this.hospitalID,
      this.hospitalName,
      this.departmentID,
      this.departmentName,
      this.doctorID,
      this.doctorName,
      this.reportName,
      this.reportDateTR,
      this.reportStatus,
      this.reportGUID,
      this.doctorImage});

  MotItemModel.fromJson(Map<String, dynamic> json) {
    webServiceId = json['webServiceId'];
    hospitalID = json['HospitalID'];
    hospitalName = json['HospitalName'];
    departmentID = json['DepartmentID'];
    departmentName = json['DepartmentName'];
    doctorID = json['DoctorID'];
    doctorName = json['DoctorName'];
    reportName = json['ReportName'];
    reportDateTR = json['ReportDateTR'];
    reportStatus = json['ReportStatus'];
    reportGUID = json['ReportGUID'];
    doctorImage = json['doctorImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['webServiceId'] = webServiceId;
    data['HospitalID'] = hospitalID;
    data['HospitalName'] = hospitalName;
    data['DepartmentID'] = departmentID;
    data['DepartmentName'] = departmentName;
    data['DoctorID'] = doctorID;
    data['DoctorName'] = doctorName;
    data['ReportName'] = reportName;
    data['ReportDateTR'] = reportDateTR;
    data['ReportStatus'] = reportStatus;
    data['ReportGUID'] = reportGUID;
    data['doctorImage'] = doctorImage;
    return data;
  }
}
