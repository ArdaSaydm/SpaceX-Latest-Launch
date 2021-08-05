import 'package:http/http.dart' as http;

class HttpService {
  static final baseUrl = "https://api.spacexdata.com/v4/launches";

  static Future<http.Response> getRequest(endPoint) async {
    http.Response response;

    final url = Uri.parse("$baseUrl$endPoint");
    try {
      response = await http.get(url);
    } on Exception catch (e) {
      throw e;
    }

    return response;
  }
}
