import 'package:flutter/material.dart';
import 'package:neuro_app/controllers/oxet_page_controller.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';



int count = 0;

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late Box tappedImagesBox;
// Clear tappedImages data in Hive
void clearTappedImages() {
  Box tappedImagesBox = Hive.box('tappedImages');
  tappedImagesBox.delete('tappedImages');
}

  List numbers = [];
    Set<int> displayIndices = Set<int>();
Set<String> tappedImages = Set<String>();

  //  Set<String> tappedImages = Set<String>();
  Set<String> pages = Set<String>();
  @override
  Map<String, int> selectedImages =
      {}; // Map to store selected images and their numbers
  int currentNumber = 1; // Variable to track the current number
  int continueNumber = 1;

    @override
  void initState() {
    super.initState();
     // Open the Hive box for tappedImages
    tappedImagesBox = Hive.box('tappedImages');
    // Select Oxet page by default when the page loads
    displayIndices.addAll([0, 1, 2, 3, 4, 5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,]);
    selectedImages['Oxet'] = 1; // Assuming 'Oxet' corresponds to number 1
    selectedImages['Liof'] = 2;
    selectedImages['Beta'] = 3;
    selectedImages['Pira'] = 4;
    selectedImages['Park'] = 5;

    tappedImages.add('Oxet'); // Mark 'Oxet' as tapped
    tappedImages.add('Liof');
    tappedImages.add('Beta');
    tappedImages.add('Pira');
    tappedImages.add('Park');
    currentNumber = 6; // Update currentNumber to the next available number
  }
  @override
  Widget build(BuildContext context) {
// clearTappedImages();
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity != null) {
            if (details.primaryVelocity! < 0) {
              debugPrint("$tappedImages");
              // Swiped Right
              setState(() {
                count = 0;
              });
               // User right swiped, store tappedImages in Hive
            tappedImagesBox.put('tappedImages', tappedImages.toList());
              if(displayIndices.isNotEmpty){
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OxetPageControllerWidget(
                          displayIndices: displayIndices.toList())));
              }
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
                              selectedImages.clear();
                              currentNumber =1; 
                              tappedImages.clear();
                              //  Not To Clear even when clicked on refresh button
                              displayIndices.addAll([0, 1, 2, 3, 4, 5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,]);
                              selectedImages['Oxet'] = 1; // Assuming 'Oxet' corresponds to number 1
                              selectedImages['Liof'] = 2;
                              selectedImages['Beta'] = 3;
                              selectedImages['Pira'] = 4;
                              selectedImages['Park'] = 5;

                              tappedImages.add('Oxet'); // Mark 'Oxet' as tapped
                              tappedImages.add('Liof');
                              tappedImages.add('Beta');
                              tappedImages.add('Pira');
                              tappedImages.add('Park');
                              currentNumber = 6;
                        
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
                            // Check if the image is already tapped
                  if (!tappedImages.contains("Oxet")) {
                    // selectedBrands.addBrand("Oxet");
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
                                continueNumber++;
                                tappedImages.add("Oxet");
// Mark Oxet image as clicked
                              });
                              print("Item Added 1");
                              }
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
                              bool oxetClicked = false;
                                 // Check if the image is already tapped
                  if (!tappedImages.contains("Ven")) {
                              var imageName = "Ven";
                              pages.add(imageName);
                                setState(() {
                                selectedImages[imageName] = currentNumber;
                                currentNumber++;
                                 tappedImages.add("Ven");
                              });
                              increment();
                              // numbers.add(count);
                              print("Item Added 2");
                              displayIndices.add(48);
                              displayIndices.add(49);
                                 }
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
                              bool oxetClicked = false;
                                 if (!tappedImages.contains("Pana")) {
                              print("3");
                              var imageName = "Pana";
                              pages.add(imageName);
                                setState(() {
                                selectedImages[imageName] = currentNumber;
                                currentNumber++;
                                tappedImages.add("Pana");
                              });
                              displayIndices.add(29);
                              displayIndices.add(30);
                              displayIndices.add(31);
                              displayIndices.add(32);
                              increment();
                              numbers.add(count);
                                 }
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
                              bool oxetClicked = false;
                                  if (!tappedImages.contains("Etr")) {
                              print("4");
                              var imageName = "Etr";
                              pages.add(imageName);
                                setState(() {
                                selectedImages[imageName] = currentNumber;
                                currentNumber++;
                                tappedImages.add("Etr");
                              });
                              increment();
                              displayIndices.add(56);
                              numbers.add(count);
                                 }
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
                              bool oxetClicked = false;
                                if (!tappedImages.contains("Liof")) {
                              print("5");
                              increment();
                              var imageName = "Liof";
                                setState(() {
                                selectedImages[imageName] = currentNumber;
                                currentNumber++;
                                tappedImages.add("Liof");
                              });
                              displayIndices.add(6);
                              displayIndices.add(7);
                              displayIndices.add(8);
                              displayIndices.add(9);
                              displayIndices.add(10);
                              displayIndices.add(11);
                              pages.add(imageName);
                                 }
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
                              bool oxetClicked = false;
                                  if (!tappedImages.contains("Lamo")) {
                              print("6");
                              var imageName = "Lamo";
                                setState(() {
                                selectedImages[imageName] = currentNumber;
                                currentNumber++;
                                tappedImages.add("Lamo");
                              });
                              pages.add(imageName);
                              displayIndices.add(50);
                                 }
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
                              bool oxetClicked = false;
                                 if (!tappedImages.contains("Paxi")) {
                              print("7");
                              var imageName = "Paxi";
                                setState(() {
                                selectedImages[imageName] = currentNumber;
                                currentNumber++;
                                tappedImages.add("Paxi");
                              });
                              displayIndices.add(33);
                              displayIndices.add(34);
                              displayIndices.add(35);
                              displayIndices.add(36);
                              pages.add(imageName);
                                 }
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
                              bool oxetClicked = false;
                                  if (!tappedImages.contains("Lura")) {
                              print("8");
                              var imageName = "Lura";
                                setState(() {
                                selectedImages[imageName] = currentNumber;
                                currentNumber++;
                                tappedImages.add("Lura");
                              });
                              displayIndices.add(57);
                              pages.add(imageName);
                                 }
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
                              bool oxetClicked = false;
                                 if (!tappedImages.contains("Beta")) {
                              print("9");
                              var imageName = "Beta";
                                setState(() {
                                selectedImages[imageName] = currentNumber;
                                currentNumber++;
                                tappedImages.add(imageName);
                              });
                              displayIndices.add(12);
                              displayIndices.add(13);
                              displayIndices.add(14);
                              displayIndices.add(15);
                              displayIndices.add(16);
                              pages.add(imageName);
                                 }
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
                              bool oxetClicked = false;
                                  if (!tappedImages.contains("Zefr")) {
                              print("10");
                              var imageName = "Zefr";
                                setState(() {
                                selectedImages[imageName] = currentNumber;
                                currentNumber++;
                                tappedImages.add(imageName);
                              });
                              displayIndices.add(51);
                              displayIndices.add(52);
                              pages.add(imageName);
                                 }
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
                              bool oxetClicked = false;
                                 if (!tappedImages.contains("Rasa")) {
                              print("11");
                              var imageName = "Rasa";
                              pages.add(imageName);
                                setState(() {
                                selectedImages[imageName] = currentNumber;
                                currentNumber++;
                                tappedImages.add(imageName);
                              });
                              displayIndices.add(37);
                              displayIndices.add(38);
                              displayIndices.add(39);
                              displayIndices.add(40);
                                 }
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
                              bool oxetClicked = false;
                                  if (!tappedImages.contains("Sizo")) {
                              print("12");
                                  var imageName = "Sizo";
                                  
                              pages.add(imageName);
                                setState(() {
                                selectedImages[imageName] = currentNumber;
                                currentNumber++;
                                tappedImages.add(imageName);
                              });
                              displayIndices.add(58);
                                 }
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
                              bool oxetClicked = false;
                                  if (!tappedImages.contains("Pira")) {
                              print("13");
                                  var imageName = "Pira";
                              pages.add(imageName);
                                setState(() {
                                selectedImages[imageName] = currentNumber;
                                currentNumber++;
                                tappedImages.add(imageName);
                              });
                              displayIndices.add(17);
                              displayIndices.add(18);
                              displayIndices.add(19);
                                 }
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
                              bool oxetClicked = false;
                            if (!tappedImages.contains("Ades")) {
                              print("14");
                                  var imageName = "Ades";
                              pages.add(imageName);
                                setState(() {
                                selectedImages[imageName] = currentNumber;
                                currentNumber++;
                                tappedImages.add(imageName);
                              });
                              displayIndices.add(53);
                                 }
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
                              bool oxetClicked = false;
                                  if (!tappedImages.contains("Syna")) {
                              print("15");    var imageName = "Syna";
                              pages.add(imageName);
                                setState(() {
                                selectedImages[imageName] = currentNumber;
                                currentNumber++;
                                tappedImages.add(imageName);
                              });
                              displayIndices.add(41);
                              displayIndices.add(42);
                              displayIndices.add(43);
                                 }
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
                              bool oxetClicked = false;
                                  if (!tappedImages.contains("Neu-d3")) {
                              print("16");
                                  var imageName = "Neu-d3";
                              pages.add(imageName);
                                setState(() {
                                selectedImages[imageName] = currentNumber;
                                currentNumber++;
                                tappedImages.add(imageName);
                              });
                              displayIndices.add(59);
                                 }
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
                              bool oxetClicked = false;
                                 if (!tappedImages.contains("Park")) {
                              print("17");
                                  var imageName = "Park";
                              pages.add(imageName);
                                setState(() {
                                selectedImages[imageName] = currentNumber;
                                currentNumber++;
                                tappedImages.add(imageName);
                              });
                              displayIndices.add(20);
                              displayIndices.add(21);
                              displayIndices.add(22);
                              displayIndices.add(23);
                              displayIndices.add(24);
                              displayIndices.add(25);
                              displayIndices.add(26);
                                 }
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
                              bool oxetClicked = false;
                                  if (!tappedImages.contains("Atte")) {
                              print("18");
                                    var imageName = "Atte";
                              pages.add(imageName);
                                setState(() {
                                selectedImages[imageName] = currentNumber;
                                currentNumber++;
                                tappedImages.add(imageName);
                              });
                              displayIndices.add(54);
                                 }
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
                              bool oxetClicked = false;
                                 if (!tappedImages.contains("Topi")) {
                              print("19");
                                    var imageName = "Topi";
                              pages.add(imageName);
                                setState(() {
                                selectedImages[imageName] = currentNumber;
                                currentNumber++;
                                tappedImages.add(imageName);
                              });
                              displayIndices.add(44);
                              displayIndices.add(45);
                              displayIndices.add(46);
                              displayIndices.add(47);
                                 }
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
                              bool oxetClicked = false;
                                 if (!tappedImages.contains("Cari")) {
                              print("20");
                                    var imageName = "Cari";
                              pages.add(imageName);
                                setState(() {
                                selectedImages[imageName] = currentNumber;
                                currentNumber++;
                                tappedImages.add(imageName);
                              });
                              displayIndices.add(60);
                              displayIndices.add(61);
                                 }
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
                                  if (!tappedImages.contains("Gab-At")) {
                              print("21");
                                    var imageName = "Gab-At";
                              pages.add(imageName);
                                setState(() {
                                selectedImages[imageName] = currentNumber;
                                currentNumber++;
                                tappedImages.add(imageName);
                              });
                              displayIndices.add(27);
                              displayIndices.add(28);
                                 }
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
                              bool oxetClicked = false;
                                 if (!tappedImages.contains("Ive")) {
                              print("22");
                                    var imageName = "Ive";
                              pages.add(imageName);
                                setState(() {
                                selectedImages[imageName] = currentNumber;
                                currentNumber++;
                                tappedImages.add(imageName);
                              });
                              displayIndices.add(55);
                                 }
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


class Brand extends StatefulWidget {
  const Brand({
    super.key,
    required this.assetName,
    required this.imageName,
    required this.selectedImages,
  });

  final String assetName;
  final String imageName;
  final Map<String, int> selectedImages;

  @override
  _BrandState createState() => _BrandState();
}

class _BrandState extends State<Brand> {
  // bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    int? selectionNumber = widget.selectedImages[widget.imageName]; // Get the number for this image
    return Stack(
      children: [
        SizedBox(
          height: 75,
          child: Image.asset(
            widget.assetName,
            height: 70,
            // color: isTapped ? Colors.grey : null, // Color image when tapped
          ),
        ),
        if (selectionNumber != null && selectionNumber > 0)
          Positioned(
            bottom: 42,
            child: InkWell(
              onTap: () {
                // setState(() {
                //   isTapped = true; // Disable further taps
                // });
                // Handle tap action here if needed
              },
              child: Container(
                padding: const EdgeInsets.only(top: 3, bottom: 7, right: 5, left: 5),
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/MainPage/numberBg.png")),
                ),
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      (selectionNumber >= 10) ? '$selectionNumber' : '0$selectionNumber',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
