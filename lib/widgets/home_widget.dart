import 'package:flutter/material.dart';
import 'package:le_monde_in_rss/helpers/rss_helper.dart';
import 'package:le_monde_in_rss/models/rss_item_wrapper.dart';

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
        appBar: AppBar(
            title: Text(widget.title),
            actions: [
              IconButton(
                  icon: Icon(Icons.autorenew),
                  onPressed: _getDataFromRss)
            ]),
        body: Container());
  }

  Future<Null> _getDataFromRss() async {
    final items = await loadRssForUneOfLeMonde();
    if (items != null) setState(() => _items = items.toList());
  }
}
