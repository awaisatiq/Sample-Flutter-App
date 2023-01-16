import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:multiavatar/multiavatar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String avatar = "WishWhisper";
  int counter = 0;
  bool isLoggedIn = false;

  _generateSvg(value) async {
    setState(() {
      avatar = value!;
    });
  }

  String generateRandomString(int len) {
    var r = Random();
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(len, (index) => _chars[r.nextInt(_chars.length)])
        .join();
  }

  void setAvatar(value) {
    if (value == null) {
      Timer.periodic(new Duration(milliseconds: 100), (timer) {
        if (isLoggedIn) {
          timer.cancel();
        }
        _generateSvg(generateRandomString(15));
      });
    } else {
      isLoggedIn = true;
      _generateSvg(value);
    }
  }

  @override
  void initState() {
    super.initState();
    setAvatar(null);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.only(top: 80.0, left: 10, right: 10, bottom: 10),
      color: const Color(0xff1a1a1a),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Welcome!",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                Row(
                  children: const [
                    Text(
                      "Don't have an account? ",
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "Create Now",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              width: 50,
              height: 50,
              child: SvgPicture.string(multiavatar(avatar)),
            )
          ],
        ),
      ]),
    );
  }
}
