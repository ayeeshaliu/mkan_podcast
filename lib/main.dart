import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mkan_podcast/podcastTabSreen.dart';
import 'package:mkan_podcast/tabs_Screen.dart';
import 'package:mkan_podcast/Podcast_item.dart';

void main() => runApp(const MkanPodcast());


class MkanPodcast extends StatelessWidget {
  const MkanPodcast({Key? key}) : super(key: key);

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


