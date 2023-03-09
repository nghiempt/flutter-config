import 'package:http/http.dart' as http;

class HomeApiClient {
  final http.Client httpClient;
  HomeApiClient({required this.httpClient});

  //================= load account logined ===================//
  loadAccount() async {
    try {
      return {
        'id': 1,
        'name': 'Admin',
      };
    } catch (_) {}
  }
}
