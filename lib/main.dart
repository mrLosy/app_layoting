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
      title: 'Flutter Demo',
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
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    child: Text(
                      "Discover",
                      style: TextStyle(
                        color: Color(0xff24243f),
                        fontSize: 28.5,
                        fontFamily: "Work Sans",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 161.82),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 22,
                        height: 22,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.notifications_none_rounded),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 100, child: Search()),
              const SizedBox(
                  height: 60.0, width: 600.0, child: HeadsCriteria()),
              const SizedBox(height: 370, width: double.infinity, child: ProductsCards()),
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
    ''
  ];
  List<String> price = ['20.000', '22.000'];
  List<String> image = [
    'assets/images/PeaceLily.png',
    'assets/images/PeaceLily.png'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: ListView.separated(
          itemCount: title.length,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(8),
          itemBuilder: (BuildContext context, int index) {
            return Product(title[index], category[index], description[index],
                price[index], image[index]);
          },
          separatorBuilder: (context, index) => const SizedBox(width: 100)),
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
      color: Colors.green,
      clipBehavior: Clip.none,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            children: [
              Container(
                clipBehavior: Clip.none,
                color: const Color(0xffe5e0da),
                child: Image(
                  width: 250,
                  height: 250,
                  image: AssetImage(_image),
                  fit: BoxFit.fill,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
