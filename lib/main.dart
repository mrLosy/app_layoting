import 'dart:ui';

import 'package:google_fonts/google_fonts.dart';

import 'searchfield.dart';
import 'headcriteria.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'productcard.dart';

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
                      child: Icon(Icons.notifications_none_rounded),
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 63, child: Search()),
          const SizedBox(height: 40, child: HeadsCriteria()),
          const SizedBox(height: 467, child: ProductsCards()),
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


