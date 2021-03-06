import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/theme/colors.dart';

import 'package:audioplayers/audioplayers.dart';

class MusicData extends StatefulWidget {
  final String? title;
  final String? description;
  final String? img;
  final String? songUrl;

  const MusicData(
      {Key? key, this.title, this.description, this.img, this.songUrl})
      : super(key: key);
  @override
  _MusicDataState createState() => _MusicDataState();
}

class _MusicDataState extends State<MusicData> {
  double _currentSliderValue = 10;

  AudioPlayer? advancedPlayer;
  AudioCache? audioCache;
  bool isPlaying = true;
  @override
  void initState() {
    super.initState();
    initPalyer();
  }

  initPalyer() {
    advancedPlayer = AudioPlayer();
    audioCache = AudioCache(fixedPlayer: advancedPlayer);
    playSound(widget.songUrl);
  }

  playSound(remoteUrl) async {
    await advancedPlayer?.play(remoteUrl);
  }

  stopSound(remoteUrl) async {
    advancedPlayer?.pause();
  }

  seekSound() async {
    advancedPlayer?.seek(const Duration(milliseconds: 1200));
  }

  @override
  void dispose() {
    super.dispose();
    stopSound(widget.songUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100), child: getAppBar()),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      actions: [
        IconButton(
          icon: const Icon(
            CupertinoIcons.ellipsis_vertical,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 20, top: 20),
                child: Container(
                  width: size.width - 100,
                  height: size.width - 100,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: grey,
                        blurRadius: 50,
                        spreadRadius: 5,
                        offset: Offset(-10, 40),
                      )
                    ],
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 20, top: 20),
                child: Container(
                  width: size.width - 60,
                  height: size.width - 60,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.img.toString()),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: SizedBox(
              width: size.width - 80,
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    CupertinoIcons.folder,
                  ),
                  Column(
                    children: [
                      Text(
                        widget.title.toString(),
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 150,
                        child: Text(
                          widget.description.toString(),
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15, color: grey.withOpacity(0.5)),
                        ),
                      )
                    ],
                  ),
                  const Icon(
                    CupertinoIcons.ellipsis_vertical,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Slider(
              activeColor: primary,
              value: _currentSliderValue,
              min: 0,
              max: 200,
              onChanged: (value) {
                seekSound();
                setState(() {
                  _currentSliderValue = value;
                });
              }),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(
                    CupertinoIcons.back,
                    size: 25,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                    iconSize: 50,
                    icon: Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: primary),
                      child: Center(
                        child: Icon(
                          isPlaying ? CupertinoIcons.stop : CupertinoIcons.play,
                          size: 28,
                        ),
                      ),
                    ),
                    onPressed: () {
                      if (isPlaying) {
                        stopSound(widget.songUrl);
                        setState(() {
                          isPlaying = false;
                        });
                      } else {
                        playSound(widget.songUrl);
                        setState(() {
                          isPlaying = true;
                        });
                      }
                    }),
                IconButton(
                    iconSize: 50,
                    icon: const Icon(
                      CupertinoIcons.forward,
                      size: 25,
                    ),
                    onPressed: () {}),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                CupertinoIcons.tv,
                color: primary,
                size: 20,
              ),
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: EdgeInsets.only(top: 3),
                child: Text(
                  'Chromecast is ready',
                  style: TextStyle(
                    color: primary,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
