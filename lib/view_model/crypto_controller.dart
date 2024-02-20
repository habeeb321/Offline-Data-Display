import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:offline_data_display/model/crypto_model.dart';
import 'package:offline_data_display/repository/api_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class CryptoController extends GetxController {
  List<CryptoModel> cryptoList = [];
  bool loading = false;

  @override
  void onInit() {
    fetchCrypto();
    super.onInit();
  }

  Future checkInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Get.snackbar(
        'Internet',
        'Internet Connected',
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.black,
      );
    } else {
      Get.snackbar(
        'Internet',
        'Internet is Not Connected',
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.black,
      );
    }
  }

  fetchCrypto() async {
    loading = true;
    List<CryptoModel>? result = await ApiService.getCrypto();
    if (result != null) {
      cryptoList = result;
      update();
    }
    loading = false;
  }
}
