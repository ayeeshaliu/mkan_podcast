import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mkan_podcast/screens/podcastTabSreen.dart';
import 'package:mkan_podcast/screens/tabs_Screen.dart';
import 'package:mkan_podcast/widgets/Podcast_item.dart';

void main() => runApp(const MkanPodcast());


class MkanPodcast extends StatefulWidget {
  const MkanPodcast({Key? key}) : super(key: key);

  @override
  State<MkanPodcast> createState() => _MkanPodcastState();
}

class _MkanPodcastState extends State<MkanPodcast> {

  List playArray = [];

  loadStreams() async {
    Dio dio = Dio();
    Response response;
    try {
      response = await dio
          .get("https://mkan-media.herokuapp.com/v1/audio/stream-auth");
      // log(response.toString());
      if (response.data['success']) {

        print(response.data);
        // List playArray = response.data["data"];
        // for (int i = 0; i < playArray.length; i++) {
        //   setState(() {
        //     // titleArray.add(playArray[i]['title']);
        //     // durationArray.add(playArray[i]['duration']);
        //     // nameArray.add(playArray[i]["user"]['full_name']);
        //     // urlArray.add(playArray[i]['uri']);
        //     // countArray.add(playArray[i]['track_count']);
        //     // horizontalArray.add(Listening(
        //     //   title: playArray[i]["title"],
        //     //   author: playArray[i]["user"]["full_name"],
        //     //   duration: getDuration(playArray[i]['duration']),
        //     //   color: i.isOdd
        //     //       ? Color.fromRGBO(170, 247, 214, 1)
        //     //       : Color.fromRGBO(252, 217, 255, 1),
        //     //
        //     //   icon: Icon(Icons.play_circle_outline_rounded),
        //     //   colors: i.isOdd
        //     //       ? Color.fromRGBO(2, 209, 112, 1)
        //     //       : Color.fromRGBO(238, 51, 255, 1),
        //     //   trackCount: playArray[i]['track_count'],
        //     //   url: playArray[i]['uri'],
        //     //   id: playArray[i]["id"],
        //     // ));
        //   });
        // }
        //
        // // log(titleArray.toString());
        // // log(durationArray.toString());
        // // log(nameArray.toString());
        // // log(urlArray.toString());
        // // log(countArray.toString());
      }
    } on DioError catch (e) {
      log(e.message.toString());
      log(e.response.toString());
    }

  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      localizationsDelegates: [
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          textStyle: TextStyle(
            color: Colors.black,
            fontFamily: "ProductSans",


          ),
        ),
       //barBackgroundColor: Color.fromRGBO(3, 173, 95, 1)


      ),
      home:  TabsScreen(),
      routes: {
        "/podcasts" : (ctx) => PodcastTab(),
        //"/podcast_item" : (ctx) => PodCastItem(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


