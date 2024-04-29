import 'package:flutter/material.dart';
import 'package:project/CardDetailsPage.dart';
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
                  buildCarouselItem('carousel1.png'),
                ],
                options: CarouselOptions(
                  height: 200,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  autoPlay: false,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  pauseAutoPlayOnTouch: true,
                  enlargeCenterPage: true,
                ),
              ),
              SizedBox(height: 10),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 10,
                children: [
                  buildCard(
                      context,
                      [
                        'Clothing',
                        'Electronics',
                        'Watches',
                        'Mobile Phones',
                        'Gadjets'
                      ],
                      [
                        'Amazon_BackGround_Crop.png',
                        'Amazon_BackGround_Electronics.png'
                      ],
                      [3, 5, 7, 2, 4],
                      'https://www.amazon.com',
                      5),
                  buildCard(
                      context,
                      [
                        'Clothing',
                        'Electronics',
                        'Watches',
                        'Mobile Phones',
                        'Gadjets',
                        'Dresses'
                      ],
                      ['Flipkart_BackGround_Earbuds.png', 'Flipkart.png'],
                      [2, 6, 4, 7, 8, 4],
                      'https://www.flipkart.com',
                      6),
                  buildCard(
                      context,
                      ['Clothing', 'Electronics', 'Watches', 'Mobile Phones'],
                      ['Meesho.png', 'Meesho.png'],
                      [3, 7, 6, 4],
                      'https://www.meesho.com',
                      4),
                  buildCard(
                      context,
                      [
                        'Clothing',
                        'Electronics',
                        'Watches',
                        'Mobile Phones',
                        'Gadjets'
                      ],
                      ['Myntra_BackGround_Clothing.png', 'Myntra.png'],
                      [4, 7, 8, 3, 5],
                      'https://www.myntra.com',
                      5),
                  buildCard(
                      context,
                      ['Clothing', 'Electronics', 'Watches'],
                      ['Nykaa_BackGround_Lipstick.png', 'Nykaa.png'],
                      [5, 7, 8],
                      'https://www.nykaa.com',
                      3),
                  buildCard(
                      context,
                      ['Clothing', 'Electronics', 'Watches'],
                      ['AJIO_BackGround_Clothes.png', 'AJIO.png'],
                      [6, 2, 3],
                      'https://www.ajio.com',
                      3),
                  buildCard(
                      context,
                      ['Electronics', 'Watches', 'Mobile Phones'],
                      ['Mamaearth_BackGround_Cream.png', 'Mamaearth.png'],
                      [7, 6, 2],
                      'https://www.mamaearth.com',
                      3),
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
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget buildCard(BuildContext context, List<String> title, List<String> image,
      List<int> number, String url, int numberOfCards) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CardDetailsPage(
              cardTitles: title,
              cardImages: List.generate(numberOfCards, (index) => image[0]),
              cardNumbers: number,
              cardUrls: List.generate(numberOfCards, (index) => url),
              numberOfCards: numberOfCards,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(10),
        child: Card(
          elevation: 5,
          child: Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage('assets/images/${image[1]}'),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
