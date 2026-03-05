import 'package:flutter_test/flutter_test.dart';
import 'package:moodist_mot/moodist_mot.dart';

void main() {
  group('MotResponseModel', () {
    test('fromJson doğru parse edilmeli', () {
      final json = {
        "status": true,
        "message": "OK",
        "items": [
          {
            "DepartmentName": "MÜŞAHEDE GÜNÜBİRLİK",
            "ReportName": "HERTA",
            "EnterDate": "2025-01-24 00:00:00",
            "ExitDate": "",
            "ReportDateTR": "24-01-2025",
            "pdfUrl": "https://reporter.moodsoft.com.tr/herta_pdf.php?t=test"
          }
        ]
      };

      final model = MotResponseModel.fromJson(json);

      expect(model.status, true);
      expect(model.message, "OK");
      expect(model.items?.length, 1);
      expect(model.items?.first.departmentName, "MÜŞAHEDE GÜNÜBİRLİK");
      expect(model.items?.first.reportName, "HERTA");
      expect(model.items?.first.reportDateTR, "24-01-2025");
    });

    test('toJson doğru map döndürmeli', () {
      final item = MotItemModel(
        departmentName: "TEST DEPT",
        reportName: "TEST REPORT",
        reportDateTR: "01-01-2025",
      );

      final json = item.toJson();

      expect(json['DepartmentName'], "TEST DEPT");
      expect(json['ReportName'], "TEST REPORT");
      expect(json['pdfUrl'], "https://example.com/pdf");
    });
  });

  group('MotListRequestModel', () {
    test('toJson doğru map döndürmeli', () {
      final model = MotListRequestModel(
        userListId: 188,
        startDate: "2024-01-01",
        endDate: "2026-03-04",
      );

      final json = model.toJson();

      expect(json['userListId'], 188);
      expect(json['startDate'], "2024-01-01");
      expect(json['endDate'], "2026-03-04");
    });
  });
}
