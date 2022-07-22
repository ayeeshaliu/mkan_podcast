import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:line_icons/line_icons.dart';

class PodcastPlay extends StatelessWidget {

  final Color color;
   final String title;
   final String author;

  const PodcastPlay(
      this.color,
       this.title,
      this.author,
      );
  //const PodcastPlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CupertinoPageScaffold(
        child: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
    icon: Icon(Icons.favorite_border, size: 30, color: Colors.black,),),
    ],
    ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
              Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).viewInsets.top + 25),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(3, 180, 97, 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    height: 230,
                    width: 230,
                    child: Stack(
                      children: [
                        Column(
                          //mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              //mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                FittedBox(child: SvgPicture.asset("assets/vectors/circles.svg",color: color,),
                                fit: BoxFit.fill,),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SvgPicture.asset("assets/vectors/mic.svg",color: color),
                              ],
                            ),
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
        ],
      ),
      SizedBox(
        height: 20,
      ),

      Text(title, style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),),

      SizedBox(
        height: 10,
      ),
      Text(author, style: TextStyle(
        fontSize: 18,
      ),),

     ],
    ),
      ),
    ),
      ),
    );
  }
}
