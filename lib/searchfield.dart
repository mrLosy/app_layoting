import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  SearchField createState() => SearchField();
}

class SearchField extends State<Search> {
  var searchView = TextEditingController();

  bool firstSearch = true;
  String query = "";

  late List<String> nebulae;
  late List<String> filterList;

  @override
  void initState() {
    super.initState();
    nebulae = ["Denis", "Sasha", "Danya", "Dima", "Ilya", "Serezha"];
    nebulae.sort();
  }

  SearchField() {
    searchView.addListener(() {
      if (searchView.text.isEmpty) {
        setState(() {
          firstSearch = true;
          query = "";
        });
      } else {
        setState(() {
          firstSearch = false;
          query = searchView.text;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
      child: Column(
        children: <Widget>[
          createSearchView(),
          firstSearch ? createView() : perfomeSearch()
        ],
      ),
    );
  }

  Widget createSearchView() {
    return Stack(children: <Widget>[
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(0xfff5f7fa)),
        child: TextField(
          controller: searchView,
          decoration: InputDecoration(
            icon: const Icon(Icons.search, color: Colors.black),
            hintText: "Search plant",
            hintStyle: TextStyle(color: Colors.grey[300]),
          ),
          textAlign: TextAlign.left,
        ),
      ),
    ]);
  }

  Widget createView() {
    return Flexible(
      child: ListView.builder(
        clipBehavior: Clip.none,
        itemCount: nebulae.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
              color: Colors.white,
              elevation: 5.0,
              child: Container(
                margin: const EdgeInsets.all(15.0),
                child: Text(nebulae[index]),
              ));
        },
      ),
    );
  }

  Widget perfomeSearch() {
    filterList = <String>[];
    for (int i = 0; i < nebulae.length; i++) {
      var item = nebulae[i];

      if (item.toLowerCase().contains(query.toLowerCase())) {
        filterList.add(item);
      }
    }
    return createFilteredListView();
  }

  Widget createFilteredListView() {
    return Flexible(
        child: ListView.builder(
            itemCount: filterList.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                  color: Colors.white,
                  elevation: 5.0,
                  child: Container(
                    margin: const EdgeInsets.all(15.0),
                    child: Text(filterList[index]),
                  ));
            }));
  }
}
