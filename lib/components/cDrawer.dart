import 'package:flutter/material.dart';
import 'package:neuro_app/controllers/oxet_page_controller.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({
    super.key,
    required this.screenHeight, required this.selectedBrand,
  });
  final String selectedBrand;

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
              buildMenuItem("assets/menu/OXET.png", "OXET",() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OxetPageControllerWidget(
                            displayIndices: [0, 1, 2, 3, 4, 5])),);
                  
              }),
              // SizedBox(height: 20,),
              buildMenuItem("assets/menu/LIOF.png", "LIOF",() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OxetPageControllerWidget(
                            displayIndices: [6,7,8,9,10,11])));
              }),
              //  SizedBox(height: 18,),
              buildMenuItem("assets/menu/BETA.png", "BETA",() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OxetPageControllerWidget(
                            displayIndices: [12,13,14,15,16])));
              }),
              //  SizedBox(height: 18,),
              buildMenuItem("assets/menu/PIRA.png", "PIRA",() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OxetPageControllerWidget(
                            displayIndices: [17,18,19])));
              }),
              //  SizedBox(height: 18,),
              buildMenuItem("assets/menu/PARK.png", "PARK",() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OxetPageControllerWidget(
                            displayIndices: [20,21,22,23,24,25,26])));
              }),
              //  SizedBox(height: 14,),
              buildMenuItem("assets/menu/GAB-AT.png", "GAB-AT",() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OxetPageControllerWidget(
                            displayIndices: [27,28])));
              }),
              //  SizedBox(height: 18,),
              buildMenuItem("assets/menu/PANA.png","PANA" ,() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OxetPageControllerWidget(
                            displayIndices: [29,30,31,32])));
              }),
              //  SizedBox(height: 18,),
              buildMenuItem("assets/menu/PAXI.png", "PAXI",() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OxetPageControllerWidget(
                            displayIndices: [33,34,35,36])));
              }),
              //  SizedBox(height: 18,),
              buildMenuItem("assets/menu/RASA.png","RASA", () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OxetPageControllerWidget(
                            displayIndices: [37,38,39,40])));
              }),
              //  SizedBox(height: 18,),
              buildMenuItem("assets/menu/SYNA.png", "SYNA",() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OxetPageControllerWidget(
                            displayIndices: [41,42,43])));
              }),
              //  SizedBox(height: 18,),
              buildMenuItem("assets/menu/TOPI.png", "TOPI",() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OxetPageControllerWidget(
                            displayIndices: [44,45,46,47])));
              }),
              //  SizedBox(height: 18,),
              buildMenuItem("assets/menu/VEN.png", "VEN",() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OxetPageControllerWidget(
                            displayIndices: [48,49])));
              }),
              //  SizedBox(height: 18,),
              buildMenuItem("assets/menu/LAMO.png", "LAMO",() {
                 Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OxetPageControllerWidget(
                            displayIndices: [50])));
              }),
              //  SizedBox(height: 18,),
              buildMenuItem("assets/menu/ZEFR.png", "ZEFR",() {
                 Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OxetPageControllerWidget(
                            displayIndices: [51,52])));
              }),
              //  SizedBox(height: 18,),
              buildMenuItem("assets/menu/ADES.png", "ADES",() {
                 Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OxetPageControllerWidget(
                            displayIndices: [53])));
              }),
              //  SizedBox(height: 18,),
              buildMenuItem("assets/menu/ATTE.png","ATTE",() {
                 Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OxetPageControllerWidget(
                            displayIndices: [54])));
              }),
              //  SizedBox(height: 18,),
              buildMenuItem("assets/menu/IVE.png", "IVE",() {
                 Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OxetPageControllerWidget(
                            displayIndices: [55])));
              }),
              //  SizedBox(height: 18,),
              buildMenuItem("assets/menu/ETIR.png", "ETIR",() {
                 Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OxetPageControllerWidget(
                            displayIndices: [56])));
              }),
              //  SizedBox(height: 18,),
              buildMenuItem("assets/menu/LURA.png", "LURA",() {
                 Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OxetPageControllerWidget(
                            displayIndices: [57])));
              }),
              //  SizedBox(height: 18,),
              buildMenuItem("assets/menu/SIZO.png", "SIZO",() {
                 Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OxetPageControllerWidget(
                            displayIndices: [58])));
              }),
              //  SizedBox(height: 18,),
              buildMenuItem("assets/menu/NEU-D3.png", "NEU-D3",() {
                 Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OxetPageControllerWidget(
                            displayIndices: [59])));
              },),
              //  SizedBox(height: 18,),
              buildMenuItem("assets/menu/CARI.png","CARI", () {
                 Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OxetPageControllerWidget(
                            displayIndices: [60,61])));
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem(String assetsImage, String brandName,VoidCallback onTap, {bool isFirst5Brand = false}) {
        bool isSelected = brandName == selectedBrand; // Check if this brand is selected
List<String> is5Brand = ["OXET","LIOF","BETA","PIRA","PARK"];
bool isFirst5Brand = is5Brand.contains(brandName);
  Color itemColor = isSelected || isFirst5Brand ? Colors.white : Colors.grey;

    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 3),
        child: Image.asset(
          assetsImage,
          height: 15,
          color: itemColor
        ),
      ),
    );
  }
}
