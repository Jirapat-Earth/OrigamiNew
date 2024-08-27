// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlOrigami extends StatefulWidget {
  const UrlOrigami({super.key, required this.onTap, });
  final VoidCallback onTap;

  @override
  State<UrlOrigami> createState() => _UrlOrigamiState();
}

class _UrlOrigamiState extends State<UrlOrigami> {
  Future<void>? _launched;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _launchInAppWithBrowserOptions(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppBrowserView,
      browserConfiguration: const BrowserConfiguration(showTitle: true),
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Uri toLaunch =
    Uri(scheme: 'https', host: 'www.origami.life', path: '/dashboard.php');
    // Uri(scheme: 'https', host: 'www.youtube.com', path: '/watch', queryParameters: {'v': 'NqgcPW8uLuA'});
    return Scaffold(
      appBar: AppBar(
        title: Text('URL Launcher'),
      ),
      body: ElevatedButton(
        onPressed: widget.onTap,
        //     () => setState(() {
        //   _launched = _launchInAppWithBrowserOptions(toLaunch);
        // }),
        child: const Text('Launch in app with title displayed'),
      ),
    );
  }
}