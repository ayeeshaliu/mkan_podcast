import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class RecommendationItem extends StatelessWidget {
  final Icon icon;
  final String duration;
  final String title;
  final String author;
  final Color color;
  final Color colors;


  const RecommendationItem(
     this.icon,
     this.duration,
     this.title,
     this.author,
     this.color,
      this.colors

  );
  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 90,
              height: 90,
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Icon(Icons.play_circle_outline_rounded, color: colors, size: 32,),
                  SizedBox(height: 10,),
                  Text(duration),
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
            SizedBox(width: 16,),
            Row(
              children: [
                Column(
                  children: [
                    Text(title),
                    SizedBox(width: 15,),
                    Text(author),
                  ],
                ),
                Icon(Icons.multiple_stop_outlined),


              ],


            ),
          ],
        ),
        SizedBox(height: 13.2,),
      ],
    );
  }
}
