import 'package:http/http.dart' as http;

class RequestAdapterService {
  final String baseURL = "bwa-jobs.herokuapp.com";
  final http.Client _client = http.Client();

  Future<http.Response> sendGetRequest(
      {String? uri, Map<String, dynamic>? queryParameters}) async {
    return _client.get(Uri.https(baseURL, uri!, queryParameters));
  }

  Future<http.Response> sendPostRequest(
      String uri, Map<String, dynamic> body) async {
    return _client.post(
        Uri.https(
          baseURL,
          uri,
        ),
        body: body);
  }

  Future<http.Response> sendPutRequest(
      String uri, Map<String, dynamic> body) async {
    return _client.put(Uri.https(baseURL, uri), body: body);
  }

  Future<http.Response> sendDeleteRequest(String uri) async {
    return _client.delete(Uri.https(baseURL, uri));
  }
}
