import 'package:flutter/cupertino.dart';
import 'package:mkan_podcast/data/Mkan_data.dart';
import 'package:mkan_podcast/screens/pocast_screen.dart';
import 'package:mkan_podcast/screens/recommendations_screen.dart';
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
    return Column(
      children: [
        SizedBox(height: 10,),
        Column(
          children: [
            PodcastScreen(),
            SizedBox(height: 10,),
          ],
        ),
        Expanded(child: RecommendationScreen()),


      ],
    );
  }
}
