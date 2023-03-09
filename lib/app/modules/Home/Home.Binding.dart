import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:demo/app/modules/Home/Home.Api.dart';
import 'package:demo/app/modules/Home/Home.Controller.dart';
import 'package:demo/app/modules/Home/Home.Repository.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() {
      return HomeController(
          repository: HomeRepository(
              apiClient: HomeApiClient(httpClient: http.Client())));
    });
  }
}
