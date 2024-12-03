import 'dart:io';

import 'package:http/io_client.dart';
import 'package:webfeed/webfeed.dart';

const url = 'https://feeds.fireside.fm/lushu/rss';
void main() async {
  final client = IOClient(HttpClient()
    ..badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true));

  // // RSS feed
  // var response = await client.get(
  //     Uri.parse('https://developer.apple.com/news/releases/rss/releases.rss'));
  // var channel = RssFeed.parse(response.body);
  // print(channel);

  // // Atom feed
  // response =
  //     await client.get(Uri.parse('https://www.theverge.com/rss/index.xml'));
  // var feed = AtomFeed.parse(response.body);
  // print(feed);

  // Podcast feed
  var response = await client.get(Uri.parse(url));
  var channel = RssFeed.parse(response.body);
  print(channel.author);
  // print(channel.podcastFunding.first.info);
  // print(channel.items.first.podcastTranscript.first.url);
  // print(channel.items.first.podcastChapters.url);
  // print(channel.podcastLocation);
  // print(channel.podcastPerson);
  client.close();
}
