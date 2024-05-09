import 'package:flutter/material.dart';
import 'package:neuro_app/controllers/oxet_page_controller.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({
    super.key,
    required this.screenHeight,
  });

  final double screenHeight;
 // Preload the images during initialization
  static final List<String> preloadedImages = [
    "assets/menu/OXET.png",
    "assets/menu/LIOF.png",
    "assets/menu/BETA.png",
    "assets/menu/PIRA.png",
    "assets/menu/PARK.png",
    "assets/menu/GAB-AT.png",
    "assets/menu/PANA.png",
    "assets/menu/PAXI.png",
    "assets/menu/RASA.png",
    "assets/menu/SYNA.png",
    "assets/menu/TOPI.png",
    "assets/menu/VEN.png",
    "assets/menu/LAMO.png",
    "assets/menu/ZEFR.png",
    "assets/menu/ADES.png",
    "assets/menu/ATTE.png",
    "assets/menu/IVE.png",
    "assets/menu/ETIR.png",
    "assets/menu/LURA.png",
    "assets/menu/SIZO.png",
    "assets/menu/NEU-D3.png",
    "assets/menu/CARI.png",
  ];

  @override
  Widget build(BuildContext context) {
      // Preload images when this widget is built
    for (var imagePath in preloadedImages) {
      precacheImage(AssetImage(imagePath), context);
    }

    return SizedBox(
       width: 86, // Adjust drawer width
      child: Drawer(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/menu/SIDEBAR.png"),
                  fit: BoxFit.fitHeight)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 30,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.close_sharp,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
              // SizedBox(height: 52,),
              buildMenuItem("assets/menu/OXET.png", () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OxetPageControllerWidget(
                            displayIndices: const [0, 1, 2, 3, 4, 5])));
                  
              }),
              // SizedBox(height: 20,),
              buildMenuItem("assets/menu/LIOF.png", () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OxetPageControllerWidget(
                            displayIndices: const [6,7,8,9,10,11])));
              }),
              //  SizedBox(height: 18,),
              buildMenuItem("assets/menu/BETA.png", () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OxetPageControllerWidget(
                            displayIndices: const [12,13,14,15,16])));
              }),
              //  SizedBox(height: 18,),
              buildMenuItem("assets/menu/PIRA.png", () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OxetPageControllerWidget(
                            displayIndices: const [17,18,19])));
              }),
              //  SizedBox(height: 18,),
              buildMenuItem("assets/menu/PARK.png", () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OxetPageControllerWidget(
                            displayIndices: const [22,23,24,25,26,27,28])));
              }),
              //  SizedBox(height: 14,),
              buildMenuItem("assets/menu/GAB-AT.png", () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OxetPageControllerWidget(
                            displayIndices: const [20,21])));
              }),
              //  SizedBox(height: 18,),
              buildMenuItem("assets/menu/PANA.png", () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OxetPageControllerWidget(
                            displayIndices: const [29,30,31,32])));
              }),
              //  SizedBox(height: 18,),
              buildMenuItem("assets/menu/PAXI.png", () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OxetPageControllerWidget(
                            displayIndices: const [33,34,35,36])));
              }),
              //  SizedBox(height: 18,),
              buildMenuItem("assets/menu/RASA.png", () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OxetPageControllerWidget(
                            displayIndices: const [37,38,39,40])));
              }),
              //  SizedBox(height: 18,),
              buildMenuItem("assets/menu/SYNA.png", () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OxetPageControllerWidget(
                            displayIndices: const [41,42,43])));
              }),
              //  SizedBox(height: 18,),
              buildMenuItem("assets/menu/TOPI.png", () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OxetPageControllerWidget(
                            displayIndices: const [44,45,46,47])));
              }),
              //  SizedBox(height: 18,),
              buildMenuItem("assets/menu/VEN.png", () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OxetPageControllerWidget(
                            displayIndices: const [48,49])));
              }),
              //  SizedBox(height: 18,),
              buildMenuItem("assets/menu/LAMO.png", () {
                 Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OxetPageControllerWidget(
                            displayIndices: const [50])));
              }),
              //  SizedBox(height: 18,),
              buildMenuItem("assets/menu/ZEFR.png", () {
                 Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OxetPageControllerWidget(
                            displayIndices: const [51,52])));
              }),
              //  SizedBox(height: 18,),
              buildMenuItem("assets/menu/ADES.png", () {
                 Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OxetPageControllerWidget(
                            displayIndices: const [53])));
              }),
              //  SizedBox(height: 18,),
              buildMenuItem("assets/menu/ATTE.png", () {
                 Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OxetPageControllerWidget(
                            displayIndices: const [54])));
              }),
              //  SizedBox(height: 18,),
              buildMenuItem("assets/menu/IVE.png", () {
                 Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OxetPageControllerWidget(
                            displayIndices: const [55])));
              }),
              //  SizedBox(height: 18,),
              buildMenuItem("assets/menu/ETIR.png", () {
                 Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OxetPageControllerWidget(
                            displayIndices: const [56])));
              }),
              //  SizedBox(height: 18,),
              buildMenuItem("assets/menu/LURA.png", () {
                 Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OxetPageControllerWidget(
                            displayIndices: const [57])));
              }),
              //  SizedBox(height: 18,),
              buildMenuItem("assets/menu/SIZO.png", () {
                 Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OxetPageControllerWidget(
                            displayIndices: const [58])));
              }),
              //  SizedBox(height: 18,),
              buildMenuItem("assets/menu/NEU-D3.png", () {
                 Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OxetPageControllerWidget(
                            displayIndices: const [59])));
              }),
              //  SizedBox(height: 18,),
              buildMenuItem("assets/menu/CARI.png", () {
                 Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OxetPageControllerWidget(
                            displayIndices: const [60,61])));
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem(String assetsImage, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 3),
        child: Image.asset(
          assetsImage,
          height: 15,
        ),
      ),
    );
  }
}
