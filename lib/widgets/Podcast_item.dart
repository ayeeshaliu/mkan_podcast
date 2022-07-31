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

  const PodcastItem(
    this.icon,
    this.duration,
    this.title,
    this.author,
    this.url,
    this.color,
    this.colors,
    this.trackCount,
  );

  void podcastSelector(BuildContext ctx) {
    Navigator.of(ctx).push(CupertinoPageRoute(builder: (_) {
      return PodcastListScreen(
          this.color, this.title, this.author, this.trackCount, this.url);
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
                  Column(
                    children: [
                      Text(title),
                      SizedBox(
                        height: 10,
                      ),
                      Text(author),
                      SizedBox(
                        height: 35,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.play_circle_outline_rounded,
                            color: colors,
                          ),
                          Text(duration),
                        ],
                      ),
                    ],
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
