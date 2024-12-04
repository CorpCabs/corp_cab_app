import 'package:auto_route/auto_route.dart';
import 'package:corp_cab_app/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ScaffoldWithNavbar extends StatelessWidget {

 ScaffoldWithNavbar({super.key,});
  // Sample vehicle data
  final List<Map<String, dynamic>> vehicleData = [
    {'title': 'Economy', 'price': '548₽', 'imagePath': 'assets/economy.png', 'isSelected': true},
    {'title': 'Comfort', 'price': '864₽', 'imagePath': 'assets/comfort.png', 'isSelected': false},
    {'title': 'Business', 'price': '1200₽', 'imagePath': 'assets/business.png', 'isSelected': false},
    {'title': 'Luxury', 'price': '1800₽', 'imagePath': 'assets/luxury.png', 'isSelected': false},
  ];
  // const ScaffoldWithNavbar({required this.navigationShell,super.key,});
  // final StatefulNavigationShell navigationShell;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            expandedHeight: MediaQueryExtension(context).veryhighValue2x,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text('Hi Jane'),
              centerTitle: true,
            ),
          ),
          SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQueryExtension(context).veryhighValue1x,),
                  TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'From',
                      labelStyle: const TextStyle(color: Colors.black),
                      hintText: 'Gvozdeva St. 11, Moscow',
                      hintStyle: const TextStyle(color: Colors.black),
                      filled: true,
                      // fillColor: Colors.grey[900],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        // borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQueryExtension(context).defaultValue,),
                  TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'To',
                      labelStyle: const TextStyle(color: Colors.black),
                      hintText: 'Rubenshtein St. 17/2, Moscow',
                      hintStyle: const TextStyle(color: Colors.black),
                      filled: true,
                      // fillColor: Colors.grey[900],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        // borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  Flexible(child: GridView.builder(
                      shrinkWrap: true,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 12, // Spacing between rows
                          crossAxisSpacing: 12, // Spacing between columns
                          childAspectRatio: 1.2, // Aspect ratio of the cards
                        ),
                        itemCount: vehicleData.length,
                        itemBuilder: (context, index){
                          final vehicle = vehicleData[index];
                          return _buildVehicleCard(
                            vehicle['title'] as String,
                            vehicle['price'] as String,
                            vehicle['imagePath'] as String,
                            vehicle['isSelected'] as bool,
                          );
                        },),),
                  Center(
                    child: ElevatedButton(onPressed: (){}, child: const Text('Order', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),)),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: navigationShell.currentIndex,
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //     BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      //   ],
      //   onTap: _onTap,
      // ),
    ),);
  }
  //  void _onTap(int index) {
  //   navigationShell.goBranch(
  //     index,
  //     // A common pattern when using bottom navigation bars is to support
  //     // navigating to the initial location when tapping the item that is
  //     // already active. This example demonstrates how to support this behavior,
  //     // using the initialLocation parameter of goBranch.
  //     initialLocation: index == navigationShell.currentIndex,
  //   );
  // }

}

Widget _buildVehicleCard(String title, String price, String imagePath, bool isSelected) {
  return Container(
    decoration: BoxDecoration(
      color: isSelected ? Colors.purple[100] : Colors.grey[900],
      borderRadius: BorderRadius.circular(10),
      border: isSelected ? Border.all(color: Colors.purple, width: 2) : null,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imagePath,
          height: 50,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.purple : Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          price,
          style: TextStyle(
            color: isSelected ? Colors.purple : Colors.grey,
            fontSize: 12,
          ),
        ),
      ],
    ),
  );
}



