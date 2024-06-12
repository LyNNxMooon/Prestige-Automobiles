import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:prestige_automobile/constants/colors.dart';
import 'package:prestige_automobile/controller/add_car_controller.dart';
import 'package:prestige_automobile/controller/home_controller.dart';
import 'package:prestige_automobile/utils/file_picker_utils.dart';
import 'package:prestige_automobile/widgets/am_text_field_widget.dart';

final _filePicker = FilePickerUtils();
final _addFormController = Get.put(AddCarController());
final _homeController = Get.put(HomeController());

class AddFormPage extends StatefulWidget {
  const AddFormPage({super.key});

  @override
  State<AddFormPage> createState() => _AddFormPageState();
}

class _AddFormPageState extends State<AddFormPage> {
  final _modelController = TextEditingController();
  final _nameController = TextEditingController();
  final _categoryController = TextEditingController();
  final _purchasePriceController = TextEditingController();
  final _sellingPriceController = TextEditingController();
  final _yearController = TextEditingController();
  final _descriptionController = TextEditingController();
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
                height: 30,
              ),
              const Center(
                child: Text(
                  "Add New Car",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kSecondaryColor,
                      fontSize: 22),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Container(
                    width: 200,
                    height: 180,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(width: 2, color: kSecondaryColor)),
                    child: _addFormController.selectFile == null
                        ? GestureDetector(
                            onTap: () async {
                              _addFormController.selectFile =
                                  await _filePicker.getImage();
                              setState(() {});
                            },
                            child: const Center(
                              child: Icon(
                                Icons.add_a_photo_outlined,
                                size: 40,
                              ),
                            ),
                          )
                        : Container(
                            width: 200,
                            height: 180,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.file(
                                _addFormController.selectFile!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )),
              ),
              const SizedBox(
                height: 20,
              ),
              AMTextFormField(
                maxLines: 1,
                controller: _modelController,
                textInputAction: TextInputAction.next,
                hint: "Model",
              ),
              const SizedBox(
                height: 20,
              ),
              AMTextFormField(
                maxLines: 1,
                controller: _nameController,
                textInputAction: TextInputAction.next,
                hint: "Name",
              ),
              const SizedBox(
                height: 20,
              ),
              AMTextFormField(
                maxLines: 1,
                controller: _categoryController,
                textInputAction: TextInputAction.next,
                hint: "Category",
              ),
              const SizedBox(
                height: 20,
              ),
              AMTextFormField(
                maxLines: 1,
                controller: _purchasePriceController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                hint: "Purchase Price",
              ),
              const SizedBox(
                height: 20,
              ),
              AMTextFormField(
                maxLines: 1,
                controller: _sellingPriceController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                hint: "Selling Price",
              ),
              const SizedBox(
                height: 20,
              ),
              AMTextFormField(
                maxLines: 1,
                controller: _yearController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                hint: "Year",
              ),
              const SizedBox(
                height: 20,
              ),
              AMTextFormField(
                maxLines: 6,
                controller: _descriptionController,
                textInputAction: TextInputAction.next,
                hint: "Description",
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () async {
                  if (_addFormController.selectFile == null ||
                      _modelController.text.isEmpty ||
                      _nameController.text.isEmpty ||
                      _categoryController.text.isEmpty ||
                      _purchasePriceController.text.isEmpty ||
                      _sellingPriceController.text.isEmpty ||
                      _yearController.text.isEmpty) {
                    Fluttertoast.showToast(
                        msg: "Fill all the fields!",
                        backgroundColor: kErrorColor);
                  } else {
                    showDialog(
                      context: context,
                      builder: (_) => const CupertinoActivityIndicator(),
                    );
                    _addFormController
                        .saveCar(
                            _modelController.text,
                            _nameController.text,
                            _categoryController.text,
                            int.parse(_purchasePriceController.text),
                            int.parse(_sellingPriceController.text),
                            int.parse(_yearController.text),
                            _descriptionController.text)
                        .then((value) {
                      _homeController.callCars();
                      Get.back();
                      _addFormController.selectFile = null;
                      _modelController.clear();
                      _nameController.clear();
                      _categoryController.clear();
                      _purchasePriceController.clear();
                      _sellingPriceController.clear();
                      _yearController.clear();
                      _descriptionController.clear();
                      setState(() {});
                      Fluttertoast.showToast(
                          msg: "Car Added!", backgroundColor: kSuccessColor);
                    });
                  }
                },
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: kSecondaryColor),
                  child: const Center(
                    child: Text("Add"),
                  ),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
