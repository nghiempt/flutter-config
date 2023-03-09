import 'package:get/get.dart';
import 'package:demo/app/modules/Dashboard/Dashboard.Api.dart';
import 'package:demo/app/modules/Dashboard/Dashboard.Controller.dart';
import 'package:demo/app/modules/Dashboard/Dashboard.Repository.dart';
import 'package:http/http.dart' as http;

class DashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController(
        DashboardRepository(DashboardApiClient(httpClient: http.Client()))));
  }
}
