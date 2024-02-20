import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:offline_data_display/view_model/football_controller.dart';

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
                child: controller.loading
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
                              backgroundImage: NetworkImage(controller
                                      .cryptoList[index].image ??
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRN9n-IgNtWZ2VJVrEYOcTAhnvbqlOaT2cOIQBF5Weh2RsL0-6cDCXgxdzbT9hl_PMgOk&usqp=CAU'),
                            ),
                            title: Text(
                              controller.cryptoList[index].name ?? 'Empty',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                                "Price : ${controller.cryptoList[index].currentPrice ?? 'Empty'}"),
                            trailing: Text(
                              controller.cryptoList[index].symbol
                                      .toString()
                                      .capitalize ??
                                  'Empty',
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('Check Connectivity'),
      ),
    );
  }
}
