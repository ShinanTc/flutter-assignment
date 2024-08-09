import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiEmployeeService {
  final String baseUrl = 'http://127.0.0.1:8000';

  Future<List<dynamic>> fetchEmployees() async {
    
    final response =
        await http.get(Uri.parse('$baseUrl/employee/get-employees'));
        
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['employees'];
    } else {
      throw Exception('Failed to load employees');
    }
  }
}
