import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mkan_podcast/podcastTabSreen.dart';
import 'package:mkan_podcast/VideosTab.dart';
import 'package:mkan_podcast/SavedTab.dart';
import 'package:mkan_podcast/SettingsTab.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
   List<Widget> _tabs =[
     PodcastTab(),
     VideosTab(),
     SavedTab(),
     SettingsTab(),
   ];
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Color(0xFFFAFFFC),

      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          activeColor: Color.fromRGBO(3, 173, 95, 1),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.podcasts,size: 25,), label: "Podcast"),
            BottomNavigationBarItem(icon: Icon(Icons.videocam_sharp, size: 25, ), label: "Videos"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite, size: 25, ), label: "Saved"),
            BottomNavigationBarItem(icon: Icon(Icons.settings, size: 25, ), label: "Settings"),
          ],
          
        ),
        tabBuilder: (BuildContext context, index) {
          return _tabs[index];
        },
      ),
      

    );

  }
}
