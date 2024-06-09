import 'package:get/get.dart';
import 'package:prestige_automobile/firebase/firebase.dart';

class HomeController extends GetxController {
  RxList banners = [].obs;
  RxBool isLoading = true.obs;

  final _firebaseService = FirebaseServices();

  @override
  void onInit() {
    _firebaseService.getBannerListStream().listen((event) {
      isLoading.value = false;
      if (event.isNotEmpty) {
        banners.value = event;
      }
      update();
    });

    super.onInit();
  }
}
