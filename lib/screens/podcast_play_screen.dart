import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:line_icons/line_icons.dart';
import 'package:just_audio/just_audio.dart';

class PodcastPlay extends StatelessWidget {

  final Color color;
   final String title;
   final String author;
   final Color colors;
   final String url;

   PodcastPlay(
      this.color,
       this.title,
      this.author,
       this.colors,
       this.url,
      );

  //const PodcastPlay({Key? key}) : super(key: key);

  // final audioPlayer = AudioPlayer();
  // bool isPlaying = false;
  // Duration duration = Duration.zero;
  // Duration position = Duration.zero;
  //
  // String formatTime(Duration duration){
  //   String twoDigits(int n) => n.toString().padLeft(2, "0");
  //   final hours = twoDigits(duration.inHours);
  //   final minutes = twoDigits(duration.inMinutes);
  //   final seconds = twoDigits(duration.inSeconds);
  //
  //   return [
  //     if (duration.inHours > 0) hours,
  //   minutes,
  //   seconds
  //   ].join(":");
  // }




  @override
  Widget build(BuildContext context) {
   // MediaQuery.of(context).size.height;
    return Material(
      child: CupertinoPageScaffold(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).viewInsets.horizontal +15, vertical: MediaQuery.of(context).viewInsets.vertical + 10),
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
                      height: 200,
                      width: 200,
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

      // Container(
      //     child: InkWell(child: SvgPicture.asset("assets/vectors/slider.svg"),
      //       onTap: (){},
      //     ),
      // ),
      // Container(
      //   child: Slider(
      //     activeColor: colors,
      //     inactiveColor: color,
      //     min: 0,
      //     max: duration.inSeconds.toDouble(),
      //     value: position.inSeconds.toDouble(),
      //     onChanged: (value) {},
      //
      //   ),
      // ),

      // Row(
      //   children: [
      //     Text(formatTime(position)),
      //     Text(formatTime(duration - position)),
      //   ],
      // ),
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
             // IconButton(
             //     onPressed: () async {
             //       if (isPlaying) {
             //         await audioPlayer.pause();
             //       } else {
             //         String url =
             //             "https://mkan-media.herokuapp.com/v1/audio/recommendations";
             //         await audioPlayer.play(url);
             //
             //       }
             //     },
             //     icon: Icon( isPlaying? Icons.pause : Icons.play_arrow),),
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
      ),
    );
  }

}
