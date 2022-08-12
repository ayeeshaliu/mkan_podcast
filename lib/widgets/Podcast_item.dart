import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mkan_podcast/screens/podcast_list_screen.dart';

class PodcastItem extends StatelessWidget {
  final Icon icon;
  final String duration;
  final String title;
  final String author;
  final String url;
  final Color color;
  final Color colors;
  final int trackCount;
  final int id;

  const PodcastItem(
    this.icon,
    this.duration,
    this.title,
    this.author,
    this.url,
    this.color,
    this.colors,
    this.trackCount,
      this.id,
  );

  void podcastSelector(BuildContext ctx) {
    Navigator.of(ctx).push(CupertinoPageRoute(builder: (_) {
      return PodcastListScreen(
          this.color, this.title, this.author, this.trackCount, this.url, this.id, this.colors);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Material(
          child: InkWell(
            onTap: () => podcastSelector(context),
            splashColor: colors,
            borderRadius: BorderRadius.circular(15),
            child: Container(
              width: 295,
              height: 179,
              // padding: const EdgeInsets.all(15),
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SvgPicture.asset(
                        "assets/vectors/circles.svg",
                        color: colors,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SvgPicture.asset("assets/vectors/mic.svg",
                              color: colors),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).viewInsets.vertical + 10, horizontal: MediaQuery.of(context).viewInsets.horizontal + 15),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                child: Text(title,
                                overflow: TextOverflow.visible,
                                style: TextStyle(
                                  fontFamily: "SourceSansPro",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),),
                                width: 200,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(author,
                              style: TextStyle(
                                fontFamily: "SourceSansPro",
                                fontSize: 13,
                                fontWeight: FontWeight.w400
                              ),),
                            ],
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: MediaQuery.of(context).viewInsets.vertical + 20),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.play_circle_outline_rounded,
                                  color: colors,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: MediaQuery.of(context).viewInsets.left + 5),
                                  child: Text(duration,
                                  style: TextStyle(
                                    fontFamily: "SourceSandPro",
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                    color: colors,
                                  ),),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  color.withOpacity(0.7),
                  color,
                ]),
                color: color,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 16,
        ),
      ],
    );
  }
}
