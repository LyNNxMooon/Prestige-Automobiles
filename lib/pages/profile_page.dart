import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prestige_automobile/constants/colors.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final userEmail = FirebaseAuth.instance.currentUser;

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
                "Admin Profile",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kSecondaryColor,
                    fontSize: 22),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.23),
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  color: kSecondaryColor),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(80),
                child: Image.network(
                  "https://cdn2.iconfinder.com/data/icons/shopping-colorline/64/admin-512.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "User Name: ",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  (userEmail?.email)
                          ?.substring(0, (userEmail?.email?.length)! - 10) ??
                      '',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 90,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  border: Border.all(width: 2, color: kSecondaryColor)),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.headphones),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        "Contact Us",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 15,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  border: Border.all(width: 2, color: kSecondaryColor)),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.document_scanner_outlined),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        "Privacy Policy",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 15,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    border: Border.all(width: 2, color: kSecondaryColor)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.logout),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          "Logout",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 15,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
