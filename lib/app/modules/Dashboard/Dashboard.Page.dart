import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:sizer/sizer.dart';
import 'package:demo/app/core/values/string.dart';
import 'package:demo/app/global_widgets/Custom.Search.dart';
import 'package:demo/app/modules/Dashboard/Dashboard.Api.dart';
import 'package:demo/app/modules/Dashboard/Dashboard.Controller.dart';
import 'package:demo/app/modules/Dashboard/Dashboard.Repository.dart';
import 'package:demo/app/modules/Dashboard/widgets/Category.Widget.dart';
import 'package:demo/app/modules/Dashboard/widgets/Snapping.Widget.dart';
import 'package:http/http.dart' as http;
import 'package:snapping_sheet/snapping_sheet.dart';

class DashboardPage extends GetView<DashboardController> {
  @override
  final DashboardController controller = Get.put(DashboardController(
      DashboardRepository(DashboardApiClient(httpClient: http.Client()))));

  DashboardPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<DashboardController>(
        initState: (state) => Get.find<DashboardController>().initData(),
        builder: (_) => _.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                children: <Widget>[
                  FlutterMap(
                    options: MapOptions(
                      center: LatLng(14.50, 108.22),
                      zoom: 8,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate: StyleMap.DEFAULT,
                      ),
                    ],
                  ),
                  Positioned(
                    top: 4.h,
                    left: 3.w,
                    right: 3.w,
                    child: const CustomSearch(),
                  ),
                  Positioned(
                    top: 10.h,
                    left: 3.w,
                    right: 3.w,
                    child: CategoryWidget(
                      categorys: Get.find<DashboardController>().typeMap,
                    ),
                  ),
                  SnappingModal(
                    snappingSheetController: SnappingSheetController(),
                    listMapFilter: localPosts,
                  ),
                ],
              ),
      ),
    );
  }
}
