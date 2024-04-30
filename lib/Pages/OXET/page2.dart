import 'package:flutter/material.dart';
import 'package:neuro_app/Pages/main_page.dart';
import 'package:neuro_app/components/cDrawer.dart';

class Page2 extends StatefulWidget {
  final VoidCallback goToPreviousPage;
    final VoidCallback goToNextPage;
  const Page2({Key? key, required this.goToPreviousPage, required this.goToNextPage,});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      drawer: MenuDrawer(screenHeight: MediaQuery.of(context).size.height),
      body: Container(
        width: width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/Page2/11.png"),
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
                    )),
                IconButton(
                    onPressed: () {
                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainPage()));
                    },
                    icon: Image.asset(
                      "assets/Page1/6.png",
                      height: 25,
                    ))
              ],
            ),
            Container(
              margin:  EdgeInsets.only(top: height/2.5, right: 300),
              child: InkWell(
                    onTap: () {
                showOverlay(context, "assets/Page2/4.png");
              },
                child: Stack(
                  children:[ Image.asset(
                    "assets/Page2/4.png",
                    height: 300,
                  ),]
                ),
              ),
            ),
             Container(
              height: 100,
              margin: const EdgeInsets.only(left: 20, top: 10),
              alignment: Alignment.bottomLeft,
              child: Stack(
                children: [
                Positioned(
                    left: isOpen ? 20 :  10, // Adjust this value as needed
                    bottom: 0,
                    child: Visibility(
                      visible: isOpen,
                      child: Image.asset(
                        "assets/Page2/3.png",
                        height: 40,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isOpen = !isOpen;
                        });
                      },
                      child: Image.asset(
                        "assets/Page2/2.png",
                        height: 45,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void showOverlay(BuildContext context, String overlayImagePath) {
    OverlayEntry? overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: () {
          overlayEntry!.remove();
        },
        child: Material(
          color: const Color.fromARGB(145, 0, 0, 0),
          child: Center(
            child: GestureDetector(
              onTap: () {}, // To prevent taps on the image from closing the overlay
              child: Image(
                image: AssetImage(overlayImagePath),
                height: 450,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
    Overlay.of(context)!.insert(overlayEntry);
  }
}
