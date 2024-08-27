import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pod_player/pod_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class YouTubeScreen2 extends StatefulWidget {
  final String? videoLink;

  YouTubeScreen2({this.videoLink});

  @override
  _YouTubeScreen2State createState() => _YouTubeScreen2State();
}

class _YouTubeScreen2State extends State<YouTubeScreen2> {
  late YoutubePlayerController _controller;
  late String _currentTime;
  Duration? stoppedAt; // เก็บเวลาที่หยุดเล่น
  int stopped = 0;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'KpDQhbYzf4Y',
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    )..addListener(() {
      if (!_controller.value.isPlaying) {
        // ดึงเวลาที่หยุดเล่น
        stoppedAt = _controller.value.position;
        print('Video stopped at: ${stoppedAt?.inSeconds} seconds');
        stopped = stoppedAt?.inSeconds ?? 0;
      }
    });

    // Initialize current time
    _currentTime = _getCurrentTime();

    // Update time every second
    Timer.periodic(Duration(seconds: 1), (Timer t) => _updateTime());
  }
  String _getCurrentTime() {
    final DateTime now = DateTime.now();
    return DateFormat('HH:mm:ss').format(now); // เวลาในรูปแบบ HH:mm:ss
  }

  void _updateTime() {
    setState(() {
      _currentTime = _getCurrentTime();
    });
  }

  void playFromStoppedPosition() {
    if (stoppedAt != null) {
      _controller.seekTo(stoppedAt!);
      _controller.play();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YouTube Player Example'),
        actions: [
          IconButton(
            icon: Icon(Icons.play_arrow),
            onPressed: playFromStoppedPosition,
          ),
        ],
      ),
      body: Column(
        children: [
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            bottomActions: <Widget>[
              const SizedBox(width: 14.0),
              CurrentPosition(),
              const SizedBox(width: 8.0),
              ProgressBar(isExpanded: true),
              RemainingDuration(),
            ],
            aspectRatio: 4 / 3,
            progressIndicatorColor: Colors.white,
            progressColors: ProgressBarColors(
              playedColor: Colors.amber,
              handleColor: Colors.amberAccent,
            ),
            onReady: () {
              print('Player is ready.');
            },
          ),
          // SizedBox(height: 20),
          // Text(
          //   'Current Time: $_currentTime',
          //   style: TextStyle(fontSize: 24),
          // ),
        ],
      ),
    );
  }
}