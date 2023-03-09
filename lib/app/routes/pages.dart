import 'package:get/get.dart';
import 'package:demo/app/modules/Home/Home.Page.dart';
import 'package:demo/app/modules/Map/Map.Page.dart';
import 'package:demo/app/routes/routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => HomePage(),
    ),
    GetPage(
      name: Routes.MAP,
      page: () => MapPage(),
    ),
  ];
}
