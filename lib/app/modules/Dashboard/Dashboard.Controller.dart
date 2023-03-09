import 'package:get/get.dart';
import 'package:demo/app/modules/Dashboard/Dashboard.Repository.dart';

class DashboardController extends GetxController {
  final DashboardRepository repository;
  DashboardController(this.repository);

  //========== loading state ==========//
  final _isLoading = false.obs;
  get isLoading => _isLoading.value;
  set isLoading(value) => _isLoading.value = value;

  initData() {
    getAllTypeMap();
  }

  //========== modules type map ==========//
  final _typeMap = [].obs;
  get typeMap => _typeMap.value;
  set typeMap(value) => _typeMap.value = value;

  getAllTypeMap() async {
    isLoading = true;
    await repository.getAllTypeMap().then((data) {
      typeMap = data['data'];
    });
    if (typeMap.length > 0 && typeMap != null) {
      isLoading = false;
    }
  }
}
