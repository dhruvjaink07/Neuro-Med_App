// import 'package:flutter/material.dart';
// import 'package:neuro_app/Pages/LIOF/page7.dart';
// import 'package:neuro_app/Pages/LIOF/page8.dart';

// class LiofPageControllerWidget extends StatefulWidget {
//   const LiofPageControllerWidget({Key? key,}) : super(key: key);

//   @override
//   _LiofPageControllerWidgetState createState() => _LiofPageControllerWidgetState();
// }

// class _LiofPageControllerWidgetState extends State<LiofPageControllerWidget> {
//   late PageController _pageController;
//   int _currentPageIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController(initialPage: _currentPageIndex);
//   }

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   void goToNextPage() {
//     if (_currentPageIndex < 2) {
//       _currentPageIndex++;
//       _pageController.animateToPage(
//         _currentPageIndex,
//         duration: Duration(milliseconds: 100),
//         curve: Curves.easeInOut,
//       );
//     }
//   }

//   void goToPreviousPage() {
//     if (_currentPageIndex > 0) {
//       _currentPageIndex--;
//       _pageController.animateToPage(
//         _currentPageIndex,
//         duration: Duration(milliseconds: 100),
//         curve: Curves.easeInOut,
//       );
//     }
//   }

//   void changePageIndex(int index) {
//     _pageController.animateToPage(
//       index,
//       duration: Duration(milliseconds: 100),
//       curve: Curves.easeInOut,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(
//         controller: _pageController,
//         onPageChanged: (index) {
//           setState(() {
//             _currentPageIndex = index;
//           });
//         },
//         children: [
//           Page7(goToNextPage: goToNextPage,goToPreviousPage: goToPreviousPage,),
//           Page8(goToPreviousPage: goToPreviousPage, goToNextPage: goToNextPage)
//         ],
//       ),
//     );
//   }
// }
