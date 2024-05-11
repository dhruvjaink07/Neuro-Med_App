import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:neuro_app/Pages/main_page.dart';
import 'package:neuro_app/components/cDrawer.dart';

class Page13 extends StatefulWidget {
  const Page13({
    Key? key,
    required this.goToPreviousPage,
    required this.goToNextPage,
  });

  final VoidCallback goToPreviousPage;
  final VoidCallback goToNextPage;

  @override
  State<Page13> createState() => _Page13State();
}

class _Page13State extends State<Page13> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: MenuDrawer(screenHeight: MediaQuery.of(context).size.height),
      body: Center(
        child: Container(
          // width: MediaQuery.of(context).size.width,
           height: 768,
              width: 1024,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                    icon: Image.asset(
                      "assets/menu/5.png",
                      height: 20,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => MainPage()));
                    },
                    icon: Image.asset(
                      "assets/menu/6.png",
                      height: 25,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                
                  // alignment: Alignment.center,
                  margin: const EdgeInsets.only(right: 100),
                  child: Image.asset(
                    "assets/Page13/index.png",
                  ).animate().fade(duration: Duration(milliseconds: 1500)))
            ],
          ),
        ),
      ),
    );
  }
}
