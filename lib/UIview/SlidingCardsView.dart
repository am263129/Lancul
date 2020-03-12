import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;

class SlidingCardsView extends StatefulWidget {
  @override
  _SlidingCardsViewState createState() => _SlidingCardsViewState();
}

class _SlidingCardsViewState extends State<SlidingCardsView> {
  PageController pageController;
  double pageOffset = 1;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.8, initialPage: 1);
    pageController.addListener(() {
      setState(() => pageOffset = pageController.page);
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 480,
      child: PageView(
        controller: pageController,
        children: <Widget>[
          SlidingCard(
            name: 'Jeddah city',
            date:
                'the city on the Red Sea, is a modern commercial hub and gateway for pilgrimages to the Islamic holy cities Mecca and Medina. Resort hotels, beaches and outdoor sculptures line the Corniche.',
            imageURL:
                'https://cdn3aleeli.daleeli.com/daleeli-CDN-backup/static/modules/uploads/cityguide/photos/english/225.jpg',
            offset: pageOffset - 1,
          ),
          SlidingCard(
            name: 'Riyadh city',
            date:
                'Saudi Arabia’s capital and main financial hub, is on a desert plateau in the country’s center. Business district landmarks include the 302m-high Kingdom Centre, and 267m-high Al Faisaliah Centre. In the historical Deira district, Masmak Fort.',
            imageURL:
                'https://stepcdn.com/assets/2019-05/30/9/572hk/488863c5-city-35744-16935f1b104-700x.jpg',
            offset: pageOffset - 1,
          ),
          SlidingCard(
            name: 'AlKhobar city',
            date:
                'the city on the Arabian Gulf. Its Corniche, includes Prince Faisal bin Fahad Sea Park, with cafes and playgrounds. Nearby, the city’s island Water Tower offers panoramic views. West, the Aramco Exhibit is a museum exploring the Saudi oil industry.',
            imageURL:
                'https://a.cdn-hotels.com/gdcs/production29/d1282/b9c7dc60-b62f-11e6-9c00-0242ac110047.jpg',
            offset: pageOffset - 1,
          ),
        ],
      ),
    );
  }
}

class SlidingCard extends StatelessWidget {
  final String name;
  final String date;
  final String imageURL;
  final double offset;

  const SlidingCard({
    Key key,
    @required this.name,
    @required this.date,
    @required this.imageURL,
    @required this.offset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double gauss = math.exp(-(math.pow((offset.abs() - 0.5), 2) / 0.08));
    return Transform.translate(
      offset: Offset(-32 * gauss * offset.sign, 0),
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.only(left: 8, right: 8, bottom: 30),
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              child: Image.network(
                imageURL,
                height: MediaQuery.of(context).size.height * 0.3,
                alignment: Alignment(-offset.abs(), 0),
                fit: BoxFit.none,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: CardContent(
                name: name,
                date: date,
                offset: gauss,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardContent extends StatelessWidget {
  final String name;
  final String date;
  final double offset;

  const CardContent(
      {Key key,
      @required this.name,
      @required this.date,
      @required this.offset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Transform.translate(
            offset: Offset(8 * offset, 0),
            child: Text(name, style: TextStyle(fontSize: 20)),
          ),
          SizedBox(height: 8),
          Transform.translate(
            offset: Offset(32 * offset, 0),
            child: Text(
              date,
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
