import 'package:flutter/material.dart';

class MoviePage extends StatefulWidget {
  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  int _currentIndex = 0;
  List pages = [
    Text('page1'),
    Text('page2'),
    Text('page3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('电影列表'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: null)
        ],
      ),
      drawer: Drawer(
        // 此处可以用ListView 不过状态栏没有颜色, 需要额外处理
        // 问题原因: ListView默认有全局的padding
        // 解决方法: 给个0的内边距
//        child: ListView(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("江心才子"),
              accountEmail: Text("270628297@qq.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://qlogo2.store.qq.com/qzone/270628297/270628297/100?1514517361',
                ),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('imgs/banner1.jpg'),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            ListTile(title: Text('用户反馈'), trailing: Icon(Icons.feedback)),
            ListTile(title: Text('系统设置'), trailing: Icon(Icons.settings)),
            ListTile(title: Text('我要发布'), trailing: Icon(Icons.send)),
            Divider(),
            ListTile(title: Text('注销'), trailing: Icon(Icons.exit_to_app)),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: (i) {
          setState(() {
            _currentIndex = i;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_filter),
            title: Text('正在热映'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_creation),
            title: Text('即将上映'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_movies),
            title: Text('Top250'),
          ),
        ],
      ),
      body: pages[_currentIndex],
    );
  }
}
