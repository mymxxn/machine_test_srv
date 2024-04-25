import 'dart:developer';

import 'package:get/get.dart';
import 'package:machine_test_srv/Model/data_list_model.dart';
import 'package:machine_test_srv/Model/profile_model.dart';
import 'package:machine_test_srv/Services/api_services.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
    getProfileData();
  }

  var dataList = <Datum>[].obs;
  var filterList = <Datum>[].obs;
  var sideMenuList = <DataModel>[].obs;
  var user = User().obs;
  var isLoading = false.obs;
  getData() async {
    isLoading.value = true;
    var result;
    try {
      var feedback =
          await ApiManager.fetchData(api: 'staff/api/dashboard/batch/card');
      if (feedback != null) {
        result = DataListModel.fromJson(feedback);
        dataList.value = result.data;
        filterList.value = dataList;
        update();
      }
    } finally {
      isLoading.value = false;
    }
  }

  int calculateDaysDifference(DateTime startDate, DateTime endDate) {
    return endDate.difference(startDate).inDays;
  }

  getProfileData() async {
    isLoading.value = true;
    var result;
    try {
      var feedback = await ApiManager.fetchData(api: 'staff/api/auth/sidebar');
      log("${feedback}");
      if (feedback != null) {
        result = ProfileModel.fromJson(feedback);
        sideMenuList.value = result.data;
        user.value = result.user;
        update();
      }
    } finally {
      isLoading.value = false;
    }
  }

  filterDataList(String search) {
    filterList.value = dataList
        .where((element) =>
            element.course?.name != null &&
            element.course!.name!.toLowerCase().contains(search.toLowerCase()))
        .toList();
    update();
  }
}
