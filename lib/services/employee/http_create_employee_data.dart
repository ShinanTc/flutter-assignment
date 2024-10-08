import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiEmployeeService {
  final String baseUrl = 'http://127.0.0.1:8000';

  Future<void> sendPostRequest(
      String employeeName, String department, String dob) async {
    final url = Uri.parse('$baseUrl/employee/create-employee');

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'employee_name': employeeName,
        'department': department,
        'dob': dob,
      }),
    );

    if (response.statusCode == 200) {
      print(
          '--------------------- POST request successful! --------------------- ');
    } else {
      print('Error sending POST request: ${response.statusCode}');
    }
  }
}
