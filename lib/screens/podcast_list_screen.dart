import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mkan_podcast/data/Mkan_data.dart';
import 'package:mkan_podcast/widgets/recommendation_item.dart';
import 'package:line_icons/line_icons.dart';


class PodcastListScreen extends StatelessWidget {
  final Color color;
  final String title;
  final String author;

  const PodcastListScreen(
      this.color,
      this.title,
      this.author,
      );
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.45,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

          Row(
            //crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                iconSize: 30,
                color: Colors.black,
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(Icons.arrow_back),),

      IconButton(
          iconSize: 30,
            color: Colors.black,
            onPressed: (){},
            icon: Icon(LineIcons.horizontalEllipsis),),
            ],
          ),
              //SizedBox(height: 30,),
              Padding(padding: EdgeInsets.symmetric(vertical: 16, horizontal: 30),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(3, 180, 97, 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        height: 110,
                        width: 110,

                      ),
                    ),
                    SizedBox(width: 32,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 15),
                          child: Text("The Joe Experience at",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,

                            style: TextStyle(
                              fontSize: 28,
                                  fontWeight: FontWeight.w700
                            ),
                          ),
                        ),
                        Text(author,
                        textAlign: TextAlign.start,
                        ),

                        Container(
                          padding: EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  IconButton(onPressed: (){}, icon: Icon(LineIcons.soundcloud, size: 27,color: Color.fromRGBO(3, 180, 97, 1),),
                                  ),
                                  Text("10 Episodes"),
                                ],
                              ),
                              Column(
                                children: [
                                  IconButton(onPressed: (){}, icon: Icon(Icons.share_outlined,size: 27, color: Color.fromRGBO(3, 180, 97, 1),),
                                  ),
                                  Text("Shares"),
                                ],
                              ),
                              Column(
                                children: [
                                  IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border_outlined, size:27,color: Color.fromRGBO(3, 180, 97, 1),),
                                  ),
                                  Text("Favourites"),
                                ],
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
              ),

              Text("Episodes",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),

              ),

              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: RECOMMENDATION_LIST.map((epsd) => RecommendationItem(
                      epsd.icon,
                      epsd.duration,
                      epsd.title,
                      epsd.author,
                      epsd.color,
                      epsd.colors
                  )).toList(),

                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
