import 'package:http/http.dart' as http;
import 'package:le_monde_in_rss/models/rss_item_wrapper.dart';
import 'package:webfeed/webfeed.dart';

const RSS_PATH = 'https://www.lemonde.fr/rss/une.xml';

Future<Iterable<RssItemWrapper>> loadRssForUneOfLeMonde() async {
  final client = http.Client();
  final response = await client.get(RSS_PATH);
  RssFeed channel;

  if (response.statusCode == 200) {
    channel = RssFeed.parse(response.body);
  } else {
    print('Error: Status code = ${response.statusCode}');
  }

  client.close();

  // Abstract layer
  final items = channel.items.map((e) =>
      RssItemWrapper(
          e.title,
          e.pubDate,
          e.description,
          e.link,
          e.media.contents.first.url));

  return items;
}