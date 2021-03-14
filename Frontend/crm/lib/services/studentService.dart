import 'dart:convert';
import 'package:crm/constants/config.dart';
import 'package:crm/constants/endpoints.dart';
import 'package:crm/models/student.dart';
import 'package:crm/models/studentDetail.dart';
import 'package:crm/services/browserClientWithAuth.dart';
import 'package:crm/services/webAuthService.dart';

class StudentService {
  BrowserClientWithAuth client;
  String apiUrl;
  int apiPort;
  WebAuthService authService;

  StudentService() {
    client = new BrowserClientWithAuth();
    authService = WebAuthService();
  }

  Future<List<Student>> getStudents() async {
    var endpoint = Uri.parse(Config.apiUrl + Endpoints.getStudentsEndpoint());
    var response = await client.getWithAuthHeader(endpoint);

    if (response.statusCode != 200) {
      return Future.error('Something went wrong during fetching of students.');
    }

    var students = jsonDecode(response.body) as List;

    return students.map((student) {
      return Student.fromJson(student);
    }).toList();
  }

  Future<StudentDetail> getStudentDetail(int id) async {
    var endpoint =
        Uri.parse(Config.apiUrl + Endpoints.getStudentDetailEndpoint(id));
    var response = await client.getWithAuthHeader(endpoint);

    if (response.statusCode != 200) {
      return Future.error('Something went wrong during fetching of students.');
    }

    var studentDetail = jsonDecode(response.body);

    return StudentDetail.fromJson(studentDetail);
  }
}
