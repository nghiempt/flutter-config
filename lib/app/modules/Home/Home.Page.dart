import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pandabar/pandabar.dart';
import 'package:demo/app/modules/Home/Home.Api.dart';
import 'package:demo/app/modules/Home/Home.Controller.dart';
import 'package:demo/app/modules/Home/Home.Repository.dart';

class HomePage extends GetView<HomeController> {
  @override
  final HomeController controller = Get.put(HomeController(
      repository:
          HomeRepository(apiClient: HomeApiClient(httpClient: http.Client()))));

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<HomeController>(
        initState: (state) {
          Get.find<HomeController>().loadAccount();
        },
        builder: (_) {
          return _.account == null || _.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : _.loadNavigation();
        },
      ),
      extendBody: true,
      bottomNavigationBar: PandaBar(
        backgroundColor: Colors.white,
        buttonData: [
          PandaBarButtonData(
              id: 'Dashboard', icon: Icons.dashboard, title: 'Trang chủ'),
          PandaBarButtonData(id: 'Saved', icon: Icons.book, title: 'Đã lưu'),
          PandaBarButtonData(
              id: 'Notify', icon: Icons.notifications, title: 'Thông báo'),
          PandaBarButtonData(
              id: 'Profile', icon: Icons.account_box, title: 'Cá nhân'),
        ],
        onChange: (id) {
          Get.find<HomeController>().changeNavigation(id);
        },
        onFabButtonPressed: () {},
      ),
    );
  }
}
