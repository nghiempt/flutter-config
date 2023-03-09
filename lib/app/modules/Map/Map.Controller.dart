import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:sizer/sizer.dart';
import 'package:demo/app/core/utils/api.dart';
import 'package:demo/app/modules/Map/Map.Repository.dart';
import 'package:demo/app/modules/Map/widgets/Modal.ShowData.dart';

class MyMapController extends GetxController {
  final MapRepository repository;
  MyMapController(this.repository);

  //========== loading state ==========//
  final _isLoading = false.obs;
  get isLoading => _isLoading.value;
  set isLoading(value) => _isLoading.value = value;

  initData(Map map) async {
    isLoading = true;
    await setPost(map);
    mapController = MapController();
    center = LatLng(
      double.parse(post['Lat']),
      double.parse(post['Lng']),
    );
    isLoading = false;
  }

  //========== modules post ==========//
  final _post = {}.obs;
  get post => _post.value;
  set post(value) => _post.value = value;

  setPost(Map map) {
    post = map;
  }

  //========== modules map ==========//
  late MapController mapController;

  final _center = LatLng(14.00714, 108.046968).obs;
  get center => _center.value;
  set center(value) => _center.value = value;

  final _dataLayer = [].obs;
  get dataLayer => _dataLayer.value;
  set dataLayer(value) => _dataLayer.value = value;

  onClickMap(tapPosition, LatLng point, BuildContext context) async {
    dataLayer = [];
    await getDataWhenClick(point, context);
  }

  getDataWhenClick(LatLng point, BuildContext context) async {
    String url = '${ApiUrl.hostGeoserver}/geoserver/demo_commercial/wms?';
    var param = {
      'FORMAT': 'image/png',
      'INFO_FORMAT': 'application/json',
      'STYLES': '',
      'WIDTH': '101',
      'HEIGHT': '101',
      'LAYERS': '${post['PostData'][0]['FileUpload']['NameSource']}',
      'REQUEST': 'GetFeatureInfo',
      'SRS': 'EPSG:4326',
      'BBOX':
          '${mapController.bounds!.west.toString()},${mapController.bounds!.south.toString()},${mapController.bounds!.east.toString()},${(mapController.bounds!.north.toString())}',
      'VERSION': '1.1.1',
      'X': '50',
      'Y': '50',
      'SERVICE': 'WMS',
      'QUERY_LAYERS': '${post['PostData'][0]['FileUpload']['NameSource']}',
      'TRANSPARENT': 'true',
    };
    for (var entry in param.entries) {
      url += '&${entry.key}=${entry.value}';
    }
    await repository.getDataLayer(url).then(
          (value) => {
            if (value['features'].length > 0)
              {
                value['features'].forEach((element) {
                  dataLayer.add(element['properties']);
                }),
              }
            else
              {log('no data')},
            showDataWhenClick(context),
          },
        );
  }

  showDataWhenClick(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 50.h,
          child: ModalShowData(dataLayer: dataLayer),
        );
      },
    );
  }
}
