import 'package:flutter/material.dart';
import 'package:flutter_web/services/contact.dart';
import 'package:flutter_web/utils/utils.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AboutContactPage extends StatefulWidget {
  AboutContactPage({Key key}) : super(key: key);

  @override
  _AboutContactPageState createState() => _AboutContactPageState();
}

class _AboutContactPageState extends State<AboutContactPage> {
  TextEditingController controller = TextEditingController();

  void commit() {
    if (controller.text.length == 0) {
      Fluttertoast.showToast(
        msg: '写点东西啊, 沙雕！！！',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } else {
      var info = getContact(controller.text);
      print(info);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'voluptatem non impedit',
          style: getEnCustomFont(14.0, Colors.white),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/contact.png',
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10.0),
            SizedBox(
              width: 380.0,
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'atque-ipsa-blanditiis',
                  labelText: 'Contact',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
            ),
            SizedBox(height: 40.0),
            SizedBox(
              width: 220.0,
              height: 48.0,
              child: RaisedButton(
                child: Text(
                  'BLACKHOLE',
                  style: getEnCustomFont(14.0, Colors.white),
                ),
                color: Colors.lightBlueAccent,
                onPressed: () {
                  print('点击了按钮');
                  commit();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
