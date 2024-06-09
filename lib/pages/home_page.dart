import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prestige_automobile/constants/colors.dart';
import 'package:prestige_automobile/controller/home_controller.dart';
import 'package:prestige_automobile/widgets/card_item_widget.dart';

final _homeController = Get.put(HomeController());

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text(
          "Prestige Automobile",
          style: TextStyle(fontWeight: FontWeight.bold, color: kSecondaryColor),
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 30,
          ),
          Obx(() => _homeController.isLoading.value
              ? const Padding(
                  padding: EdgeInsets.only(top: 150),
                  child: Center(
                    child: CupertinoActivityIndicator(),
                  ),
                )
              : _homeController.banners.isEmpty
                  ? const Padding(
                      padding: EdgeInsets.only(top: 150),
                      child: Center(
                        child: Text("No Banners!"),
                      ),
                    )
                  : CarouselSlider.builder(
                      itemCount: _homeController.banners.length,
                      itemBuilder: (context, index, realIndex) => Container(
                            width: 280,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(25)),
                              child: Image.network(
                                  _homeController.banners[index],
                                  fit: BoxFit.cover),
                            ),
                          ),
                      options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 3 / 2,
                        viewportFraction: 0.7,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        scrollDirection: Axis.horizontal,
                      ))),
          const SizedBox(
            height: 40,
          ),
          Obx(() => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Available Cars",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "In Stock: ${_homeController.cars.length}",
                      style: const TextStyle(fontSize: 16),
                    )
                  ],
                ),
              )),
          const SizedBox(
            height: 30,
          ),
          Obx(
            () => _homeController.isCarLoading.value
                ? const Padding(
                    padding: EdgeInsets.only(top: 80),
                    child: Center(
                      child: CupertinoActivityIndicator(),
                    ),
                  )
                : _homeController.cars.isEmpty
                    ? const Padding(
                        padding: EdgeInsets.only(top: 80),
                        child: Center(
                          child: Text("No Cars!"),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 5.0,
                            crossAxisSpacing: 0.0,
                            mainAxisExtent: 235,
                          ),
                          itemCount: _homeController.cars.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {},
                              child: CardItemWidget(
                                  price:
                                      _homeController.cars[index].sellingPrice,
                                  name: _homeController.cars[index].name,
                                  url: _homeController.cars[index].url),
                            );
                          },
                        ),
                      ),
          )
        ],
      ),
    ));
  }
}
