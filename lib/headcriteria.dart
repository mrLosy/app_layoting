import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeadsCriteria extends StatefulWidget {
  const HeadsCriteria({Key? key}) : super(key: key);

  @override
  State<HeadsCriteria> createState() => _HeadsCriteria();
}

class _HeadsCriteria extends State<HeadsCriteria> {
  List<String> head = ['Top Picks', 'Indoor', 'Garden', 'Succulent', 'Trees'];
  int color = 0xff51b1a6;
  int colorText = 0xffffffff;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: ListView.separated(
          itemCount: head.length,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(left: 5, bottom: 3.1),
          itemBuilder: (BuildContext context, int index) {
            if (index != 0) {
              color = 0xfff5f7fa;
              colorText = 0xff000000;
            }
            return OneHeadCriteria(head[index], color, colorText);
          },
          separatorBuilder: (context, index) => const SizedBox(width: 12),
        ));
  }
}

class OneHeadCriteria extends StatefulWidget {
  final String _title;
  final int _color;
  final int _colorText;
  const OneHeadCriteria(this._title, this._color, this._colorText, {Key? key})
      : super(key: key);

  @override
  State<OneHeadCriteria> createState() => _OneHeadCriteria();
}

class _OneHeadCriteria extends State<OneHeadCriteria> {
  @override
  Widget build(BuildContext context) {
    final String _title = widget._title;
    final int _color = widget._color;
    final int _colorText = widget._colorText;
    return Container(
      height: 32,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Color(_color),
      ),
      child: Text(
        _title,
        style: GoogleFonts.workSans(color: Color(_colorText), fontSize: 13),
      ),
    );
  }
}
