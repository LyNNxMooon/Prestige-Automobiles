import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prestige_automobile/constants/colors.dart';
import 'package:prestige_automobile/controller/home_controller.dart';

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
                      )))
        ],
      ),
    ));
  }
}
