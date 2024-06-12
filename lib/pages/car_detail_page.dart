import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:prestige_automobile/constants/colors.dart';
import 'package:prestige_automobile/controller/car_detail_controller.dart';
import 'package:prestige_automobile/controller/home_controller.dart';
import 'package:prestige_automobile/data/car_vo.dart';

final _carDetailController = Get.put(CarDetailController());
final _homeController = Get.put(HomeController());

class CarDetailPage extends StatefulWidget {
  const CarDetailPage({super.key, required this.car});

  final CarVO car;

  @override
  State<CarDetailPage> createState() => _CarDetailPageState();
}

class _CarDetailPageState extends State<CarDetailPage> {
  late TextEditingController _priceController;

  @override
  void initState() {
    _priceController =
        TextEditingController(text: "${widget.car.sellingPrice}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          size: 18,
                        )),
                    Container(
                      width: 100,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: kSecondaryColor),
                      child: Center(
                        child: Text(
                          widget.car.category,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => const CupertinoActivityIndicator(),
                    );
                    _carDetailController.deleteCar(widget.car.id).then((value) {
                      _homeController.callCars();
                      Get.back();

                      Fluttertoast.showToast(
                          msg: "Car Deleted!", backgroundColor: kErrorColor);
                      Get.back();
                    });
                  },
                  child: const Icon(
                    Icons.delete,
                    color: kErrorColor,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: Container(
                width: 250,
                height: 220,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    widget.car.url,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Name : ${widget.car.name}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Row(
                  children: [
                    const Text(
                      "\$ ",
                      style: TextStyle(
                          color: kSecondaryColor, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 80,
                      height: 50,
                      child: TextField(
                        controller: _priceController,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                            color: kSecondaryColor,
                            fontWeight: FontWeight.bold),
                        decoration: const InputDecoration(
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  width: 100,
                  height: 25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: kThirdColor),
                  child: Center(
                    child: Text(
                      widget.car.model,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: kPrimaryColor),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              thickness: 1.5,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text(
                  "Manufactured Year : ",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${widget.car.year}",
                  style: const TextStyle(fontSize: 16),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              thickness: 1.5,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Description : ",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              widget.car.description,
              textAlign: TextAlign.justify,
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => const CupertinoActivityIndicator(),
                );
                _carDetailController
                    .saveCar(
                        widget.car.model,
                        widget.car.name,
                        widget.car.category,
                        widget.car.purchasePrice,
                        int.parse(_priceController.text),
                        widget.car.year,
                        widget.car.description,
                        widget.car.id,
                        widget.car.url)
                    .then((value) {
                  _homeController.callCars();
                  Get.back();

                  Fluttertoast.showToast(
                      msg: "Car Updated!", backgroundColor: kSuccessColor);
                });
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: kSecondaryColor),
                child: const Center(
                  child: Text(
                    "Update",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    ));
  }
}
