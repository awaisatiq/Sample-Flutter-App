import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import 'home/home.dart';
import 'search/search.dart';
import 'fav/fav.dart';
import 'notifications/notifications.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wish Whisper',
      theme: ThemeData(
        primaryColor: const Color(0xffd9fd39),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      home: const MyHomePage(title: 'WishWhisper'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int pageIndex = 0;

  final pages = [
    const Home(),
    const Search(),
    const Fav(),
    const Notifications(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 100,
      decoration: const BoxDecoration(
        color: Color(0xff1a1a1a),
      ),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 120,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.elliptical(300, 40),
                topRight: Radius.elliptical(300, 40),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 0;
                    });
                  },
                  icon: pageIndex == 0
                      ? const Icon(
                          IconlyBold.home,
                          color: Color(0xff000000),
                          size: 35,
                        )
                      : const Icon(
                          IconlyLight.home,
                          color: Color(0xff222428),
                          size: 35,
                        ),
                ),
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 1;
                    });
                  },
                  icon: pageIndex == 1
                      ? const Icon(
                          IconlyBold.search,
                          color: Color(0xff000000),
                          size: 35,
                        )
                      : const Icon(
                          IconlyLight.search,
                          color: Color(0xff222428),
                          size: 35,
                        ),
                ),
                Container(
                  width: 70,
                  height: 70,
                  transform: Matrix4.translationValues(0.0, -40.0, 0.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    border: Border.all(
                      color: const Color(0xff1a1a1a),
                      width: 5,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    enableFeedback: false,
                    onPressed: () {
                      setState(() {
                        // pageIndex = 0;
                      });
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Color(0xff222428),
                      size: 35,
                    ),
                  ),
                ),
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 2;
                    });
                  },
                  icon: pageIndex == 2
                      ? const Icon(
                          IconlyBold.heart,
                          color: Color(0xff000000),
                          size: 35,
                        )
                      : const Icon(
                          IconlyLight.heart,
                          color: Color(0xff222428),
                          size: 35,
                        ),
                ),
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 3;
                    });
                  },
                  icon: pageIndex == 3
                      ? const Icon(
                          IconlyBold.notification,
                          color: Color(0xff000000),
                          size: 35,
                        )
                      : const Icon(
                          IconlyLight.notification,
                          color: Color(0xff222428),
                          size: 35,
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
