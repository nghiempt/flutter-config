import 'package:demo/app/modules/Map/Map.Api.dart';

class MapRepository {
  final MapApiClient api;

  MapRepository(this.api);

  getDataLayer(String url) {
    return api.getDataLayer(url);
  }

  getKeyword(String key) {
    return api.getKeyword(key);
  }
}
