import 'package:get/get.dart';
import 'package:prestige_automobile/data/car_vo.dart';
import 'package:prestige_automobile/firebase/firebase.dart';

class CarDetailController extends GetxController {
  final _firebaseService = FirebaseServices();

  Future saveCar(
      String model,
      String name,
      String category,
      double purchasePrice,
      double sellingPrice,
      int year,
      String description,
      int id,
      String url) async {
    final car = CarVO(
        id: id,
        url: url,
        model: model,
        name: name,
        category: category,
        purchasePrice: purchasePrice,
        sellingPrice: sellingPrice,
        year: year,
        description: description);
    return _firebaseService.saveCar(car);
  }

  Future deleteCar(int id) => _firebaseService.deleteCar(id);
}
