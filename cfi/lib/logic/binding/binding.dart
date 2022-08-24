import 'package:cfi/logic/controller/maincontroller.dart';
import 'package:get/get.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => HomeController());
  }

}