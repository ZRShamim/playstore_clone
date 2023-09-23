import 'package:get/get.dart';
import 'package:playstore_clone/app/playstore/controller/playstor_controller.dart';

class PlaystoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlaystoreController>(
      () => PlaystoreController(),
    );
  }
}
