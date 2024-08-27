import 'dart:convert';

import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;

import 'evaluate_module.dart';

class VideoPlayScreen extends StatefulWidget {
  @override
  _VideoPlayScreenState createState() => _VideoPlayScreenState();
}

class _VideoPlayScreenState extends State<VideoPlayScreen> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  late Duration _pausedDuration; // เก็บเวลาที่หยุดเล่น
  late Future<void> _initializeVideoPlayerFuture;
  bool _isLoading = true;
  Map<String, dynamic>? _videoInfo;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(
        'https://video.origami.life/origami/uploads/video/20150323112645MAH00462.MP4');
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: true,
      // startAt: Duration(minutes: 3),  // เริ่มเล่นวินาทีที่เท่าไหร่
    );
    // ตั้งค่าฟังก์ชันสำหรับหยุดเล่นวิดีโอ
    _setupVideoStopListener();
    _initializeVideoPlayerFuture = _videoPlayerController.initialize();
    // _initializeVideoPlayerFuture = _videoPlayerController.initialize().then((_) {
    //  // _videoPlayerController.seekTo(Duration(minutes: 4)); // เริ่มนาทีที่ 4
    //   _videoPlayerController.seekTo(Duration(seconds: 4)); // เริ่มวินาทีที่ 4
    // });
  }

  // ฟังก์ชันสำหรับหยุดเล่นวิดีโอ
  void _setupVideoStopListener() {
    _videoPlayerController.addListener(() {
      if (_videoPlayerController.value.isPlaying) {
        // ถ้ากำลังเล่นอยู่
        // ทำอะไรก็ตามที่ต้องการเมื่อวิดีโอเริ่มเล่น
        // _videoPlayerController.pause();
      } else {
        // ถ้าหยุดเล่น (หยุดวินาทีที่เท่าไหร่)
        _pausedDuration = _videoPlayerController.value.position;
        print('Paused at: $_pausedDuration');
      }
    });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(null),
                  Text('VIDEO',style: GoogleFonts.openSans(color: Color(0xFF555555),),),
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext dialogContext) {
                          return AlertDialog(
                            elevation: 0,
                            title: Text('Are you sure?',style: GoogleFonts.openSans(color: Color(0xFF555555),),),
                            content: Text('To Finish learning this class.',style: GoogleFonts.openSans(color: Color(0xFF555555),),),
                            actions: <Widget>[
                              TextButton(
                                child: Text('OK',style: GoogleFonts.openSans(color: Color(0xFF555555),),),
                                onPressed: () {
                                  // ถ้าหยุดเล่น (หยุดวินาทีที่เท่าไหร่)
                                  _pausedDuration = _videoPlayerController.value.position;
                                  Navigator.of(dialogContext).pop();
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: Text('Cancel',style: GoogleFonts.openSans(color: Color(0xFF555555),),),
                                onPressed: () {
                                  Navigator.of(dialogContext).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Icon(Icons.close),
                  ),
                ],
              ),
            ),
            body: SafeArea(
              child: Center(
                child: FutureBuilder(
                    future: _initializeVideoPlayerFuture,
                    builder: (context, snapshot) {
                    return Chewie(
                      controller: _chewieController,
                    );
                  }
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
