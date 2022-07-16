import 'package:flutter/cupertino.dart';
import '../data/Mkan_data.dart';
import '../widgets/recommendation_item.dart';

class RecommendationScreen extends StatelessWidget {
  const RecommendationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            // SizedBox(height: MediaQuery.of(context).size.height,),
            Text("Recommended",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                //fontFamily: "ProductSans",
              ),
            ),
          ],
        ),
        SizedBox(height: 10,),
        Expanded(
          child: Container(
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
