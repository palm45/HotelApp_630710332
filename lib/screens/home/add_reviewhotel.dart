import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:projectmobileapp/repositories/hotel_repository.dart';

class AddHotelPage extends StatefulWidget {
  static const routeName = 'add_reviewhotel';

  const AddHotelPage({super.key});

  @override
  State<AddHotelPage> createState() => _AddHotelPageState();
}

class _AddHotelPageState extends State<AddHotelPage> {
  var _isLoading = false;
  String? _errorMessage;

  final _reviewNameController = TextEditingController();
  final _reviewsController = TextEditingController();
  double ratings = 0;

  validateForm() {
    return _reviewNameController.text.isNotEmpty &&
        _reviewsController.text.isNotEmpty;
  }

  saveToilet() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    await Future.delayed(Duration(seconds: 2));

    try {
      var reviewName = _reviewNameController.text;
      var review = _reviewsController.text;

      await HotelRepository.addReview(name: reviewName, rating: ratings, review: review);

      if (mounted) Navigator.pop(context);
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

  @override
  Widget build(BuildContext context) {
    buildLoadingOverlay() => Container(
        color: Colors.black.withOpacity(0.2),
        child: Center(child: CircularProgressIndicator()));

    handleClickSave() {
      if (validateForm()) {
        saveToilet();
      }
    }

    buildForm() => SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                      controller: _reviewNameController,
                      decoration: InputDecoration(
                          hintText: 'Reviewer Name',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.greenAccent,
                              )))),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                      controller: _reviewsController,
                      decoration: InputDecoration(
                          hintText: 'Comment',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.greenAccent,
                              )))),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RatingBar.builder(
                    initialRating: 0,
                    minRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      ratings = rating;
                      print(rating);
                    },
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: handleClickSave,
                      child: Text('SAVE'),
                    ))
              ],
            )));

    return Scaffold(
        appBar: AppBar(title: Text('Reviewer')),
        body: Stack(
          children: [
            buildForm(),
            if (_isLoading) buildLoadingOverlay(),
          ],
        ));
  }
}
