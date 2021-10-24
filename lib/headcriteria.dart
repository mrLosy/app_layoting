import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: ListView.separated(
          itemCount: head.length,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(8),
          itemBuilder: (BuildContext context, int index) {
            if (index != 0) {
              color = 0xfff5f7fa;
              colorText = 0xff000000;
            }
            return OneHeadCriteria(head[index], color, colorText);
          },
          separatorBuilder: (context, index) => const SizedBox(width: 10),
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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Color(_color),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(_title,
              style: TextStyle(
                color: Color(_colorText),
                fontSize: 15,
              )),
        ],
      ),
    );
  }
}
