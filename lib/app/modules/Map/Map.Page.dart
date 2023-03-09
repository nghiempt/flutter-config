import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:demo/app/core/utils/api.dart';
import 'package:demo/app/core/values/color.dart';
import 'package:demo/app/core/values/string.dart';
import 'package:demo/app/modules/Map/Map.Api.dart';
import 'package:demo/app/modules/Map/Map.Controller.dart';
import 'package:demo/app/modules/Map/Map.Repository.dart';
import 'package:http/http.dart' as http;

class MapPage extends GetView<MyMapController> {
  MapPage({super.key});

  @override
  final MyMapController controller = Get.put(
      MyMapController(MapRepository(MapApiClient(httpClient: http.Client()))));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bản đồ quy hoạch')),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            GetX<MyMapController>(
              init: controller,
              initState: (_) {
                controller.initData(Get.arguments);
              },
              builder: (_) {
                return _.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Stack(
                        children: [
                          FlutterMap(
                            mapController: _.mapController,
                            options: MapOptions(
                              center: _.center,
                              zoom: 11,
                              onTap: (tapPosition, point) =>
                                  {_.onClickMap(tapPosition, point, context)},
                            ),
                            children: [
                              TileLayer(urlTemplate: StyleMap.DEFAULT),
                              _.post.length > 0
                                  ? TileLayer(
                                      wmsOptions: WMSTileLayerOptions(
                                        baseUrl:
                                            '${ApiUrl.hostGeoserver}/geoserver/demo_commercial/wms?',
                                        layers: [
                                          '${_.post['PostLayer']['FileUpload']['NameSource']}'
                                        ],
                                      ),
                                      backgroundColor:
                                          CustomColor.white.withOpacity(0),
                                    )
                                  : const CircularProgressIndicator()
                            ],
                          ),
                        ],
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
