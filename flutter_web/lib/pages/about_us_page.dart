import 'package:flutter/material.dart';
import 'package:flutter_web/utils/utils.dart';
import 'package:flutter_web/pages/about_contact_page.dart';

class AboutUsPage extends StatefulWidget {
  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/title.png',
            fit: BoxFit.cover,
          ),
          MyListTitle(
            text: 'Google',
            leading: Icon(Icons.message),
            pressed: () {
              Navigator.of(context).pushReplacementNamed('company_info');
            },
            longPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AboutContactPage(),
                ),
              );
            },
          ),
          Divider(
            height: 1.0,
            color: Colors.grey,
          ),
          MyListTitle(
            text: 'libero ab est',
            leading: Icon(Icons.mic_off),
            pressed: () {
              print('123');
            },
            longPressed: () {
              print('333');
            },
          ),
          Divider(
            height: 1.0,
            color: Colors.grey,
          ),
          MyListTitle(
            text: 'sint tempore voluptas',
            leading: Icon(Icons.movie_creation),
            pressed: () {
              print('123');
            },
            longPressed: () {
              print('333');
            },
          ),
          Divider(
            height: 1.0,
            color: Colors.grey,
          ),
          MyListTitle(
            text: 'et libero est',
            leading: Icon(Icons.loupe),
            pressed: () {
              print('123');
            },
            longPressed: () {
              print('333');
            },
          )
        ],
      ),
    );
  }
}

// ?自定义 ListTile
class MyListTitle extends StatelessWidget {
  final text;
  final leading;
  final pressed;
  final longPressed;

  const MyListTitle({
    this.text = '',
    this.leading = '',
    this.pressed = null,
    this.longPressed = null,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: ListTile(
        leading: this.leading,
        title: Text(
          this.text,
          style: getEnCustomFont(16.0, Colors.black54),
        ),
        onTap: this.pressed,
        onLongPress: this.longPressed,
      ),
    );
  }
}
