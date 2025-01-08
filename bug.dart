```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Properly handle the response body
      final jsonResponse = jsonDecode(response.body);
      // Access data from jsonResponse
      print(jsonResponse['key']);
    } else {
      // Handle non-200 status codes appropriately
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    // Handle exceptions (network errors, JSON decoding errors, etc.)
    print('Error fetching data: $e');
    // Consider re-throwing the exception or handling it based on your app's needs.
  }
}
```