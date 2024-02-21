import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:offline_data_display/model/crypto_model.dart';
import 'package:offline_data_display/repository/api_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class CryptoController extends GetxController {
  List<CryptoModel> cryptoList = [];
  bool loading = false;
  final secureStorage = const FlutterSecureStorage();

  @override
  void onInit() {
    fetchCrypto();
    super.onInit();
  }

  Future fetchCrypto() async {
    loading = true;
    try {
      final storedJson = await secureStorage.read(key: 'storedCryptos');
      if (storedJson != null && storedJson.isNotEmpty) {
        final decodedStoredCryptos = jsonDecode(storedJson) as List<dynamic>;
        cryptoList = decodedStoredCryptos
            .map((jsonItem) => CryptoModel.fromJson(jsonItem))
            .toList();
        update();
      } else {
        List<CryptoModel>? result = await ApiService.getCrypto();
        if (result != null) {
          cryptoList = result;
          await secureStorage.write(
              key: 'storedCryptos', value: jsonEncode(cryptoList));
          update();
        }
      }
    } catch (_) {}
    loading = false;
  }

  Future loadFromLocalStorage() async {
    try {
      final storedJson = await secureStorage.read(key: 'storedCryptos');
      if (storedJson != null && storedJson.isNotEmpty) {
        final decodedStoredCryptos = jsonDecode(storedJson) as List<dynamic>;
        cryptoList = decodedStoredCryptos
            .map((jsonItem) => CryptoModel.fromJson(jsonItem))
            .toList();
        update();
      }
    } catch (_) {}
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
      fetchCrypto();
    } else {
      Get.snackbar(
        'Internet',
        'Internet is Not Connected',
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.black,
      );
      loadFromLocalStorage();
    }
  }
}
