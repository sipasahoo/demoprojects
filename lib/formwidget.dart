import 'package:demoprojects/HomeScreen.dart';
import 'package:demoprojects/ProductDetails.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'images/CA8185H.jpg',
  'images/image2.jpg',
  'images/image3.jpg',
  'images/image5.jpg',
  'images/image-asset1.jpeg'
];

class Groupwidget {
  final List<Widget> imageSliders = imgList
      .map((item) => Container(
            child: Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.asset(item, fit: BoxFit.cover, width: 1000.0),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(200, 0, 0, 0),
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          child: Text(
                            'Product ${imgList.indexOf(item)}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ))
      .toList();

  Widget inputs(label, key, validator, keyboardType) {
    return Padding(
      padding: EdgeInsets.all(17),
      child: TextFormField(
        decoration: InputDecoration(labelText: label),
        onSaved: (String value) {
          key = value;
        },
        keyboardType: keyboardType,
        obscureText: label == 'password' ? true : false,
        validator: validator,
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget actionbutton(context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          height: 50,
          width: double.infinity,
          child: RaisedButton(
            color: Colors.green,
            onPressed: () {
              //validateInputs();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            child: Text(
              'Submit',
              style: TextStyle(color: Colors.white),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.green)),
          ),
        ));
  }

  Widget bottomnavigation(context) {
    return BottomNavigationBar(
      currentIndex: 0, // this will be set when a tab is tapped
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.mail),
          title: Text('Messages'),
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.person), title: Text('Profile'))
      ],
    );
  }

  Widget carouselSlider(context) {
    return Container(
        child: CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 2.0,
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
        initialPage: 2,
        autoPlay: true,
      ),
      items: imageSliders,
    ));
  }

  Widget categories(context) {
    return Row(
      children: <Widget>[
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductDetailsPage()),
            );
          },
          child: Container(
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Watch",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
                Image.asset("images/CA8185H.jpg",
                    height: MediaQuery.of(context).size.height / 8,
                    width: MediaQuery.of(context).size.width / 6),
              ],
            ),
            height: MediaQuery.of(context).size.height / 8,
            width: MediaQuery.of(context).size.width / 2.5,
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
                border: Border.all(
                    width: 3, color: Colors.blue, style: BorderStyle.solid)),
          ),
        ),
        SizedBox(
          width: 8.0,
        ),
      ],
    );
  }

  Widget buyProduct(context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3.5,
      width: MediaQuery.of(context).size.width / 3,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Image.asset("images/CA8185H.jpg",
                  height: MediaQuery.of(context).size.height / 8,
                  width: MediaQuery.of(context).size.width / 6),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Text(
                "Apple Watch",
                style: TextStyle(fontSize: 14),
              ),
            ),
            SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Text(
                'Rs.1234',
                style: TextStyle(color: Colors.red),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Center(
                child: RaisedButton(
                  color: Colors.blue,
                  onPressed: null,
                  child: Text(
                    "Buy",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
