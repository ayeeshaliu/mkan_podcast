import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecommendationItem extends StatelessWidget {
  final Icon icon;
  final String duration;
  final String title;
  final String author;
  final Color color;
  final Color colors;
  final int trackCount;
  final String url;


  const RecommendationItem(
     this.icon,
     this.duration,
     this.title,
     this.author,
     this.color,
      this.colors,
      this.trackCount,
      this.url,


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
              child: Container(
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: MediaQuery.of(context).viewInsets.left + 15, top: MediaQuery.of(context).viewInsets.top +10 ),
                      child: Container(
                        height: 35,
                        child: SvgPicture.asset("assets/vectors/circles.svg",color: colors,
                        ),
                      ),
                    ),
                    Icon(Icons.play_circle_outline_rounded, color: colors, size: 32,),
                    SizedBox(height: 10,),
                    Text(duration,
                    style: TextStyle(
                      fontSize: 11,
                      fontFamily: "SourceSansPro",
                      fontWeight: FontWeight.w400,
                      color: colors,
                    ),),
                  ],
                ),
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

            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            child: Flexible(
                              child: Text(title,
                                style: TextStyle(
                                  fontFamily: "SourceSansPro",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                                overflow: TextOverflow.clip,),
                            ),
                            width: 150,
                          ),
                        ],
                      ),

                      SizedBox(width: 15,),
                      Padding(
                        padding: EdgeInsets.only(top: MediaQuery.of(context).viewInsets.top + 10, right: MediaQuery.of(context).viewInsets.right + 45 ),
                        child: Text(author,
                        overflow: TextOverflow.visible,

                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          fontFamily: "SourceSansPro",
                          color: Color.fromRGBO(0, 25, 14, 0.5),
                        ),),
                      ),
                    ],
                  ),
                  Icon(LineIcons.horizontalEllipsis, color: Colors.black87, size: 25.0,),


                ],


              ),
            ),
          ],
        ),
        SizedBox(height: 13.2,),
      ],
    );
  }
}
