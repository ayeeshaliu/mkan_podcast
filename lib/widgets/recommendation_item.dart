import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:line_icons/line_icons.dart';

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
    return Container(
      // width: MediaQuery.of(context).size.width * 1 ,
      // height: MediaQuery.of(context).size.height *0.13,
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height *0.13,
            child: Row(
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
                        Text(title, overflow: TextOverflow.ellipsis,),

                        SizedBox(width: 15,),
                        Text(author),
                      ],
                    ),
                    Icon(LineIcons.horizontalEllipsis, color: Colors.black87, size: 25.0,),


                  ],


                ),
              ],
            ),
          ),
          SizedBox(height: 13.2,),
        ],
      ),
    );
  }
}
