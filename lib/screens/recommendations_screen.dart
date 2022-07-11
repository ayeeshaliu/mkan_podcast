import 'package:flutter/cupertino.dart';
import '../data/Mkan_data.dart';
import '../widgets/recommendation_item.dart';

class RecommendationScreen extends StatelessWidget {
  const RecommendationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Recommended",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            //fontFamily: "ProductSans",
          ),
        ),
        Expanded(
          child: Container(
            // height: MediaQuery.of(context).size.height  ,
            // width: MediaQuery.of(context).size.width ,
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
    );
  }
}
