import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../screens/podcast_play_screen.dart';

class RecommendationItem extends StatefulWidget {
  final Icon icon;
  final String duration;
  final String title;
  final String author;
  final Color color;
  final Color colors;
  //final int trackCount;
  final String url;
  final int id;
  final String trackTitle;
  final String permalinkUri;
  final String artworkUrl;
  final String streamUrl;




  const RecommendationItem(
     this.icon,
     this.duration,
     this.title,
     this.author,
     this.color,
      this.colors,
      //this.trackCount,
      this.url,
      this.id,
      this.trackTitle,
      this.permalinkUri,
      this.artworkUrl,
      this.streamUrl,


  );

  @override
  State<RecommendationItem> createState() => _RecommendationItemState();
}

class _RecommendationItemState extends State<RecommendationItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
            onTap: (){
                Navigator.of(context).push(CupertinoPageRoute(builder: (_) {
                  return PodcastPlay(widget.color, widget.title, widget.author, widget.colors, widget.url,);
                }));

            },
            child: Row(
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
                        child: SvgPicture.asset("assets/vectors/circles.svg",color: widget.colors,
                        ),
                      ),
                    ),
                    Icon(Icons.play_circle_outline_rounded, color: widget.colors, size: 32,),
                    SizedBox(height: 10,),
                    Text(widget.duration,
                    style: TextStyle(
                      fontSize: 11,
                      fontFamily: "SourceSansPro",
                      fontWeight: FontWeight.w400,
                      color: widget.colors,
                    ),),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors:[ widget.color.withOpacity(0.7),
                      widget.color,
                    ]
                ),
                color: widget.color,
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
                              child: Text(widget.title,
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
                        child: Text(widget.author,
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
        )),
        SizedBox(height: 13.2,),
        Divider(),
      ],
    );
  }
}
