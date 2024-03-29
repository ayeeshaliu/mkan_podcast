import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mkan_podcast/Classholder/Recommendation.dart';
//import '../data/Mkan_data.dart';
import '../widgets/recommendation_item.dart';

class RecommendationScreen extends StatefulWidget {
  const RecommendationScreen({Key? key}) : super(key: key);

  @override
  State<RecommendationScreen> createState() => _RecommendationScreenState();
}

class _RecommendationScreenState extends State<RecommendationScreen> {

  List verticalArray = [];
  // List<String> titleArray = [];
  // List<int> durationArray = [];
  // List<String> nameArray = [];
  // List<String> urlArray = [];
  // List<int> countArray = [];

  // List<int> idArray =[];
  // List<int> trackDurationArray = [];
  // List<String> trackTitleArray =[];
  // List<String> trackUriArray =[];
  // List<String> permalinkUriArray =[];
  // List<String> streamUrlArray

  // final TextEditingController _filter = TextEditingController();
  // String _searchText = "";
  // List searchReturns = []; // Data from API
  // List filteredReturns = []; //Data filtered by search text






  bool isLoading = true;

  // PageState() {
  //   _filter.addListener(() {
  //     if(_filter.text.isEmpty) {
  //       setState(() {
  //         _searchText = "";
  //         filteredReturns = searchReturns;
  //       });
  //     } else {
  //       setState(() {
  //         _searchText = _filter.text;
  //       });
  //     }
  //   });
  // }

  String getDuration(int duration) {
    String time;
    int durationTime;

    if (duration < 60000) {
      time = 'Sec';
      durationTime = (duration ~/ 6000);
    } else {
      if (duration >= 60000 && duration < 600000) {
        time = 'Min';
        durationTime = (duration ~/ 60000);
      } else {
        time = 'Hrs';
        durationTime = (duration ~/ 600000);
      }
    } 
    return durationTime.toString() + ' ' + time;
  }

  loadTracks() async {
    Dio dio = Dio();
    Response response;
    try {
      response = await dio
          .get("https://mkan-media.herokuapp.com/v1/audio/recommendations");
      // List verticalArray = [];

      // log(response.toString());
      if (response.data['success']) {
        List recommendArray = response.data["data"]["tracks"];
        for (int i = 0; i < recommendArray.length; i++) {
          setState(() {
            // searchReturns = verticalArray;
            // filteredReturns = searchReturns;

            // titleArray.add(recommendArray[i]['title']);
            // durationArray.add(recommendArray[i]['duration']);
            // nameArray.add(recommendArray[i]["user"]['full_name']);
            // urlArray.add(recommendArray[i]['uri']);
            // countArray.add(recommendArray[i]['track_count']);
            verticalArray.add(Recommendation(
                title: recommendArray[i]["title"],
                author: recommendArray[i]["user"]["full_name"],
                duration: getDuration(recommendArray[i]['duration']),
                color: i.isOdd
                    ? Color.fromRGBO(170, 247, 214, 1)
                    : Color.fromRGBO(252, 217, 255, 1),
                icon: Icon(Icons.play_circle_outline_rounded),
                colors: i.isOdd
                    ? Color.fromRGBO(2, 209, 112, 1)
                    : Color.fromRGBO(238, 51, 255, 1),
                //trackCount: recommendArray[i]['track_count'],
                url: recommendArray[i]['uri'],
              id: recommendArray[i]["id"],
              trackTitle: recommendArray[i]["title"],
              permalinkUri: recommendArray[i]["permalink_url"],
              artworkUrl: recommendArray[i]["artwork_url"],
              streamUrl: recommendArray[i]["stream_url"],



            ));
          });
        }

        // log(titleArray.toString());
        // log(durationArray.toString());
        // log(nameArray.toString());
        // log(urlArray.toString());
        // log(countArray.toString());
      }
    } on DioError catch (e) {
      log(e.message.toString());
      log(e.response.toString());
    }
    setState(() {
      isLoading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            // SizedBox(height: MediaQuery.of(context).size.height,),
            Text("Recommended",
              style: TextStyle(
                fontFamily: "SourceSansPro",
                fontSize: 20,
                fontWeight: FontWeight.w700,
                //fontFamily: "ProductSans",
              ),
            ),
          ],
        ),
        SizedBox(height: 10,),
        isLoading? Text("Loading...") : Expanded(
          child: Container(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: verticalArray.map((mend)
              => RecommendationItem(
                  mend.icon,
                  mend.duration,
                  mend.title,
                  mend.author,
                  mend.color,
                  mend.colors,
                //mend.trackCount,
                mend.url,
                mend.id,
                mend.trackTitle,
                mend.permalinkUri,
                mend.artworkUrl,
                mend.streamUrl,

              ),
              ).toList(),
            ),
          ),
        ),
      ],
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadTracks();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

