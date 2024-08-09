import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiEmployeePatchService {
  final String baseUrl = 'http://127.0.0.1:8000';

  Future<void> sendPatchRequest(String data, int employeeId) async {
    final url = Uri.parse('$baseUrl/employee/edit-employee');

    final response = await http.patch(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, dynamic>{
          'data': data,
          'employee_id': employeeId
        },
      ),
    );

    if (response.statusCode == 200) {
      print(
          '--------------------- PATCH request successful! --------------------- ');
    } else {
      print('Error sending POST request: ${response.statusCode}');
    }
  }
}
