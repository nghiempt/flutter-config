import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:demo/app/core/utils/api.dart';

class DashboardApiClient {
  final http.Client httpClient;
  DashboardApiClient({required this.httpClient});

  //================= get all type map ===================//
  getAllTypeMap() async {
    try {
      var response = await httpClient.get(Uri.parse(ApiUrl.TYPE_MAP));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        if (kDebugMode) {
          print('error');
        }
      }
    } catch (_) {}
  }
}
