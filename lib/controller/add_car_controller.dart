import 'dart:io';

import 'package:get/get.dart';
import 'package:prestige_automobile/data/car_vo.dart';
import 'package:prestige_automobile/firebase/firebase.dart';

class AddCarController extends GetxController {
  File? selectFile;

  final _firebaseService = FirebaseServices();

  Future saveCar(String model, String name, String category, int purchasePrice,
      int sellingPrice, int year) async {
    int id = DateTime.now().millisecondsSinceEpoch;

    String fileURL = await _uploadFileToFirebaseStorage();

    final car = CarVO(
        id: id,
        url: fileURL,
        model: model,
        name: name,
        category: category,
        purchasePrice: purchasePrice,
        sellingPrice: sellingPrice,
        year: year);
    return _firebaseService.saveCar(car);
  }

  Future _uploadFileToFirebaseStorage() {
    String path = 'image';
    String contentType = 'image/jpg';

    return FirebaseServices.uploadToFirebaseStorage(
        selectFile!, path, contentType);
  }
}
