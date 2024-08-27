import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


// class URL extends StatelessWidget {
//   const URL({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Material(
//         child: Center(
//           child: ElevatedButton(
//             onPressed: _launchUrl,
//             child: Text('Show Flutter homepage'),
//           ),
//         ),
//       ),
//     );
//   }
//   Future<void> _launchUrl() async {
//     if (!await launchUrl(_url)) {
//       throw Exception('Could not launch $_url');
//     }
//   }
// }

class LauncherWidget extends StatefulWidget {
  const LauncherWidget({super.key, required this.url,});
  final Uri url;

  @override
  State<LauncherWidget> createState() => _LauncherWidgetState();
}

class _LauncherWidgetState extends State<LauncherWidget> {

  @override
  Future<void> initState() async {
    super.initState();
    if (!await launchUrl(widget.url)) {
    throw Exception('Could not launch ${widget.url}');
    }
  }

  // final Uri _url = Uri.parse('https://origami-system.obs.ap-southeast-2.myhuaweicloud.com:443/uploads/need/5/12929/shsb4k835d797e01.pdf?AWSAccessKeyId=XQQASUZBT0FWUE8ZREM3&Expires=1723099105&Signature=OgzbB%2BXyrUVIbh2GCeYNGxrUOss%3D');
  Future<void> _launchUrl() async {
    if (!await launchUrl(widget.url)) {
      throw Exception('Could not launch ${widget.url}');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  // Future<void> _launchURL(String url) async {
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

}