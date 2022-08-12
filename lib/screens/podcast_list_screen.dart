import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:line_icons/line_icons.dart';
//import 'package:mkan_podcast/data/Mkan_data.dart';
import 'package:mkan_podcast/screens/podcast_play_screen.dart';
import 'package:mkan_podcast/widgets/recommendation_item.dart';
import 'package:share_plus/share_plus.dart';

import '../Classholder/Recommendation.dart';



class PodcastListScreen extends StatefulWidget {
  final Color color;
  final String title;
  final String author;
  final int trackCount;
  final String url;
  final int id;
  final Color colors;

  const PodcastListScreen(
      this.color, this.title, this.author, this.trackCount, this.url, this.id, this.colors);

  @override
  State<PodcastListScreen> createState() => _PodcastListScreenState();
}

class _PodcastListScreenState extends State<PodcastListScreen> {

  List verticalArray = [];
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

  loadTracks() async {
    Dio dio = Dio();
    Response response;
    try {
      response = await dio
          .get("https://mkan-media.herokuapp.com/v1/audio/tracks?playlistId=${widget.id}");
      // log(response.toString());
      if (response.data['success']) {
        List recommendArray = response.data["data"];
        for (int i = 0; i < recommendArray.length; i++) {
          setState(() {
            // titleArray.add(recommendArray[i]['title']);
            // durationArray.add(recommendArray[i]['duration']);
            // nameArray.add(recommendArray[i]["user"]['full_name']);
            // urlArray.add(recommendArray[i]['uri']);
            // countArray.add(recommendArray[i]['track_count']);
            verticalArray.add(Recommendation(
                title: recommendArray[i]["title"],
                author: recommendArray[i]["user"]["full_name"],
                duration: getDuration(recommendArray[i]['duration']),
                color: i.isOdd
                    ? Color.fromRGBO(170, 247, 214, 1)
                    : Color.fromRGBO(252, 217, 255, 1),
                icon: Icon(Icons.play_circle_outline_rounded),
                colors: i.isOdd
                    ? Color.fromRGBO(2, 209, 112, 1)
                    : Color.fromRGBO(238, 51, 255, 1),
                url: recommendArray[i]['uri'],
              id: recommendArray[i]["id"],
              trackTitle: recommendArray[i]["title"],
              permalinkUri: recommendArray[i]["permalink_url"],
              artworkUrl: recommendArray[i]["artwork_url"],
              streamUrl: recommendArray[i]["stream_url"],




            ),
            );
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
  void playSelector(BuildContext ctx) {
    Navigator.of(ctx).push(CupertinoPageRoute(builder: (_) {
      return PodcastPlay(widget.color, widget.title, widget.author, widget.colors, widget.url,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CupertinoPageScaffold(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      iconSize: 30,
                      color: Colors.black,
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(Icons.arrow_back),
                    ),
                    IconButton(
                      iconSize: 30,
                      color: Colors.black,
                      onPressed: () {},
                      icon: Icon(
                        LineIcons.horizontalEllipsis,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                //SizedBox(height: 30,),
                Column(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).viewInsets.top + 25),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(3, 180, 97, 1),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                height: 110,
                                width: 110,
                                child: Container(
                                  child: Stack(
                                    children: [
                                      SvgPicture.asset(
                                          "assets/vectors/circles.svg",
                                          color: widget.color),
                                      SvgPicture.asset("assets/vectors/mic.svg",
                                          color: widget.color),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 150,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: MediaQuery.of(context)
                                                .viewInsets
                                                .top +
                                            20,
                                        left: MediaQuery.of(context)
                                                .viewInsets
                                                .left +
                                            15),
                                    child: Text(
                                      widget.title,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              widget.author,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  LineIcons.soundcloud,
                                  size: 27,
                                  color: Color.fromRGBO(3, 180, 97, 1),
                                ),
                              ),
                              Text("${widget.trackCount.toString()} Episodes"),
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Share.share(widget.url);
                                },
                                icon: Icon(
                                  Icons.share_outlined,
                                  size: 27,
                                  color: Color.fromRGBO(3, 180, 97, 1),
                                ),
                              ),
                              Text("Shares"),
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite_border_outlined,
                                  size: 27,
                                  color: Color.fromRGBO(3, 180, 97, 1),
                                ),
                              ),
                              Text("Favourites"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).viewInsets.top + 25,
                      bottom: MediaQuery.of(context).viewInsets.bottom + 10),
                  child: Container(
                    child: Text(
                      "Episodes",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),

               isLoading? Text("Loading...") :Expanded(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.65,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: verticalArray
                          .map(
                            (epsd) => InkWell(
                              child: RecommendationItem(
                                  epsd.icon,
                                  epsd.duration,
                                  epsd.title,
                                  epsd.author,
                                  epsd.color,
                                  epsd.colors,
                                epsd.url,
                                epsd.id,
                                epsd.trackTitle,
                                epsd.permalinkUri,
                                epsd.artworkUrl,
                                epsd.streamUrl,
                              ),
                              onTap: () => playSelector(context),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadTracks();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
