import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mkan_podcast/data/Mkan_data.dart';
import 'package:mkan_podcast/widgets/recommendation_item.dart';


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
    return CupertinoPageScaffold(
      child: Material(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

          Padding(padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                child: Row(
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
            icon: Icon(Icons.all_inclusive),),
                  ],
                ),
              ),
              //SizedBox(height: 30,),
              Padding(padding: EdgeInsets.symmetric(vertical: 16, horizontal: 30),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(3, 180, 97, 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      height: 110,
                      width: 110,

                    ),
                    SizedBox(width: 32,),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(bottom: 15),
                            child: Text("The Joe\nExperience at...",

                              style: TextStyle(
                                fontSize: 28,
                                    fontWeight: FontWeight.w700
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 5),
                            child: Text(author,
                            textAlign: TextAlign.start,
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.all_inclusive, size: 27,color: Color.fromRGBO(3, 180, 97, 1),),
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
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 50),
                child: Text("Episodes",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),

                ),
              ),

              Container(
                height: 392,
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
