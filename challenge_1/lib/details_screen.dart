import 'package:flutter/material.dart';

import 'main.dart';

class DetailsScreen extends StatelessWidget {
  static const String book_tag = 'bk_tag';
  static const String background_tag = 'bkgrnd_tag';

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Column(
            children: [
              Header(),
            ],
          ),
          SizedBox(
            height: 100,
            child: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                icon: Icon(Icons.keyboard_backspace, color: Colors.grey[800]),
                onPressed: () => Navigator.of(context).pop(),
              ),
              actions: [
                MenuIcon(),
                SizedBox(
                  width: 24,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: DetailsScreen.background_tag,
          child: Container(
            height: 310,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.teal[50],
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          left: 0,
          right: 0,
          child: Hero(
            tag: DetailsScreen.book_tag,
            child: ClipRect(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: BookBackground(
                      url: 'assets/cover.jpg',
                      height: 220,
                      shadowColor: Colors.teal,
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class MenuIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _Circle(),
        SizedBox(
          width: 4,
        ),
        _Circle(),
        SizedBox(
          width: 4,
        ),
        _Circle(),
      ],
    );
  }
}

class _Circle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 4,
      height: 4,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey[800]),
    );
  }
}
