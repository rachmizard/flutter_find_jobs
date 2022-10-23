import 'package:http/http.dart' as http;

class RequestAdapterService {
  final String baseURL = "https://bwa-jobs.herokuapp.com";
  final http.Client _client = http.Client();

  Future<http.Response> sendGetRequest(String uri) async {
    return _client.get(Uri.parse(uri));
  }

  Future<http.Response> sendPostRequest(
      String uri, Map<String, dynamic> body) async {
    return _client.post(Uri.parse(uri), body: body);
  }

  Future<http.Response> sendPutRequest(
      String uri, Map<String, dynamic> body) async {
    return _client.put(Uri.parse(uri), body: body);
  }

  Future<http.Response> sendDeleteRequest(String uri) async {
    return _client.delete(Uri.parse(uri));
  }
}
