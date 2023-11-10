import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:projectmobileapp/models/review.dart';
import 'package:projectmobileapp/repositories/hotel_repository.dart';
import 'package:projectmobileapp/screens/home/add_reviewhotel.dart';

class ReviewHotelPage extends StatefulWidget {
  const ReviewHotelPage({super.key});

  @override
  State<ReviewHotelPage> createState() => _ReviewHotelPageState();
}

class _ReviewHotelPageState extends State<ReviewHotelPage> {
  List<Review>? _reviews;
  var _isLoading = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    getReviews();
  }

  getReviews() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    await Future.delayed(Duration(seconds: 2)); //โหลดหน้าเว็บ

    try {
      var reviews = await HotelRepository.getReviews();
      debugPrint('Number of reviews: ${reviews.length}');
      debugPrint('${reviews}');

      setState(() {
        _reviews = reviews;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  buildError() => Center(
      child: Padding(
          padding: const EdgeInsets.all(40.0),
          child:
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(_errorMessage ?? '', textAlign: TextAlign.center),
            SizedBox(height: 32.0),
            ElevatedButton(onPressed: getReviews, child: Text('Retry'))
          ])));

  buildLoadingOverlay() => Container(
      color: Colors.black.withOpacity(0.2),
      child: Center(child: CircularProgressIndicator()));



  @override
  Widget build(BuildContext context) {

    handleClickAdd() {
      Navigator.pushNamed(context, AddHotelPage.routeName).whenComplete(() {
        getReviews();
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        toolbarHeight: 100,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Review',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: handleClickAdd,
          child: Icon(Icons.add)
      ),
      body:Stack(
        children: [
          if(_reviews?.isNotEmpty ?? false) ListView.builder(
            itemCount: _reviews!.length,
            itemBuilder: (ctx, i) {
            Review reviewlist = _reviews![i];

            var textTheme = Theme.of(context).textTheme;
            var colorScheme = Theme.of(context).colorScheme;
            var hasRating = reviewlist.rating > 0;
            var numWholeStar = reviewlist.rating.truncate();
            var fraction = reviewlist.rating - numWholeStar;
            var showHalfStar = fraction >= 0.5;
            var numBlankStar = 5 - numWholeStar - (showHalfStar ? 1 : 0);
            const iconSize = 20.0;

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
                                      padding: const EdgeInsets.only(right: 55),
                                      child: Row(
                                          children: [
                                            for (var i = 0; i < numWholeStar; i++)
                                              Icon(Icons.star, size: iconSize),
                                            if (showHalfStar) Icon(Icons.star_half, size: iconSize),
                                            for (var i = 0; i < numBlankStar; i++)
                                              Icon(Icons.star_border, size: iconSize),
                                          ]),
                                    ) : Text('ยังไม่มีคะแนน'),
                                  ]),

                              ]
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 70),
                              child: Container(
                                width: MediaQuery.of(context).size.width*0.5,
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
          }),
          if (_errorMessage != null) buildError(),
          if (_isLoading) buildLoadingOverlay()
        ],
      )
    );
  }
}