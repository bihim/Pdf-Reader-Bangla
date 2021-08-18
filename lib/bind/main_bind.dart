import 'package:get/get.dart';
import 'package:pdf_book_bangla/controller/main_controller.dart';

class MainBind extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MainController());
  }

}