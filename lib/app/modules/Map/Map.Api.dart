import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:demo/app/core/utils/api.dart';

class MapApiClient {
  final http.Client httpClient;
  MapApiClient({required this.httpClient});

  getDataLayer(String url) async {
    try {
      var response = await httpClient.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        if (kDebugMode) {
          print('error');
        }
      }
    } catch (_) {}
  }

  getKeyword(String key) async {
    try {
      var response = await httpClient.get(Uri.parse(ApiUrl.KEY_WORD));
      if (response.statusCode == 200) {
        jsonDecode(response.body)['data'].forEach((element) {
          if (element['Key'] == key) {
            return element['Value'].toString();
          }
        });
      } else {
        if (kDebugMode) {
          print('error');
        }
      }
    } catch (_) {}
  }
}
