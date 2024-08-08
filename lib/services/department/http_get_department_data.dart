import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://127.0.0.1:8000';

  Future<List<dynamic>> fetchDepartments() async {
    final response =
        await http.get(Uri.parse('$baseUrl/department/get-departments'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['departments'];
    } else {
      throw Exception('Failed to load departments');
    }
  }
}
