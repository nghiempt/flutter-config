import 'package:get/get.dart';
import 'package:demo/app/modules/Map/Map.Api.dart';
import 'package:demo/app/modules/Map/Map.Controller.dart';
import 'package:demo/app/modules/Map/Map.Repository.dart';
import 'package:http/http.dart' as http;

class MapBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyMapController>(() => MyMapController(
        MapRepository(MapApiClient(httpClient: http.Client()))));
  }
}
