import 'package:minifootballfront/openapifiles/lib/api.dart';
import 'package:minifootballfront/service/countryservice.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

class MockCountryApi extends Mock implements CountryApi {}

void main() {
  group('CountryService Tests', () {
    test('getCountries returns a list of CreateCountryDTO on successful fetch',
        () async {

      final mockCountryApi = MockCountryApi();

      final countryService = CountryService(countryApi: mockCountryApi);

      when(mockCountryApi.apiCountryGetWithHttpInfo())
          .thenAnswer((_) async => http.Response('''[
        {
          "id": 1,
          "name": "ROMANIA"
        },
        {
          "id": 2,
          "name": "ENGLAND"
        },
        {
          "id": 3,
          "name": "SPAIN"
        }
      ]''', 200));

      final countries = await countryService.getCountries();

      expect(countries, isA<List<CountryDTO>>());
      expect(countries.length, 3); 


      expect(countries[0].name, "ROMANIA");
      expect(countries[1].name, "ENGLAND");
      expect(countries[2].name, "SPAIN");
    }); 
  });
}
