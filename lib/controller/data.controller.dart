import 'dart:developer';

import 'package:get/get.dart';

import '../survices/data_survices.dart';

class DataController extends GetxController {
  var list = [].obs;
  final service = DataSurvices();
  var _loading = false.obs;

  get loading => _loading.value;

    
  get newList => list.where((e) => e['status']).map((e) => e).toList();

  @override
  void onInit() {
    super.onInit();
    _loadData();
  }

  _loadData() async {
    _loading.value = false;
    try {
      var info = await service.getUsers();
      list.addAll(info);
    } catch (e) {
      print('Error !');
      print(e);
    } finally {
      _loading.value = true;
    }
  }
}
