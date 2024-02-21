import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:offline_data_display/view_model/crypto_controller.dart';

class HomeScreen extends GetView<CryptoController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CryptoController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Offline Datas',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            GetBuilder<CryptoController>(
              init: CryptoController(),
              builder: (controller) => Expanded(
                child: controller.cryptoList.isEmpty
                    ? const Center(
                        child: Text(
                          'No data, Please connect to Internet',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      )
                    : controller.loading
                        ? const Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.orange,
                              strokeWidth: 4,
                            ),
                          )
                        : ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.black,
                                  child: CircleAvatar(
                                    radius: 27,
                                    child: Text(
                                      controller.cryptoList[index].symbol
                                              .toString()
                                              .capitalize ??
                                          'Empty',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                                title: Text(
                                  controller.cryptoList[index].name ?? 'Empty',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                    "Price : ${controller.cryptoList[index].currentPrice ?? 'Empty'}"),
                                trailing: Text(
                                  'Market cap rank : ${controller.cryptoList[index].marketCapRank}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 10),
                            itemCount: controller.cryptoList.length,
                          ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          controller.checkInternetConnection();
        },
        label: const Text('Check Connectivity'),
      ),
    );
  }
}
