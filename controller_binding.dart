import 'package:get/get.dart';
import 'package:skycargo/controllers/logincontroller.dart';

class Controllerbinding extends Bindings{
  void dependencies(){
    Get.put<LoginController>(LoginController());
  }
}