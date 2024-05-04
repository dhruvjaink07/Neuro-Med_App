import 'package:flutter/material.dart';
import 'package:neuro_app/Pages/main_page.dart';
import 'package:neuro_app/components/cDrawer.dart';

class Page1 extends StatefulWidget {
  final VoidCallback goToNextPage;
  final Function(int) changePageIndex; // Callback to change page index

  const Page1({
    Key? key,
    required this.goToNextPage,
    required this.changePageIndex,
  }) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Duration _animationDuration = Duration(seconds: 1);
  final Curve _animationCurve = Curves.easeIn;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: _animationDuration,
    );

    // Start the animation immediately
    _controller.forward();

    // Add a listener to restart the animation when the page is loaded again
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.forward(from: 0);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      drawer: MenuDrawer(screenHeight: MediaQuery.of(context).size.height),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/Page1/11.png"),
            fit: BoxFit.contain,
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    _scaffoldKey.currentState?.openDrawer();
                  },
                  icon: Image.asset(
                    "assets/Page1/5.png",
                    height: 20,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MainPage()),
                    );
                  },
                  icon: Image.asset(
                    "assets/Page1/6.png",
                    height: 25,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height / 1.35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AnimatedOpacity(
                  opacity: 1,
                  duration: _animationDuration,
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset("assets/Page1/2.png", height: 120),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset("assets/Page1/3.png", height: 120),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset("assets/Page1/4.png", height: 120),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
