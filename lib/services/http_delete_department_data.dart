import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiDeleteService {
  final String baseUrl = 'http://127.0.0.1:8000';

  Future<void> sendDeleteRequest(int departmentId) async {
    final url = Uri.parse('$baseUrl/department/delete-department');

    final response = await http.delete(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, int>{
        'department_id': departmentId,
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
