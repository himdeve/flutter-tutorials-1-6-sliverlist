import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({Key key}) : super(key: key);

  static const List<Tuple2> tutorials = [
    const Tuple2<String, String>(
      'http://himdeve.com/wp-content/uploads/2020/01/1_1_simple_webview_en_banner.jpg',
      'Flutter Tutorials – #1.1 – First App – Simple WebView',
    ),
    const Tuple2<String, String>(
      'https://himdeve.com/wp-content/uploads/2020/01/1_2_webview_controller_en_banner.jpg',
      'Flutter Tutorials – #1.2 – WebView Controller – Completer, Future Builder, Await – Async',
    ),
    const Tuple2<String, String>(
      'https://himdeve.com/wp-content/uploads/2020/01/1_3_webview_javascript_en_banner.jpg',
      'Flutter Tutorial – #1.3 – WebView – Navigation Controls, Javascript communication',
    ),
    const Tuple2<String, String>(
      'https://himdeve.com/wp-content/uploads/2020/01/1_4_drawer_en_banner_final.jpg',
      'Flutter Tutorials – #1.4 – DRAWER – PageRoute, Navigator, UserAccountsDrawerHeader',
    ),
    const Tuple2<String, String>(
      'https://himdeve.com/wp-content/uploads/2020/02/1_5_sliverappbar_banner_en.jpg',
      'Flutter Tutorials – #1.5 – Sliver App Bar = Collapsing Toolbar',
    ),
    const Tuple2<String, String>(
      'https://himdeve.com/wp-content/uploads/2020/02/1_6_sliverlist_banner_en.jpg',
      'Flutter Tutorials – #1.6 – SliverList',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            backgroundColor: Colors.red,
            expandedHeight: 200,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Portfolio',
                style: TextStyle(color: Colors.black),
              ),
              background: Image.network(
                'https://himdeve.eu/wp-content/uploads/2015/05/himdeve_labrador_with_cute_woman_model.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 110,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return _buildListItem(tutorials[index]);
              },
              childCount: tutorials.length,
            ),
          ),
          // SliverList(
          //   delegate: SliverChildListDelegate(
          //     [
          //       for (var i = 0; i < 100; i++)
          //         ListTile(
          //           title: Text(i.toString()),
          //         ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }

  Card _buildListItem(Tuple2 tutorial) {
    return Card(
      margin: const EdgeInsets.all(5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image(
            image: NetworkImage(tutorial.item1, scale: 12),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, bottom: 10, top: 0),
              child: Text(
                tutorial.item2,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
