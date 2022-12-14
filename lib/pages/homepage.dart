// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coffee/pages/util/coffee_tile.dart';
import 'package:coffee/pages/util/coffee_types.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List coffeeType = [
    ['Cappucino', true],
    ['Milky', false],
    ['Coffee', false],
    ['Latte', false],
  ];

  //user taps on coffee types
  void coffeeTypeSelected(int index) {
    setState(() {
      for(int i = 0; i < coffeeType.length; i++){
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: Icon(Icons.person),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: '',
        ),
      ]),
      body: Column(
        children: [
          //find the best coffee
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text('Find the best Coffee for you',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 45,
                  ))),
          SizedBox(
            height: 25,
          ),
          //Search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600))),
            ),
          ),
          SizedBox(
            height: 23,
          ),
          //horizontal ListView of coffee types
          Container(
              height: 45,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: coffeeType.length,
                itemBuilder: (context, index) {
                  return CoffeeType(
                    coffeeType: coffeeType[index][0],
                    isSelected: coffeeType[index][1],
                    onTap: (){
                      coffeeTypeSelected(index);
                    },
                  );
                },
              )),

          //horizontal ListView of coffee tiles
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CoffeeTile(
                  coffeeName: 'Coffee',
                  coffeePrice: '4.00',
                  imagePath: 'images/coffee.jpg',
                ),
                CoffeeTile(
                  coffeeName: 'Espresso',
                  coffeePrice: '4.50',
                  imagePath: 'images/espresso.jpg',
                ),
                CoffeeTile(
                  coffeeName: 'Latte',
                  coffeePrice: '5.00',
                  imagePath: 'images/milky.jpg',
                ),
              ],
            ),
          )

          //bottomNav bar
        ],
      ),
    );
  }
}
