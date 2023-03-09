import 'package:demo/app/modules/Dashboard/Dashboard.Api.dart';

class DashboardRepository {
  final DashboardApiClient api;

  DashboardRepository(this.api);

  getAllTypeMap() {
    return api.getAllTypeMap();
  }
}
