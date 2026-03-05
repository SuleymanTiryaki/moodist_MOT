class MotFileResponseModel {
  bool? status;
  String? url;
  String? message;

  MotFileResponseModel({this.status, this.url, this.message});

  MotFileResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    url = json['url'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['url'] = url;
    data['message'] = message;
    return data;
  }
}
