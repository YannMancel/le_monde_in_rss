import 'package:flutter/material.dart';
import 'package:le_monde_in_rss/models/rss_item_wrapper.dart';

/// A home widget which extends to {StatelessWidget}.
class Details extends StatelessWidget {
  final String title;
  final RssItemWrapper item;

  Details({Key key, this.title, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Container());
  }
}
