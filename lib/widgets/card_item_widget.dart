import 'package:flutter/cupertino.dart';
import 'package:prestige_automobile/constants/colors.dart';

class CardItemWidget extends StatelessWidget {
  const CardItemWidget(
      {super.key, required this.name, required this.url, required this.price});

  final String name;
  final String url;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.center,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(10), //border corner radius
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            ),
            height: 140,
            width: double.infinity,
            child: //Image.asset('assets/drink.png')
                ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: Image.network(
                url,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
                //width: 110,
                child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Text(
                    '$price MMK',
                    style: const TextStyle(color: kSecondaryColor),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
