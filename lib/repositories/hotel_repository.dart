import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:projectmobileapp/models/review.dart';
import 'package:projectmobileapp/services/api_caller.dart';

class HotelRepository {
  static List<Review> reviews = [];

  static Future<List<Review>> getReviews() async{
    try {
      //var result = await rootBundle.loadString('assets/data/db.json');
      var result = await ApiCaller().get('toilets?_embed=reviews');
      List list = jsonDecode(result);
      List<Review> reviewList = list.map((item) => Review.fromJson(item))
          .toList();
      reviews = reviewList;

      return reviewList;
    }catch(e){
      //TODO:
      rethrow;
    }
  }

  static Future<void> addReview({required String name, required double rating, required String review}) async {
    try {
      reviews.add(Review(name: name, rating: rating, review: review));
    } catch (e) {
      // TODO:
      rethrow;
    }
  }
}
