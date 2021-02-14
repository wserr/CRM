import 'dart:convert';
import 'package:crm/constants/config.dart';
import 'package:crm/constants/endpoints.dart';
import 'package:crm/models/student.dart';
import 'package:http/browser_client.dart';

class StudentService {
  BrowserClient client;
  String apiUrl;
  int apiPort;

  StudentService() {
    client = new BrowserClient();
  }

  Future<List<Student>> getStudents() async {
    var endpoint = Uri.parse(Config.apiUrl + Endpoints.getStudentsEndpoint);
    var response = await client.get(endpoint);

    if (response.statusCode != 200) {
      return Future.error('Something went wrong during fetching of students.');
    }

    var students = jsonDecode(response.body) as List;

    return students.map((student) {
      return Student.fromJson(student);
    }).toList();
  }
}
