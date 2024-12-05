import 'package:auto_route/auto_route.dart';
import 'package:corp_cab_app/app/common/commonTextField.dart';
import 'package:corp_cab_app/app/providers/cab_booking_provider.dart';
import 'package:corp_cab_app/core/extensions/context_extensions.dart';
import 'package:corp_cab_app/feature/ScaffoldWithNavbar/components/vehicleCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<CabBookingProvider>(
      builder: (context, providerItem, child) {
        return Scaffold(
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
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          gradient: LinearGradient(
                            colors: [Color(0xffffffff), Color(0xff6200ee)],
                            stops: [0, 0.5],
                            begin: Alignment(1.5, -1),
                            end: Alignment.bottomLeft,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // SizedBox(height: MediaQueryExtension(context).veryhighValue1x,),
                              commonTextField(
                                labelText: 'From',
                                hintText: 'Enter your location',
                              ),
                              SizedBox(
                                height: MediaQueryExtension(context).lowValue,
                              ),
                              commonTextField(
                                labelText: 'To',
                                hintText: 'Enter your destination',
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQueryExtension(context).defaultValue,
                      ),
                      Flexible(
                        child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 12, // Spacing between rows
                            crossAxisSpacing: 12, // Spacing between columns
                            childAspectRatio: 1.2, // Aspect ratio of the cards
                          ),
                          itemCount: providerItem.vehicleData.length,
                          itemBuilder: (context, index) {
                            final vehicle = providerItem.vehicleData[index];
                            return buildVehicleCard(
                              vehicle['title'] as String,
                              vehicle['price'] as String,
                              vehicle['isSelected'] as bool,
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: MediaQueryExtension(context).defaultValue,
                      ),
                      Center(
                        child: SizedBox(
                          height:
                              MediaQueryExtension(context).dynamicHeight(0.07),
                          width: MediaQueryExtension(context).dynamicWidth(0.5),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text(
                              'Order',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
