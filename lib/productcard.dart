
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    'assets/images/Calathea.png'
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
          separatorBuilder: (context, index) => const SizedBox(width: 40)),
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
              decoration: BoxDecoration(
                  color: const Color(0xffe5e0da),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 20,
                      offset: const Offset(5, 20),
                    ),
                  ]),
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
                      color: Colors.grey.withOpacity(0.023),
                      spreadRadius: 5,
                      blurRadius: 25,
                      offset: const Offset(5, 0),
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