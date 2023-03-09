import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo/app/core/values/color.dart';
import 'package:demo/app/model/Account.Model.dart';
import 'package:demo/app/modules/Dashboard/Dashboard.Page.dart';
import 'package:demo/app/modules/Home/Home.Repository.dart';

class HomeController extends GetxController {
  final HomeRepository repository;
  HomeController({required this.repository});

  //========== loading state ==========//
  final _isLoading = false.obs;
  get isLoading => _isLoading.value;
  set isLoading(value) => _isLoading.value = value;

  //========== modules account ==========//
  final _account = AccountModel(id: 0, name: '').obs;
  get account => _account.value;
  set account(value) => _account.value = value;

  loadAccount() async {
    isLoading = true;
    await repository.loadAccount().then((data) {
      account = AccountModel(id: data['id'], name: data['name']);
    });
    isLoading = false;
  }

  //========== modules navigation ==========//
  final _navigation = 'Dashboard'.obs;
  get navigation => _navigation.value;
  set navigation(value) => _navigation.value = value;

  changeNavigation(String id) {
    navigation = id;
  }

  loadNavigation() {
    switch (navigation) {
      case 'Dashboard':
        return DashboardPage();
      case 'Saved':
        return Container(color: CustomColor.success);
      case 'Notify':
        return Container(color: CustomColor.warning);
      case 'Profile':
        return Container(color: CustomColor.error);
      default:
        return DashboardPage();
    }
  }
}
