import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Classholder/Listening.dart';
import '../widgets/Podcast_item.dart';

class PodcastScreen extends StatefulWidget {
  const PodcastScreen({Key? key}) : super(key: key);

  @override
  State<PodcastScreen> createState() => _PodcastScreenState();
}

class _PodcastScreenState extends State<PodcastScreen> {
  List horizontalArray = [];
  List<String> titleArray = [];
  List<int> durationArray = [];
  List<String> nameArray = [];
  List<String> urlArray = [];
  List<int> countArray = [];

  bool isLoading = true;

  String getDuration(int duration) {
    String time;
    int durationTime;

    if (duration < 60000) {
      time = 'Sec';
      durationTime = (duration ~/ 6000);
    } else {
      if (duration >= 60000 && duration < 600000) {
        time = 'Min';
        durationTime = (duration ~/ 60000);
      } else {
        time = 'Hrs';
        durationTime = (duration ~/ 600000);
      }
    }
    return durationTime.toString() + ' ' + time;
  }

  loadRecommendations() async {
    Dio dio = Dio();
    Response response;
    try {
      response = await dio
          .get("https://mkan-media.herokuapp.com/v1/audio/recommendations");
      // log(response.toString());
      if (response.data['success']) {
        List playArray = response.data["data"]["playlists"];
        for (int i = 0; i < playArray.length; i++) {
          setState(() {
            titleArray.add(playArray[i]['title']);
            durationArray.add(playArray[i]['duration']);
            nameArray.add(playArray[i]["user"]['full_name']);
            urlArray.add(playArray[i]['uri']);
            countArray.add(playArray[i]['track_count']);
            horizontalArray.add(Listening(
                title: playArray[i]["title"],
                author: playArray[i]["user"]["full_name"],
                duration: getDuration(playArray[i]['duration']),
                color: i.isOdd
                    ? Color.fromRGBO(170, 247, 214, 1)
                    : Color.fromRGBO(252, 217, 255, 1),
                icon: Icon(Icons.play_circle_outline_rounded),
                colors: i.isOdd
                    ? Color.fromRGBO(2, 209, 112, 1)
                    : Color.fromRGBO(238, 51, 255, 1),
                trackCount: playArray[i]['track_count'],
                url: playArray[i]['uri']));
          });
        }

        log(titleArray.toString());
        log(durationArray.toString());
        log(nameArray.toString());
        log(urlArray.toString());
        log(countArray.toString());
      }
    } on DioError catch (e) {
      log(e.message.toString());
      log(e.response.toString());
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).viewInsets.top + 10),
            child: Text(
              "Podcast",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                fontFamily: "SourceSansPro",
              ),
            ),
          ),
          Container(
            // width: MediaQuery.of(context).size.width,
            //height: 70,
            // padding: const EdgeInsets.only(left: 24),
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).viewInsets.top + 15,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 20),
              child: CupertinoTextField(
                cursorColor: const Color(0xFF98D9BB),
                prefix: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    CupertinoIcons.search,
                    color: Color(0xFF7D8C85),
                  ),
                ),
                suffix: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    CupertinoIcons.mic,
                    color: Color(0xFF7D8C85),
                  ),
                ),
                placeholder: "All podcast",
                style: const TextStyle(
                  color: Color(0xFF7D8C85),
                ),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color(0xFF98D9BB),
                  ),
                  //color: Color(0xFF98D9BB),
                ),
              ),
            ),
          ),
          isLoading
              ? Text('Loading...')
              : SizedBox(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: horizontalArray
                        .map(
                          (pod) => PodcastItem(
                              pod.icon,
                              pod.duration,
                              pod.title,
                              pod.author,
                              pod.url,
                              pod.color,
                              pod.colors,
                              pod.trackCount),
                        )
                        .toList(),
                  ),
                ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    loadRecommendations();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
