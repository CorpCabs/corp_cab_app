// import 'package:auto_route/auto_route.dart';
// import 'package:corp_cab_app/app/common/commonTextField.dart';
// import 'package:corp_cab_app/core/extensions/context_extensions.dart';
// import 'package:corp_cab_app/feature/ScaffoldWithNavbar/components/vehicleCard.dart';
// import 'package:flutter/material.dart';

// @RoutePage()
// class ScaffoldWithNavbar extends StatelessWidget {
//   ScaffoldWithNavbar({
//     super.key,
//   });
//   // Sample vehicle data
//   final List<Map<String, dynamic>> vehicleData = [
//     {
//       'title': 'Economy',
//       'price': '548₽',
//       'imagePath': 'assets/economy.png',
//       'isSelected': true,
//     },
//     {
//       'title': 'Comfort',
//       'price': '864₽',
//       'imagePath': 'assets/comfort.png',
//       'isSelected': false,
//     },
//     {
//       'title': 'Business',
//       'price': '1200₽',
//       'imagePath': 'assets/business.png',
//       'isSelected': false,
//     },
//     {
//       'title': 'Luxury',
//       'price': '1800₽',
//       'imagePath': 'assets/luxury.png',
//       'isSelected': false,
//     },
//     {
//       'title': 'Luxury',
//       'price': '1800₽',
//       'imagePath': 'assets/luxury.png',
//       'isSelected': false,
//     },
//   ];
//   // const ScaffoldWithNavbar({required this.navigationShell,super.key,});
//   // final StatefulNavigationShell navigationShell;
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: CustomScrollView(
//           slivers: [
//             SliverAppBar(
//               pinned: true,
//               floating: true,
//               expandedHeight: MediaQueryExtension(context).veryhighValue2x,
//               flexibleSpace: const FlexibleSpaceBar(
//                 title: Text('Hi Jane'),
//                 centerTitle: true,
//               ),
//             ),
//             SliverFillRemaining(
//               child: Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: Column(
//                   children: [
//                     Container(
//                       decoration: const BoxDecoration(
//                         borderRadius: BorderRadius.all(Radius.circular(10)),
//                         gradient: LinearGradient(
//                           colors: [Color(0xffffffff), Color(0xff6200ee)],
//                           stops: [0, 0.5],
//                           begin: Alignment(1.5, -1),
//                           end: Alignment.bottomLeft,
//                         ),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(8),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           // crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             // SizedBox(height: MediaQueryExtension(context).veryhighValue1x,),
//                             commonTextField(
//                               labelText: 'From',
//                               hintText: 'Enter your location',
//                             ),
//                             SizedBox(
//                               height: MediaQueryExtension(context).lowValue,
//                             ),
//                             commonTextField(
//                               labelText: 'To',
//                               hintText: 'Enter your destination',
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: MediaQueryExtension(context).defaultValue,
//                     ),
//                     Flexible(
//                       child: GridView.builder(
//                         shrinkWrap: true,
//                         gridDelegate:
//                             const SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 2,
//                           mainAxisSpacing: 12, // Spacing between rows
//                           crossAxisSpacing: 12, // Spacing between columns
//                           childAspectRatio: 1.2, // Aspect ratio of the cards
//                         ),
//                         itemCount: vehicleData.length,
//                         itemBuilder: (context, index) {
//                           final vehicle = vehicleData[index];
//                           return buildVehicleCard(
//                             vehicle['title'] as String,
//                             vehicle['price'] as String,
//                             vehicle['isSelected'] as bool,
//                           );
//                         },
//                       ),
//                     ),
//                     SizedBox(
//                       height: MediaQueryExtension(context).defaultValue,
//                     ),
//                     Center(
//                       child: SizedBox(
//                         height:
//                             MediaQueryExtension(context).dynamicHeight(0.07),
//                         width: MediaQueryExtension(context).dynamicWidth(0.5),
//                         child: ElevatedButton(
//                           onPressed: () {},
//                           child: const Text(
//                             'Order',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//         // bottomNavigationBar: BottomNavigationBar(
//         //   currentIndex: navigationShell.currentIndex,
//         //   items: const [
//         //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//         //     BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
//         //   ],
//         //   onTap: _onTap,
//         // ),
//       ),
//     );
//   }
//   //  void _onTap(int index) {
//   //   navigationShell.goBranch(
//   //     index,
//   //     // A common pattern when using bottom navigation bars is to support
//   //     // navigating to the initial location when tapping the item that is
//   //     // already active. This example demonstrates how to support this behavior,
//   //     // using the initialLocation parameter of goBranch.
//   //     initialLocation: index == navigationShell.currentIndex,
//   //   );
//   // }
// }
