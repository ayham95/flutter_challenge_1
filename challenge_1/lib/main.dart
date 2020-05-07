import 'package:challenge1/details_screen.dart';
import 'package:challenge1/fade_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        iconTheme: IconThemeData(color: Colors.grey[800]),
        textTheme: TextTheme(
          caption: TextStyle(color: Colors.grey),
          headline6: TextStyle(fontSize: 18),
        ),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.tealAccent.withAlpha(10),
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            SearchBar(),
            SizedBox(
              height: 24,
            ),
            Header(),
            SizedBox(
              height: 16,
            ),
            BookPromo(),
            SizedBox(
              height: 24,
            ),
            HorizontalListHeader(),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(top: 8, left: 16),
                scrollDirection: Axis.horizontal,
                children: [
                  MiniBookItem(
                    url: 'assets/cover2.png',
                    title: 'The Tiny Dragon',
                    author: 'Rubert Carter',
                    rating: 4,
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  MiniBookItem(
                    url: 'assets/cover3.jpg',
                    title: 'hoot',
                    author: 'Brad Furman',
                    rating: 5,
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  MiniBookItem(
                    url: 'assets/cover4.jpeg',
                    title: 'War and Peace',
                    author: 'Leo Tolstoy',
                    rating: 4,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      width: MediaQuery.of(context).size.width,
      height: 35,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.search,
            size: 20,
            color: Colors.grey,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            'Start typing',
            style: Theme.of(context).textTheme.caption,
          ),
          Expanded(
              child: SizedBox(
            width: 8,
          )),
          Icon(
            Icons.mic,
            size: 20,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Novels',
            style: Theme.of(context)
                .textTheme
                .headline4
                .copyWith(color: Colors.grey[900], fontWeight: FontWeight.bold),
          ),
          Text(
            '32 BOOKS',
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class BookPromo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [

        Hero(
          tag: DetailsScreen.background_tag,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            height: 280,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.teal[50],
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRect(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Book of the day',
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          width: 175,
                          child: Text(
                            'Get best literature every single day just entering the app.',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                .copyWith(fontSize: 12),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        CheckButton(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          height: 280,
          width: MediaQuery.of(context).size.width,
          child: ClipRect(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Hero(
                  tag: DetailsScreen.book_tag,
                  child: Transform(
                      transform: Matrix4.identity()
                        ..translate(50.0)
                        ..rotateZ(6.5),
                      child: BookBackground(
                        url: 'assets/cover.jpg',
                        height: 240,
                        shadowColor: Colors.teal,
                      )),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class CheckButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .push(FadeRoute(page: DetailsScreen())),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Text(
          'CHECK THE BOOK',
          style: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(fontSize: 10, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class HorizontalListHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'New releases',
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: Colors.grey[900], fontWeight: FontWeight.bold),
          ),
          Text(
            'See all',
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class MiniBookItem extends StatelessWidget {
  final String url;
  final String title;
  final String author;
  final double rating;

  const MiniBookItem({Key key, this.url, this.title, this.author, this.rating})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BookBackground(
          url: url,
          height: 190,
          blur: 4,
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 11),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          author,
          style: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 4,
        ),
        Row(
          children: <Widget>[
            RatingBar(
              initialRating: rating,
              itemSize: 10,
              unratedColor: Colors.grey[300],
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {},
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              '$rating',
              style:
                  Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 11),
            )
          ],
        )
      ],
    );
  }
}

class BookBackground extends StatelessWidget {
  final String url;
  final Color shadowColor;
  final double height;
  final double blur;

  const BookBackground(
      {Key key,
      @required this.url,
      this.shadowColor = Colors.black,
      this.height = 200,
      this.blur = 10})
      : assert(url != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: shadowColor.withAlpha(20), blurRadius: blur)
        ],
      ),
      child: Image.asset(
        url,
        height: height,
      ),
    );
  }
}
