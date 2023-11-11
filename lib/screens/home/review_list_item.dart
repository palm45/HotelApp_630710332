import 'package:flutter/material.dart';
import 'package:projectmobileapp/models/review.dart';

class ReviewsListItem extends StatelessWidget {
  static const iconSize = 18.0;

  final Reviews reviewlist;

  const ReviewsListItem({
    super.key,
    required this.reviewlist,
  });

  @override
  Widget build(BuildContext context) {

    var textTheme = Theme.of(context).textTheme;
    var colorScheme = Theme.of(context).colorScheme;
    var hasRating = reviewlist.rating > 0;
    var numWholeStar = reviewlist.rating.truncate();
    var fraction = reviewlist.rating - numWholeStar;
    var showHalfStar = fraction >= 0.5;
    var numBlankStar = 5 - numWholeStar - (showHalfStar ? 1 : 0);
    const iconSize = 25.0;

    return Card(
        margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                        children: [
                          Container(
                              width: 60.0,
                              height: 60.0,
                              color: colorScheme.background,
                              child: Center(child: Icon(Icons.person, size: 30.0))
                          ),
                          SizedBox(width: 8.0),
                          Expanded(child: Text(reviewlist.name, style: textTheme.titleLarge)),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                hasRating ? Padding(
                                  padding: const EdgeInsets.only(right: 60),
                                  child: Row(
                                      children: [
                                        for (var i = 0; i < numWholeStar; i++)
                                          Icon(Icons.star, size: iconSize,color: Colors.amber),
                                        if (showHalfStar) Icon(Icons.star_half, size: iconSize,color: Colors.amber),
                                        for (var i = 0; i < numBlankStar; i++)
                                          Icon(Icons.star_border, size: iconSize,color: Colors.amber),
                                      ]),
                                ) : Text('ยังไม่มีคะแนน'),
                              ]
                          ),
                        ]
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 70),
                          child: Container(
                            width: MediaQuery.of(context).size.width*0.4,
                            child: Text(
                              'Review : ${reviewlist.review.toString()}',

                              textAlign: TextAlign.left,
                              maxLines: 10,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

              ],
            )
        )
    );
  }
}
