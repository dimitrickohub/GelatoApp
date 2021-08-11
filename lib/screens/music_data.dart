import 'package:flutter/material.dart';
import 'package:flutter_application_2/theme/colors.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicData extends StatefulWidget {
  final String title;
  final String description;
  final Color color;
  final String img;
  final String songUrl;

  const MusicData(
      {Key key,
      this.title,
      this.description,
      this.color,
      this.img,
      this.songUrl})
      : super(key: key);
  @override
  _MusicDataState createState() => _MusicDataState();
}

class _MusicDataState extends State<MusicData> {
  double _currentSliderValue = 0;

  AudioPlayer advancedPlayer;
  AudioCache audioCache;
  bool isPlaying = true;
  @override
  void initState() {
    super.initState();
    initPalyer();
  }

  initPalyer() {
    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);
    playSound(widget.songUrl);
  }

  playSound(remoteUrl) async {
    await advancedPlayer.play(remoteUrl);
  }

  stopSound(remoteUrl) async {
    // Uri audioFile = await audioCache.load(remoteUrl);
    // await advancedPlayer.setUrl(audioFile.path);
    advancedPlayer.pause();
  }

  seekSound() async {
    // Uri audioFile =  await audioCache.load(widget.songUrl);
    // await advancedPlayer.setUrl(audioFile.path);
    advancedPlayer.seek(Duration(milliseconds: 1200));
  }

  @override
  void dispose() {
    super.dispose();
    stopSound(widget.songUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: getAppBar(),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      backgroundColor: black,
      elevation: 0,
      actions: [
        IconButton(
          icon: Icon(
            Feather.more_vertical,
            color: white,
          ),
          onPressed: null,
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
                    boxShadow: [
                      BoxShadow(
                        color: widget.color,
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
                        image: AssetImage(widget.img), fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              width: size.width - 80,
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    AntDesign.addfolder,
                    color: white,
                  ),
                  Column(
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                            fontSize: 18,
                            color: white,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: 150,
                        child: Text(
                          widget.description,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15, color: white.withOpacity(0.5)),
                        ),
                      )
                    ],
                  ),
                  Icon(
                    Feather.more_vertical,
                    color: white,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
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
          // SizedBox(
          //   height: 20,
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 30, right: 30),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Text(
          //         "00:00",
          //         style: TextStyle(color: white.withOpacity(0.5)),
          //       ),
          //       Text(
          //         "45:54",
          //         style: TextStyle(color: white.withOpacity(0.5)),
          //       )
          //     ],
          //   ),
          // ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // IconButton(
                //     icon: Icon(
                //       Feather.shuffle,
                //       color: white.withOpacity(0.8),
                //       size: 25,
                //     ),
                //     onPressed: null),
                IconButton(
                  icon: Icon(
                    Feather.skip_back,
                    color: white.withOpacity(0.8),
                    size: 25,
                  ),
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     PageTransition(
                    //         alignment: Alignment.bottomCenter,
                    //         child: MusicData(),
                    //         type: PageTransitionType.scale));
                  },
                ),
                IconButton(
                    iconSize: 50,
                    icon: Container(
                      decoration:
                          BoxDecoration(shape: BoxShape.circle, color: primary),
                      child: Center(
                        child: Icon(
                          isPlaying
                              ? Entypo.controller_stop
                              : Entypo.controller_play,
                          size: 28,
                          color: white,
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
                    icon: Icon(
                      Feather.skip_forward,
                      color: white.withOpacity(0.8),
                      size: 25,
                    ),
                    onPressed: null),
                // IconButton(
                //     icon: Icon(
                //       AntDesign.retweet,
                //       color: white.withOpacity(0.8),
                //       size: 25,
                //     ),
                //     onPressed: null),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Feather.tv,
                color: primary,
                size: 20,
              ),
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: Text(
                  "Chromecast is ready",
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
