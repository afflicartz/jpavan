import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              CarouselSlider(
                items: [
                  buildCarouselItem('Logo.png'),
                  // buildCarouselItem('CarouselImage2.png'),
                  // buildCarouselItem('CarouselImage3.png'),
                ],
                options: CarouselOptions(
                  height: 200,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  autoPlay: false,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  pauseAutoPlayOnTouch: true,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              SizedBox(height: 10),
              Wrap(
                alignment: WrapAlignment.center, // Align items in the center
                spacing: 10, // Space between items
                children: [
                  buildCard('Amazon.png'),
                  buildCard('Flipkart.png'),
                  buildCard('Meesho.png'),
                  buildCard('Myntra.png'),
                  buildCard('Nykaa.png'),
                  buildCard('AJIO.png'),
                  buildCard('Mamaearth.png'),
                  buildCard('Amazon.png'),
                  buildCard('Amazon.png'),
                  buildCard('Amazon.png'),
                ],
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCarouselItem(String imageName) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage('assets/images/$imageName'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget buildCard(String imageName) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Card(
        elevation: 5,
        child: Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage('assets/images/$imageName'),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
