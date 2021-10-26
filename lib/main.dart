import 'dart:ui';

import 'package:google_fonts/google_fonts.dart';

import 'searchfield.dart';
import 'headcriteria.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
  get iconFont => null;

  get children => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: selectedIndex,
            elevation: 0,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.spa_outlined), label: ""),
              BottomNavigationBarItem(
                  icon: Icon(Icons.local_mall_outlined), label: ""),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_outlined), label: ""),
            ],
            onTap: (int index) {
              onTapHandler(index);
            }),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 22, right: 20, top: 55, bottom: 15),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  child: Text(
                    "Discover",
                    style: GoogleFonts.workSans(
                      color: const Color(0xff24243f),
                      fontSize: 28.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 157),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    SizedBox(
                      width: 22,
                      height: 22,
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.circular(8),
                      // ),
                      child: Icon(Icons.notifications_none_rounded),
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 63, child: Search()),
          const SizedBox(height: 32, child: HeadsCriteria()),
          const SizedBox(
              height: 467, width: double.infinity, child: ProductsCards()),
        ]),
      ),
    );
  }

  void onTapHandler(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}

class ProductsCards extends StatefulWidget {
  const ProductsCards({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProductsCards();
}

class _ProductsCards extends State<ProductsCards> {
  List<String> title = ['Peace Lily', 'Calathea'];
  List<String> category = ['Indoor', 'Indoor'];
  List<String> description = [
    'The peace lily plant is well known for its air-purifying abilities as a houseplant',
    'Calathea is a species of perennial plant in the family known as the pra...'
  ];
  List<String> price = ['20.000', '22.000'];
  List<String> image = [
    'assets/images/PeaceLily.png',
    'assets/images/PeaceLily.png'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(top: 10, bottom: 10),
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: ListView.separated(
          itemCount: title.length,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(8),
          itemBuilder: (BuildContext context, int index) {
            return Product(title[index], category[index], description[index],
                price[index], image[index]);
          },
          separatorBuilder: (context, index) => const SizedBox(width: 50)),
    );
  }
}

class Product extends StatefulWidget {
  final String _title;
  final String _description;
  final String _category;
  final String _price;
  final String _image;
  const Product(
      this._title, this._category, this._description, this._price, this._image,
      {Key? key})
      : super(key: key);

  @override
  State<Product> createState() => _Product();
}

class _Product extends State<Product> {
  @override
  Widget build(BuildContext context) {
    final String _title = widget._title;
    final String _description = widget._description;
    final String _category = widget._category;
    final String _price = widget._price;
    final String _image = widget._image;
    return Container(
      height: 467,
      width: 252,
      // color: Colors.green,
      clipBehavior: Clip.none,
      padding: const EdgeInsets.only(
        top: 6,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 39,
            right: 15,
            left: 15,
            child: Container(
              width: 221,
              height: 187,
              clipBehavior: Clip.none,
              decoration: const BoxDecoration(
                  color: Color(0xffe5e0da),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  )),
            ),
          ),
          Positioned(
            top: 6.44,
            right: 44,
            left: -14,
            child: Image(
              width: 250,
              height: 250,
              image: AssetImage(_image),
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: 226,
            right: 15,
            left: 15,
            bottom: 15,
            child: Container(
              width: 221,
              height: 245,
              clipBehavior: Clip.none,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      // spreadRadius: 15,
                      blurRadius: 10,
                      offset: const Offset(5, 5),
                    )
                  ]),
            ),
          ),
          Positioned(
            top: 244.5,
            right: 32,
            left: 32,
            child: SizedBox(
              width: 184,
              height: 56,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          _category,
                          textAlign: TextAlign.left,
                          style: GoogleFonts.workSans(
                              color: const Color(0xff888e9a), fontSize: 14.71),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(_title,
                            style: GoogleFonts.workSans(
                              color: const Color(0xff000000),
                              fontSize: 23,
                            ))
                      ],
                    ),
                  ]),
            ),
          ),
          Positioned(
              top: 310,
              left: 34,
              right: 34,
              child: SizedBox(
                height: 69,
                width: 184.5,
                child: Text(_description,
                    softWrap: true,
                    style: GoogleFonts.workSans(
                      color: const Color(0xff888e9a),
                      fontSize: 14.7,
                    )),
              )),
          Positioned(
            top: 394,
            right: 33.7,
            left: 33.7,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Icon(Icons.favorite_border_sharp),
                Text(
                  '\$' + _price,
                  style: GoogleFonts.workSans(
                    color: const Color(0xff51b1a6),
                    fontSize: 14.7,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
