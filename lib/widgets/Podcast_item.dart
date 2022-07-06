import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mkan_podcast/screens/podcast_list_screen.dart';

class PodcastItem extends StatelessWidget {
  final Icon icon;
  final String duration;
  final String title;
  final String author;
  final Color color;
  final Color colors;


  const PodcastItem(  this.icon,
     this.duration,
     this.title,
     this.author,
     this.color,
      this.colors,
  );
  void podcastSelector (BuildContext ctx) {
    Navigator.of(ctx).push(CupertinoPageRoute(builder: (_){
      return PodcastListScreen(this.color, this.title, this.author);
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
              width: 294.08,
              height: 178.29,
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Text(title),
                  SizedBox(height: 10,),
                  Text(author),
                  SizedBox(height: 35,),
                  Row(
                    children: [
                      Icon(Icons.play_circle_outline_rounded, color: colors,),
                      Text(duration),
                    ],
                  ),
                ],
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors:[ color.withOpacity(0.7),
                    color,
                  ]
                ),
                color: color,
                borderRadius: BorderRadius.circular(20),

                ),
              ),
          ),
        ),
        SizedBox(width: 16,),
      ],
    );
  }
}
