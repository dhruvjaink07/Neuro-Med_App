import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:neuro_app/controllers/oxet_page_controller.dart';

int count = 0;

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List numbers = [];
  List<int> displayIndices = [];
  Set<String> pages = Set<String>();
  @override
  Map<String, int> selectedImages =
      {}; // Map to store selected images and their numbers
  int currentNumber = 1; // Variable to track the current number

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity != null) {
            if (details.primaryVelocity! < 0) {
              // Swiped Right
              setState(() {
                count = 0;
              });
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OxetPageControllerWidget(
                          displayIndices: displayIndices)));
            }
          }
        },
        child: Center(
          child: Container(
            // height: MediaQuery.of(context).size.height,
            // width: MediaQuery.of(context).size.width,
            height: 768,
            width: 1024,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/MainPage/Background.png"),
                    fit: BoxFit.contain)),
            child: Column(
              children: [
            //   Text("Hello").animate()
            // .fadeIn(duration: 600.ms)
            // .then(delay: 200.ms) // baseline=800ms
            // .slide(begin: Offset(-1, 0), duration: 800.ms) // Slide from left to right
            // .animate(),
          
                Expanded(
                    child: Stack(
                  children: [
                    // Refresh Button
                    Positioned(
                        left: 20,
                        top: 5,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              displayIndices.clear();
                              count = 0;
                            });
                          },
                          child: Image.asset(
                            "assets/MainPage/refresh button.png",
                            height: 60,
                          ),
                        )),
                    // OXET
                    Positioned(
                        top: 67,
                        left: 460,
                        child: InkWell(
                            onTap: () {
                              var imageName = "Oxet";
                              pages.add(imageName);
                              displayIndices.add(0);
                              displayIndices.add(1);
                              displayIndices.add(2);
                              displayIndices.add(3);
                              displayIndices.add(4);
                              displayIndices.add(5);
                              increment();
                              setState(() {
                                selectedImages[imageName] = currentNumber;
                                currentNumber++;
                              });
                              print("Item Added 1");
                            },
                            child: Brand(
                              assetName: "assets/MainPage/OXET.png",
                              imageName: "Oxet",
                              selectedImages: selectedImages,
                            ))),
          
                    // VEN
                    Positioned(
                        top: 67,
                        right: 205,
                        child: InkWell(
                            onTap: () {
                              var imageName = "Ven";
                              pages.add(imageName);
                                setState(() {
                                selectedImages[imageName] = currentNumber;
                                currentNumber++;
                              });
                              increment();
                              // numbers.add(count);
                              print("Item Added 2");
                              displayIndices.add(48);
                              displayIndices.add(49);
                            },
                            child: Brand(
                                assetName: "assets/MainPage/VEN.png",
                                imageName: "Ven",
                                selectedImages: selectedImages,
                                
                                ))),
          
                    // PANA
                    Positioned(
                        top: 124,
                        right: 340,
                        child: InkWell(
                            onTap: () {
                              print("3");
                              var imageName = "Pana";
                              pages.add(imageName);
                                setState(() {
                                selectedImages[imageName] = currentNumber;
                                currentNumber++;
                              });
                              displayIndices.add(29);
                              displayIndices.add(30);
                              displayIndices.add(31);
                              displayIndices.add(32);
                              increment();
                              numbers.add(count);
                            },
                            child: Brand(
                                assetName: "assets/MainPage/PANA.png",
                                imageName: "Pana",
                                selectedImages: selectedImages,))),
          
                    // ETIR
                    Positioned(
                        top: 124,
                        right: 63,
                        child: InkWell(
                            onTap: () {
                              print("4");
                              var imageName = "Etr";
                              pages.add(imageName);
                                setState(() {
                                selectedImages[imageName] = currentNumber;
                                currentNumber++;
                              });
                              increment();
                              displayIndices.add(56);
                              numbers.add(count);
                            },
                            child: Brand(
                                assetName: "assets/MainPage/ETIR.png",
                                imageName: "Etr",
                                selectedImages: selectedImages,
                                ))),
                    // LIOF
                    Positioned(
                        top: 180,
                        left: 460,
                        child: InkWell(
                            onTap: () {
                              print("5");
                              increment();
                              var imageName = "Liof";
                                setState(() {
                                selectedImages[imageName] = currentNumber;
                                currentNumber++;
                              });
                              displayIndices.add(6);
                              displayIndices.add(7);
                              displayIndices.add(8);
                              displayIndices.add(9);
                              displayIndices.add(10);
                              displayIndices.add(11);
                              pages.add(imageName);
                            },
                            child: Brand(
                                assetName: "assets/MainPage/LIOF.png",
                                imageName: "Liof",
                                selectedImages: selectedImages,))),
                    // LAMO
                    Positioned(
                        top: 180,
                        right: 205,
                        child: InkWell(
                            onTap: () {
                              print("6");
                              var imageName = "Lamo";
                                setState(() {
                                selectedImages[imageName] = currentNumber;
                                currentNumber++;
                              });
                              pages.add(imageName);
                              displayIndices.add(50);
          
                            },
                            child: Brand(
                              assetName: "assets/MainPage/LAMO.png",
                              imageName: "Lamo",
                              selectedImages: selectedImages,
                            ))),
                    // PAXI
                    Positioned(
                        top: 238,
                        right: 340,
                        child: InkWell(
                            onTap: () {
                              print("7");
                              var imageName = "Paxi";
                                setState(() {
                                selectedImages[imageName] = currentNumber;
                                currentNumber++;
                              });
                              displayIndices.add(33);
                              displayIndices.add(34);
                              displayIndices.add(35);
                              displayIndices.add(36);
                              pages.add(imageName);
                            },
                            child: Brand(
                              assetName: "assets/MainPage/PAXI.png",
                              imageName: "Paxi",
                              selectedImages: selectedImages,
                            ))),
          
                    // LURA
                    Positioned(
                        top: 238,
                        right: 63,
                        child: InkWell(
                            onTap: () {
                              print("8");
                              var imageName = "Lura";
                                setState(() {
                                selectedImages[imageName] = currentNumber;
                                currentNumber++;
                              });
                              displayIndices.add(57);
                              pages.add(imageName);
                            },
                            child: Brand(
                              assetName: "assets/MainPage/LURA.png",
                              imageName: "Lura",
                              selectedImages: selectedImages,
                            ))),
                    // BETA
                    Positioned(
                        top: 296,
                        left: 460,
                        child: InkWell(
                            onTap: () {
                              print("9");
                              var imageName = "Beta";
                                setState(() {
                                selectedImages[imageName] = currentNumber;
                                currentNumber++;
                              });
                              displayIndices.add(12);
                              displayIndices.add(13);
                              displayIndices.add(14);
                              displayIndices.add(15);
                              displayIndices.add(16);
                              pages.add(imageName);
                            },
                            child: Brand(
                              assetName: "assets/MainPage/BETA.png",
                              imageName: "Beta",
                              selectedImages: selectedImages,
                            ))),
                    // ZEFR
                    Positioned(
                        top: 296,
                        right: 205,
                        child: InkWell(
                            onTap: () {
                              print("10");
                              var imageName = "Zefr";
                                setState(() {
                                selectedImages[imageName] = currentNumber;
                                currentNumber++;
                              });
                              displayIndices.add(51);
                              displayIndices.add(52);
                              pages.add(imageName);
                            },
                            child: Brand(
                              assetName: "assets/MainPage/ZEFR.png",
                              imageName: "Zefr",
                              selectedImages: selectedImages,
                            ))),
                    // RASA
                    Positioned(
                        top: 352,
                        right: 340,
                        child: InkWell(
                            onTap: () {
                              print("11");
                              var imageName = "Rasa";
                              pages.add(imageName);
                                setState(() {
                                selectedImages[imageName] = currentNumber;
                                currentNumber++;
                              });
                              displayIndices.add(37);
                              displayIndices.add(38);
                              displayIndices.add(39);
                              displayIndices.add(40);
                            },
                            child: Brand(
                              assetName: "assets/MainPage/RASA.png",
                              imageName: "Rasa",
                              selectedImages: selectedImages,
                            ))),
          
                    // SIZO
                    Positioned(
                        top: 352,
                        right: 63,
                        child: InkWell(
                            onTap: () {
                              print("12");
                                  var imageName = "Sizo";
                                  
                              pages.add(imageName);
                                setState(() {
                                selectedImages[imageName] = currentNumber;
                                currentNumber++;
                              });
                              displayIndices.add(58);
                            },
                            child: Brand(
                              assetName: "assets/MainPage/SIZO.png",
              imageName: "Sizo",
              selectedImages: selectedImages,
                            ))),
                    // PIRA
                    Positioned(
                        top: 410,
                        left: 460,
                        child: InkWell(
                            onTap: () {
                              print("13");
                                  var imageName = "Pira";
                              pages.add(imageName);
                                setState(() {
                                selectedImages[imageName] = currentNumber;
                                currentNumber++;
                              });
                              displayIndices.add(17);
                              displayIndices.add(18);
                              displayIndices.add(19);
                            },
                            child: Brand(
                              assetName: "assets/MainPage/PIRA.png",
                              imageName: "Pira",
                              selectedImages: selectedImages,
                            ))),
                    // ADES
                    Positioned(
                        top: 410,
                        right: 205,
                        child: InkWell(
                            onTap: () {
                              print("14");
                                  var imageName = "Ades";
                              pages.add(imageName);
                                setState(() {
                                selectedImages[imageName] = currentNumber;
                                currentNumber++;
                              });
                              displayIndices.add(53);
                            },
                            child: Brand(
                              assetName: "assets/MainPage/ADES.png",
                              imageName: "Ades",
                              selectedImages: selectedImages,
                            ))),
                    // SYNA
                    Positioned(
                        top: 467,
                        right: 340,
                        child: InkWell(
                            onTap: () {
                              print("15");    var imageName = "Syna";
                              pages.add(imageName);
                                setState(() {
                                selectedImages[imageName] = currentNumber;
                                currentNumber++;
                              });
                              displayIndices.add(41);
                              displayIndices.add(42);
                              displayIndices.add(43);
                            },
                            child: Brand(
                              assetName: "assets/MainPage/SYNA.png",
                              imageName: "Syna",
                              selectedImages: selectedImages,
                            ))),
          
                    // NEU-D3
                    Positioned(
                        top: 467,
                        right: 63,
                        child: InkWell(
                            onTap: () {
                              print("16");
                                  var imageName = "Neu-d3";
                              pages.add(imageName);
                                setState(() {
                                selectedImages[imageName] = currentNumber;
                                currentNumber++;
                              });
                              displayIndices.add(59);
                            },
                            child: Brand(
                              assetName: "assets/MainPage/NEU-D3.png",
          imageName: "Neu-d3",
          selectedImages: selectedImages,
                            ))),
                    // PARK
                    Positioned(
                        top: 522,
                        left: 460,
                        child: InkWell(
                            onTap: () {
                              print("17");
                                  var imageName = "Park";
                              pages.add(imageName);
                                setState(() {
                                selectedImages[imageName] = currentNumber;
                                currentNumber++;
                              });
                              displayIndices.add(22);
                              displayIndices.add(23);
                              displayIndices.add(24);
                              displayIndices.add(25);
                              displayIndices.add(26);
                              displayIndices.add(27);
                              displayIndices.add(28);
                            },
                            child: Brand(
                              assetName: "assets/MainPage/PARK.png",
                              imageName: "Park",
                              selectedImages: selectedImages,
                            ))),
                    // ATTE
                    Positioned(
                        top: 522,
                        right: 205,
                        child: InkWell(
                            onTap: () {
                              print("18");
                                    var imageName = "Atte";
                              pages.add(imageName);
                                setState(() {
                                selectedImages[imageName] = currentNumber;
                                currentNumber++;
                              });
                              displayIndices.add(54);
                            },
                            child: Brand(
                              assetName: "assets/MainPage/ATTE.png",
          imageName: "Atte",selectedImages: selectedImages,
                            ))),
                    // TOPI
                    Positioned(
                        top: 580,
                        right: 340,
                        child: InkWell(
                            onTap: () {
                              print("19");
                                    var imageName = "Topi";
                              pages.add(imageName);
                                setState(() {
                                selectedImages[imageName] = currentNumber;
                                currentNumber++;
                              });
                              displayIndices.add(44);
                              displayIndices.add(45);
                              displayIndices.add(46);
                              displayIndices.add(47);
                            },
                            child: Brand(
                              assetName: "assets/MainPage/TOPI.png",imageName: "Topi",
          selectedImages: selectedImages,                          ))),
          
                    // CARI
                    Positioned(
                        top: 580,
                        right: 63,
                        child: InkWell(
                            onTap: () {
                              print("20");
                                    var imageName = "Cari";
                              pages.add(imageName);
                                setState(() {
                                selectedImages[imageName] = currentNumber;
                                currentNumber++;
                              });
                              displayIndices.add(60);
                              displayIndices.add(61);
                            },
                            child: Brand(
                              assetName: "assets/MainPage/CARI.png",
          imageName: 'Cari',selectedImages: selectedImages,
                            ))),
                    // GAB-AT
                    Positioned(
                        top: 637,
                        left: 460,
                        child: InkWell(
                            onTap: () {
                              print("21");
                                    var imageName = "Gab-At";
                              pages.add(imageName);
                                setState(() {
                                selectedImages[imageName] = currentNumber;
                                currentNumber++;
                              });
                              displayIndices.add(20);
                              displayIndices.add(21);
                            },
                            child: Brand(
                              assetName: "assets/MainPage/GAB-AT.png",
                              imageName: "Gab-At",selectedImages: selectedImages,
                            ))),
                    // IVE
                    Positioned(
                        top: 637,
                        right: 205,
                        child: InkWell(
                            onTap: () {
                              print("22");
                                    var imageName = "Ive";
                              pages.add(imageName);
                                setState(() {
                                selectedImages[imageName] = currentNumber;
                                currentNumber++;
                              });
                              displayIndices.add(55);
                            },
                            child: Brand(
                              assetName: "assets/MainPage/IVE.png",
          imageName: "Ive",selectedImages: selectedImages,
                            ))),
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void increment() {
    setState(() {
      count = count + 1;
    });
  }
}


class Brand extends StatelessWidget {
  Brand({
    Key? key,
    required this.assetName,
    required this.imageName,
    required this.selectedImages,
  }) : super(key: key);

  final String assetName;
  final String imageName;
  final Map<String, int> selectedImages;

  @override
  Widget build(BuildContext context) {
    int? selectionNumber = selectedImages[imageName]; // Get the number for this image
    return Stack(
      children: [
        Image.asset(
          assetName,
          height: 70,
        ),
        if (selectionNumber != null && selectionNumber > 0)
          Positioned(
            bottom: 34,
            left: 2,
            child: Container(
              padding: EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: Colors.red, // Change color to red
                shape: BoxShape.circle, // Make it a circle
              ),
              child: Center(
                child: Text(
                  '$selectionNumber',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
