import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prestige_automobile/controller/search_controller.dart';
import 'package:prestige_automobile/data/car_vo.dart';
import 'package:prestige_automobile/pages/car_detail_page.dart';
import 'package:prestige_automobile/widgets/search_item_tile.dart';

final searchController = Get.put(SearchPageController());

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    _searchController.addListener(_onSearchChanged);
    super.initState();
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    searchController.callSearch(searchResultList);
    super.didChangeDependencies();
  }

  _onSearchChanged() {
    searchResultList();
  }

  searchResultList() {
    List<CarVO> showResults = [];
    if (_searchController.text.isNotEmpty) {
      for (var snapShot in searchController.searchList) {
        String name = snapShot.name.toLowerCase();

        if (name.contains(_searchController.text.toLowerCase())) {
          showResults.add(snapShot);
        }
      }
    } else {
      showResults = List.from(searchController.searchList);
    }

    searchController.searchedCars.value = showResults;
  }

  final _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: CupertinoSearchTextField(
          controller: _searchController,
        ),
      ),
      body: Obx(() => searchController.searchedCars.isEmpty
          ? const SizedBox()
          : Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
              ),
              child: ListView.separated(
                  itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Get.to(() => CarDetailPage(
                              car: searchController.searchedCars[index]));
                        },
                        child: SearchItemTile(
                            url: searchController.searchedCars[index].url,
                            name: searchController.searchedCars[index].name,
                            price: searchController
                                .searchedCars[index].sellingPrice),
                      ),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 15,
                      ),
                  itemCount: searchController.searchedCars.length),
            )),
    ));
  }
}
