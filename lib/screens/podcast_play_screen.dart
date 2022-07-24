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
              padding: EdgeInsets.only(top: MediaQuery.of(context).viewInsets.top + 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(3, 180, 97, 1),
                      borderRadius: BorderRadius.circular(16.2),
                    ),
                    height: 230,
                    width: 230,
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SvgPicture.asset("assets/vectors/circles.svg",color: color,),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
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
        height: 10,
      ),

      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              child: Center(
                child: Text(title, maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),),
              ),
            ),
          ),
        ],
      ),

      SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(author, style: TextStyle(
            fontSize: 18,
          ),),
        ],
      ),
      SizedBox(
        height: 20,
      ),

      Container(
        child: InkWell(child: SvgPicture.asset("assets/vectors/slider.svg"),
          onTap: (){},
        ),
      ),
      SizedBox(
        height: 20,
      ),

      Padding(
        padding:  EdgeInsets.only(left: MediaQuery.of(context).viewInsets.left  + 20, right: MediaQuery.of(context).viewInsets.right + 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset("assets/vectors/shuffle.svg"),
            SvgPicture.asset("assets/vectors/speaker.svg"),
          ],
        ),
      ),

      SizedBox(
        height: 20,
      ),

      Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).viewInsets.horizontal + 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.fast_rewind, size: 40, color: Colors.black,),
            Icon(Icons.pause, size: 60, color: Colors.black,),
            Icon(Icons.fast_forward, size: 40, color: Colors.black,),
          ],
        ),
      ),

      SizedBox(
        height: 15,
      ),

      Container(
        height: 94,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromRGBO(3, 180, 97, 0.08),
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).viewInsets.horizontal + 60, vertical: MediaQuery.of(context).viewInsets.vertical + 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Icon(LineIcons.download, size: 30, color: Colors.black,),
                  Text("Download"),
                ],
              ),
              Column(
                children: [
                  Icon(LineIcons.share, size: 30, color: Colors.black,),
                  Text("Share"),
                ],
              ),
            ],
          ),
        ),

      ),





     ],
    ),
      ),
    ),
      ),
    );
  }
}
