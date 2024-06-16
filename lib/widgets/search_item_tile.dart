import 'package:flutter/material.dart';
import 'package:prestige_automobile/constants/colors.dart';

class SearchItemTile extends StatelessWidget {
  const SearchItemTile(
      {super.key, required this.url, required this.name, required this.price});

  final String url;
  final String name;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: kPrimaryColor),
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 70,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(url, fit: BoxFit.cover),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )
            ],
          ),
          Text(
            "\$ $price",
            style: const TextStyle(color: kSecondaryColor),
          )
        ],
      ),
    );
  }
}
