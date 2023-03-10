import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guide_app/src/domain/entities/active_entity.dart';
import 'package:guide_app/src/domain/use_cases/get_active_use_case.dart';

class ActiveController extends GetxController {
  final GetActiveUseCase getActiveUseCase;
  late TextEditingController nameController;

  var activeEntity = ActiveEntity().obs;
  var messaError = ''.obs;
  List<List<dynamic>> listData = [];

  double minY = double.infinity;
  double maxY = 0.0;
  double minX = 0.0;
  double maxX = 0.0;

  ActiveController({required this.getActiveUseCase});

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
  }

  Future<void> getActive({required String name}) async {
    messaError.value = '';
    activeEntity.value = ActiveEntity();

    final res = await getActiveUseCase(name);
    res.getResult(
      onSuccess: (data) {
        activeEntity.value = data!;
        getListData();
      },
      onError: (error) {
        messaError.value = error.message ?? '';
      },
    );
  }

  void getListData() {
    const int AMOUNT_TRADING_SESSIONS = 30;

    final timeStampList = activeEntity.value.timestamp!.reversed.toList();
    final open = activeEntity.value.quotes!.first.open.reversed.toList();
    listData = [];

    for (int index = 0; index < AMOUNT_TRADING_SESSIONS; index++) {
      final data = [
        timeStampList[index],
        double.parse(open[index].toStringAsFixed(2)),
      ];
      listData.add(data);
    }
    listData = listData.reversed.toList();
    setValueXY(listData);
  }

  void setValueXY(List<List<dynamic>> list) {
    maxX = list.length.toDouble();
    minX = 0.0;
    for (var data in list) {
      maxY = data.last > maxY ? data.last : maxY;
      minY = data.last < minY ? data.last : minY;
    }
  }
}
