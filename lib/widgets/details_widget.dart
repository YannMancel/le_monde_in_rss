import 'package:flutter/material.dart';
import 'package:le_monde_in_rss/models/rss_item_wrapper.dart';

/// A home widget which extends to {StatelessWidget}.
class Details extends StatelessWidget {
  // FIELDS --------------------------------------------------------------------
  final String title;
  final RssItemWrapper item;

  // CONSTRUCTOR ---------------------------------------------------------------
  Details({Key key, this.title, this.item}) : super(key: key);

  // METHODS -------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverAppBar(
          floating: true,
          pinned: false,
          expandedHeight: 200.0,
          flexibleSpace: FlexibleSpaceBar(
              title: Text(title),
              // background: Image.network(item.urlImage, fit: BoxFit.cover),
              background: Stack(fit: StackFit.expand, children: [
                Image.network(item.urlImage, fit: BoxFit.cover),
                Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withAlpha(0),
                              Colors.black.withAlpha(0),
                              Colors.black45,
                              Colors.black87
                            ])))
              ]))),
      SliverToBoxAdapter(
          child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(16.0),
              child: Column(children: [
                Text(item.title, style: Theme.of(context).textTheme.headline5),
                _getPadding(16.0),
                Text(item.pubDate.toString(), style: Theme.of(context).textTheme.subtitle1),
                _getPadding(16.0),
                Text(item.description, style: Theme.of(context).textTheme.headline5),
                _getPadding(16.0),
                RichText(
                    text: TextSpan(
                        text: 'Link: ',
                        style: Theme.of(context).textTheme.headline5,
                        children: <TextSpan>[
                          TextSpan(
                              text: item.link,
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold))
                        ]))
              ])))
    ]);
  }

  // -- UI --

  Widget _getPadding(double size) {
    return Container(padding: EdgeInsets.all(size));
  }
}