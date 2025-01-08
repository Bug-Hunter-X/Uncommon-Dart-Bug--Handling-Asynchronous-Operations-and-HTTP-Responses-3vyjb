```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      try {
        final jsonResponse = json.decode(response.body);
        if (jsonResponse is Map<String, dynamic>) {
          return jsonResponse;
        } else {
          throw Exception('Invalid JSON response format');
        }
      } catch (e) {
        print('Error decoding JSON: $e');
        throw Exception('Failed to parse JSON: $e');
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode} ${response.reasonPhrase}');
    }
  } catch (e) {
    print('Error fetching data: $e');
    rethrow; // Re-throw the exception to be handled by the caller
  }
}
```