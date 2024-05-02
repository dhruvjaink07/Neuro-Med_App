import 'package:flutter/material.dart';
import 'package:neuro_app/Pages/BETA/page13.dart';
import 'package:neuro_app/Pages/BETA/page14.dart';
import 'package:neuro_app/Pages/BETA/page15.dart';
import 'package:neuro_app/Pages/BETA/page16.dart';
import 'package:neuro_app/Pages/BETA/page17.dart';
import 'package:neuro_app/Pages/LIOF/page10.dart';
import 'package:neuro_app/Pages/LIOF/page11.dart';
import 'package:neuro_app/Pages/LIOF/page12.dart';
import 'package:neuro_app/Pages/LIOF/page7.dart';
import 'package:neuro_app/Pages/LIOF/page8.dart';
import 'package:neuro_app/Pages/LIOF/page9.dart';
import 'package:neuro_app/Pages/OXET/page1.dart';
import 'package:neuro_app/Pages/OXET/page2.dart';
import 'package:neuro_app/Pages/OXET/page3.dart';
import 'package:neuro_app/Pages/OXET/page4.dart';
import 'package:neuro_app/Pages/OXET/page5.dart';
import 'package:neuro_app/Pages/OXET/page6.dart';
class OxetPageControllerWidget extends StatefulWidget {
   OxetPageControllerWidget({Key? key, required this.displayIndices});
 final List<int> displayIndices;
  @override
  _OxetPageControllerWidgetState createState() =>
      _OxetPageControllerWidgetState();
}

class _OxetPageControllerWidgetState extends State<OxetPageControllerWidget> {
  late PageController _pageController;
  int _currentPageIndex = 0;
  // List<int> displayIndices = [0, 2, 4, 6,5]; // Indices to display

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void goToNextPage() {
    if (_currentPageIndex < widget.displayIndices.length - 1) {
      _currentPageIndex++;
      _pageController.animateToPage(
        widget.displayIndices[_currentPageIndex],
        duration: Duration(milliseconds: 100),
        curve: Curves.easeInOut,
      );
    }
  }

  void goToPreviousPage() {
    if (_currentPageIndex > 0) {
      _currentPageIndex--;
      _pageController.animateToPage(
        widget.displayIndices[_currentPageIndex],
        duration: Duration(milliseconds: 100),
        curve: Curves.easeInOut,
      );
    }
  }

  void changePageIndex(int index) {
    if (index >= 0 && index < widget.displayIndices.length) {
      _pageController.animateToPage(
        widget.displayIndices[index],
        duration: Duration(milliseconds: 100),
        curve: Curves.easeInOut,
      );
    } else {
      // Handle out-of-range index error here
      print('Error: Invalid index provided for page navigation.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: widget.displayIndices.length,
        onPageChanged: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        itemBuilder: (context, index) {
          final pageIndex =widget.displayIndices[index];
          switch (pageIndex) {
            case 0:
              return Page1(
                goToNextPage: goToNextPage,
                changePageIndex: changePageIndex,
              );
            case 1:
              return Page2(
                goToPreviousPage: goToPreviousPage,
                goToNextPage: goToNextPage,
              );
            case 2:
              return Page3(
                goToPreviousPage: goToPreviousPage,
                goToNextPage: goToNextPage,
              );
            case 3:
              return Page4(
                goToPreviousPage: goToPreviousPage,
                goToNextPage: goToNextPage,
              );
            case 4:
              return Page5(
                goToPreviousPage: goToPreviousPage,
                goToNextPage: goToNextPage,
              );
            case 5:
              return Page6(
                goToPreviousPage: goToPreviousPage,
                goToNextPage: goToNextPage,
              );
            case 6:
              return Page7(
                goToPreviousPage: goToPreviousPage,
                goToNextPage: goToNextPage, changePageIndex:changePageIndex,
              );
            case 7:
              return Page8(
                goToPreviousPage: goToPreviousPage,
                goToNextPage: goToNextPage,
              );
            case 8:
              return Page9(goToPreviousPage: goToPreviousPage, goToNextPage: goToNextPage);
            case 9:
              return Page10(goToPreviousPage: goToPreviousPage, goToNextPage: goToNextPage);
            case 10: 
              return Page11(goToPreviousPage: goToPreviousPage, goToNextPage: goToNextPage);
            case 11:
              return Page12(goToPreviousPage: goToPreviousPage, goToNextPage: goToNextPage);
            case 12:
  return Page13(
    goToPreviousPage: goToPreviousPage,
    goToNextPage: goToNextPage,
    changePageIndex: changePageIndex,
  );

            case 13:
              return Page14(goToPreviousPage: goToPreviousPage, goToNextPage: goToNextPage);
            case 14:
              return Page15(goToPreviousPage: goToPreviousPage, goToNextPage: goToNextPage);
            case 15:
              return Page16(goToPreviousPage: goToPreviousPage,goToNextPage: goToNextPage,);
            case 16: 
              return Page17(goToPreviousPage: goToPreviousPage, goToNextPage: goToNextPage);
            default:
              return Container(); // Placeholder for any additional pages
          }
        },
      ),
    );
  }
}
