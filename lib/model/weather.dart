import 'package:http/http.dart' as http;

class WeatherAPI {
  String baseURL = 'http://api.weatherapi.com/v1/current.json?key=b432d8c9b3bf4fe686221738231005&q=Indonesia&aqi=no';

  Future<http.Response> fetchData() {
    return http.get(Uri.parse(baseURL));
  }
}
