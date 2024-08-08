import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiPatchService {
  final String baseUrl = 'http://127.0.0.1:8000';

  Future<void> sendPatchRequest(String data, int departmentId) async {
    final url = Uri.parse('$baseUrl/department/edit-department');

    final response = await http.patch(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, dynamic>{
          'data': data,
          'department_id': departmentId
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
