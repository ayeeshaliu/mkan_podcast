 import 'package:flutter/cupertino.dart';

import '../data/Mkan_data.dart';
import '../widgets/Podcast_item.dart';

class PodcastScreen extends StatelessWidget {
  const PodcastScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).viewInsets.top +10),
          child: Text("Podcast",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            //fontFamily: "ProductSans",
          ),),
        ),
      Container(
      // width: MediaQuery.of(context).size.width,
      //height: 70,
      // padding: const EdgeInsets.only(left: 24),
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).viewInsets.top +15, bottom: MediaQuery.of(context).viewInsets.bottom +20),
        child: CupertinoTextField(
        cursorColor: const Color(0xFF98D9BB),
        prefix: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(CupertinoIcons.search, color: Color(0xFF7D8C85),),
        ) ,
        suffix: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(CupertinoIcons.mic, color: Color(0xFF7D8C85) ,),
        ),
        placeholder: "All podcast",
        style: const TextStyle(
        color: Color(0xFF7D8C85),
        ),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
        color: const Color(0xFF98D9BB),
        ),
        //color: Color(0xFF98D9BB),

        ),
        ),
      ),
      ),
      SizedBox(
      height: 200,
      child: ListView(
      scrollDirection: Axis.horizontal,
      children: LISTENING_LIST.map((pod)
      => PodcastItem(
      pod.icon,
      pod.duration,
      pod.title,
      pod.author,
      pod.color,
      pod.colors

      ),
      ).toList(),
      ),
      ),
      ],
      ),
    );
  }
}
