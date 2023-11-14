import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:projectmobileapp/models/review.dart';
import 'package:projectmobileapp/screens/home/detail_hotel.dart';
import 'package:projectmobileapp/screens/home/reviewhotel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        toolbarHeight: 100,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/icon_hotel.png',scale: 9),
            Text(
              'Hotel Sweet Home',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Ink(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/pexels-pixabay.jpg"),
            fit: BoxFit.fill,
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context){
                          return DetailPage();
                        }
                    ));
                  },
                  borderRadius: BorderRadius.circular(30),
                  splashColor: Colors.black.withOpacity(0.1),
                  hoverColor: Colors.black.withOpacity(0.2),
                  highlightColor: Colors.black.withOpacity(0.12),
                  child: Ink(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.blueGrey,
                      border: Border.all(
                        color: Colors.black,
                      )
                    ),
                    width: MediaQuery.of(context).size.width*0.3,
                    height: 50,
                    child: Center(
                      child: Text(
                          'Detail',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context){
                          return ReviewHotelPage();
                        }
                    ));
                  },
                  borderRadius: BorderRadius.circular(30),
                  splashColor: Colors.black.withOpacity(0.1),
                  hoverColor: Colors.black.withOpacity(0.2),
                  highlightColor: Colors.black.withOpacity(0.12),
                  child: Ink(
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blueGrey,
                        border: Border.all(
                          color: Colors.black,
                        )
                    ),
                    width: MediaQuery.of(context).size.width*0.3,
                    height: 50,
                    child: Center(
                      child: Text(
                        'Review',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

}