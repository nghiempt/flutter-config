import 'package:demo/app/modules/Home/Home.Api.dart';

class HomeRepository {
  final HomeApiClient apiClient;

  HomeRepository({required this.apiClient});

  loadAccount() {
    return apiClient.loadAccount();
  }
}
