import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiEmployeeDeleteService {
  final String baseUrl = 'http://127.0.0.1:8000';

  Future<void> sendDeleteRequest(int employeeId) async {
    final url = Uri.parse('$baseUrl/employee/delete-employee');

    final response = await http.delete(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, int>{
        'employee_id': employeeId,
      }),
    );

    if (response.statusCode == 200) {
      print(
          '--------------------- DELETE request successful! --------------------- ');
    } else {
      print('Error sending DELETE request: ${response.statusCode}');
    }
  }
}
