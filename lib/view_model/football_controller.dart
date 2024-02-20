import 'package:get/state_manager.dart';
import 'package:offline_data_display/model/crypto_model.dart';
import 'package:offline_data_display/repository/api_service.dart';

class CryptoController extends GetxController {
  List<CryptoModel> cryptoList = [];
  bool loading = false;

  @override
  void onInit() {
    fetchCrypto();
    super.onInit();
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
