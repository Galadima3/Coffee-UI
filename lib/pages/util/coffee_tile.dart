// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CoffeeTile extends StatelessWidget {
  final String imagePath;
  final String coffeeName;
  final String coffeePrice;
  const CoffeeTile({
    Key? key,
    required this.imagePath,
    required this.coffeeName,
    required this.coffeePrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, bottom: 25.0),
      child: Container(
        padding: EdgeInsets.all(12),
        width: 200,
        decoration: BoxDecoration(
            color: Colors.black54, borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagePath,
              ),
            ),
            //coffee name
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coffeeName,
                    style: TextStyle(fontSize: 17),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'with Soy Milk',
                    style: TextStyle(color: Colors.grey.shade500),
                  ),
                ],
              ),
            ),

            //price
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$$coffeePrice'),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(12)),
                      child: Icon(Icons.add))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
