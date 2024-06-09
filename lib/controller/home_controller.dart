import 'package:get/get.dart';
import 'package:prestige_automobile/data/car_vo.dart';
import 'package:prestige_automobile/firebase/firebase.dart';

class HomeController extends GetxController {
  RxList banners = [].obs;
  RxBool isLoading = true.obs;
  RxList<CarVO> cars = <CarVO>[].obs;
  RxBool isCarLoading = true.obs;

  final _firebaseService = FirebaseServices();

  @override
  void onInit() {
    _firebaseService.getBannerListStream().listen((event) {
      if (event.isNotEmpty) {
        banners.value = event;
        isLoading.value = false;
      }
      update();
    });

    callCars();

    super.onInit();
  }

  callCars() {
    isCarLoading.value = true;
    _firebaseService.getCarsStream().listen((event) {
      if (event.isNotEmpty) {
        cars.value = event;
        isCarLoading.value = false;
      }
    });

    update();
  }
}
