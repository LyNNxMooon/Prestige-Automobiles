import 'package:get/get.dart';
import 'package:prestige_automobile/data/car_vo.dart';
import 'package:prestige_automobile/firebase/firebase.dart';

class SearchPageController extends GetxController {
  final _firebaseService = FirebaseServices();
  RxList<CarVO> searchList = <CarVO>[].obs;
  RxList<CarVO> searchedCars = <CarVO>[].obs;

  callSearch(Function def) {
    _firebaseService.getSearchCarsStream().then((value) {
      searchList.value = value;
    });

    def;
    update();
  }
}
