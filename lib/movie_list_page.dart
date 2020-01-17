import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class MovieListPage extends StatefulWidget {
  final String _type;

  MovieListPage(this._type) {
    debugPrint('init MovieListPage $_type');
  }

  @override
  _MovieListPageState createState() {
    debugPrint('createState $_type');
    return _MovieListPageState();
  }
}

class _MovieListPageState extends State<MovieListPage> {
  int page = 1;
  int pageSize = 20;
  List mList = [];
  String result = "";

  // 偏移量计算公式: offset = (page - 1) * pageSize;
  int offset = 0;

  _MovieListPageState() {
    debugPrint('init _MovieListPageState');
  }

  @override
  void initState() {
    super.initState();
    getMovieList();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('build ${widget._type}');
    return ListView.builder(
      itemCount: mList.length,
      itemBuilder: (BuildContext context, int index) {
        var item = mList[index];
        return Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Image.network(item["url"], scale: 2),
            Column(
              children: <Widget>[
                Text(item["title"], style: TextStyle(color: Colors.white70)),
                Text(item["date"], style: TextStyle(color: Colors.white70)),
                Text(item["type"], style: TextStyle(color: Colors.white70)),
                SizedBox(height: 16),
              ],
            ),
          ],
        );
      },
    );
  }

  getMovieList() async {
    debugPrint('获取电影数据...${widget._type}');
    var url = 'http://192.168.0.12:8080/movie/${widget._type}';
    var response = await get(url);
    debugPrint("result: " + response.statusCode.toString() + response.body);

    setState(() {
      result = response.body;
      mList = jsonDecode(response.body)['subjects'];
    });
  }
}
