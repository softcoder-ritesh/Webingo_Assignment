import 'dart:convert';
import 'package:http/http.dart' as http;

class FitnessApiService {
  final String baseUrl = "https://fitness.wigian.in";

  Future<Map<String, dynamic>> fetchUserPlans(String date) async {
    final response = await http.get(Uri.parse('$baseUrl/user_plan_api.php?date=$date'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load user plans');
    }
  }

  Future<Map<String, dynamic>> updateUserPlans(String date, List<Map<String, dynamic>> plans) async {
    final response = await http.post(
      Uri.parse('$baseUrl/user_plan_api.php'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'date': date,
        'plans': plans,
      }),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to update user plans');
    }
  }
}