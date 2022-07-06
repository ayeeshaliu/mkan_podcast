import 'package:flutter/cupertino.dart';
import 'package:mkan_podcast/data/Mkan_data.dart';
import 'package:mkan_podcast/widgets/Podcast_item.dart';
import 'package:mkan_podcast/widgets/recommendation_item.dart';

class PodcastTab extends StatefulWidget {
  const PodcastTab({Key? key}) : super(key: key);

  @override
  State<PodcastTab> createState() => _PodcastTabState();
}

class _PodcastTabState extends State<PodcastTab> {
  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.width;
    return CupertinoPageScaffold(
        child: SafeArea(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                child: Text("Podcast",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                      //fontFamily: "ProductSans",
                  ),) ,),
              const Padding(padding: EdgeInsets.symmetric(vertical: 0, horizontal: 24, )),
              Container(
                width: 390,
                //height: 70,
                padding: const EdgeInsets.only(left: 24),
                alignment: Alignment.center,
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
              Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15, horizontal: 24),
                child: SizedBox(
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
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 0, horizontal: 24),
                child: Text("Recommended",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    //fontFamily: "ProductSans",
                  ),) ,),

              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 15, horizontal: 24),
                child: SizedBox(
                  height: 392,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: RECOMMENDATION_LIST.map((mend)
                    => RecommendationItem(
                      mend.icon,
                      mend.duration,
                      mend.title,
                      mend.author,
                      mend.color,
                      mend.colors
                    ),
                    ).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
        );
  }
}
