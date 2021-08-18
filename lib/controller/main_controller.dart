import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController{

  var data = "".obs;
  var bottomIndex = 0.obs;

  /*@override
  Future<void> onInit() async {
    super.onInit();
    WidgetsFlutterBinding.ensureInitialized();
    final appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);

    var box = await Hive.openBox('people');

    var person1 = box.get('123');
    var person2 = box.get('442');
    data.value = person2.toString();
    print(person1);
  }*/
}