import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiEmployeePatchService {
  final String baseUrl = 'http://127.0.0.1:8000';

  Future<void> sendPatchRequest(
      String name, int employeeId, String department, String dob) async {
    final url = Uri.parse('$baseUrl/employee/edit-employee');

    final response = await http.patch(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, dynamic>{
          'employee_name': name,
          'employee_id': employeeId,
          'department': department,
          'dob': dob
        },
      ),
    );

    if (response.statusCode == 200) {
      print(
          '--------------------- PATCH request successful! --------------------- ');
    } else {
      print('Error sending PATCH request: ${response.statusCode}');
    }
  }
}
