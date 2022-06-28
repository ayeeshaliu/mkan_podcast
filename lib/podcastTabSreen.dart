import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mkan_podcast/Mkan_data.dart';
import 'package:mkan_podcast/Podcast_item.dart';
import 'package:mkan_podcast/recommendation_item.dart';

class PodcastTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: SafeArea(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                child: Text("Podcast",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                      //fontFamily: "ProductSans",
                  ),) ,),
              Padding(padding: EdgeInsets.symmetric(vertical: 0, horizontal: 24, )),
              Container(
                width: 390,
                //height: 70,
                padding: EdgeInsets.only(left: 24),
                alignment: Alignment.center,
                child: CupertinoTextField(
                  cursorColor: Color(0xFF98D9BB),
                  prefix: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(CupertinoIcons.search, color: Color(0xFF7D8C85),),
                  ) ,
                  suffix: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(CupertinoIcons.mic, color: Color(0xFF7D8C85) ,),
                  ),
                  placeholder: "All podcast",
                    style: TextStyle(
                      color: Color(0xFF7D8C85),
                    ),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color(0xFF98D9BB),
                    ),
                    //color: Color(0xFF98D9BB),

                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 15, horizontal: 24),
                child: Container(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: LISTENING_LIST.map((pod)
                    => PodcastItem(
                        pod.icon,
                        pod.duration,
                        pod.title,
                        pod.author,
                        pod.color,
                      pod.colors

                    ),
                    ).toList(),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 0, horizontal: 24),
                child: Text("Recommended",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    //fontFamily: "ProductSans",
                  ),) ,),

              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 15, horizontal: 24),
                child: Container(
                  height: 392,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: RECOMMENDATION_LIST.map((mend)
                    => RecommendationItem(
                      mend.icon,
                      mend.duration,
                      mend.title,
                      mend.author,
                      mend.color,
                      mend.colors
                    ),
                    ).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
        );
  }
}
