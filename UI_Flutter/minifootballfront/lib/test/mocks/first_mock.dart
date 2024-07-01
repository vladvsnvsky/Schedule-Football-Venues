// Create a file for your mocks, e.g., test/mocks.dart
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

// Use the @GenerateMocks annotation to specify which classes to mock
@GenerateMocks([http.Client])
void main() {}
