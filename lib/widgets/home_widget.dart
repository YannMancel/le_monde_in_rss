import 'package:flutter/material.dart';
import 'package:le_monde_in_rss/helpers/rss_helper.dart';
import 'package:le_monde_in_rss/models/rss_item_wrapper.dart';
import 'package:le_monde_in_rss/widgets/details_widget.dart';

/// A home widget which extends to {StatelessWidget}.
class Home extends StatefulWidget {
  final String title;

  Home({Key key, this.title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

/// A home State which extends to {State<Home>}.
class _HomeState extends State<Home> {
  // FIELDS --------------------------------------------------------------------
  List<RssItemWrapper> _items;

  // METHODS -------------------------------------------------------------------
  @override
  void initState() {
    super.initState();
    _getDataFromRss();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title), actions: [
          IconButton(icon: Icon(Icons.autorenew), onPressed: _getDataFromRss)
        ]),
        body: (_items != null) ? _getListView() : null);
  }

  // -- UI --

  Widget _getListView() {
    return ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, i) {
          return Container(
              height: 200.0,
              margin: EdgeInsets.only(left: 4.0, top: 4.0, right: 4.0),
              child: Card(
                  elevation: 6.0,
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                      onTap: () => _navigateToDetails(_items[i]),
                      child: Stack(fit: StackFit.expand, children: [
                        Image.network(_items[i].urlImage, fit: BoxFit.cover),
                        Container(
                            alignment: Alignment.bottomCenter,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.black.withAlpha(0),
                                      Colors.black.withAlpha(0),
                                      Colors.black45,
                                      Colors.black87
                                    ])),
                            child: Container(
                                padding: EdgeInsets.only(
                                    left: 4.0, right: 4.0, bottom: 4.0),
                                child: Text(_items[i].title,
                                    style: TextStyle(color: Colors.white))))
                      ]))));
        });
  }

  // -- RSS --

  Future<Null> _getDataFromRss() async {
    final items = await loadRssForUneOfLeMonde();
    if (items != null) setState(() => _items = items.toList());
  }

  // -- Navigation --

  void _navigateToDetails(RssItemWrapper item) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext buildContext) =>
                Details(title: "Article", item: item)));
  }
}