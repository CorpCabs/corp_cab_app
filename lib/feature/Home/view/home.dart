import 'package:auto_route/auto_route.dart';
import 'package:corp_cab_app/app/common/commonTextField.dart';
import 'package:corp_cab_app/app/common/toast.dart';
import 'package:corp_cab_app/app/providers/cab_booking_provider.dart';
import 'package:corp_cab_app/app/validators/text_field_validator.dart';
import 'package:corp_cab_app/core/extensions/context_extensions.dart';
import 'package:corp_cab_app/core/utils/logger/logger_utils.dart';
import 'package:corp_cab_app/feature/ScaffoldWithNavbar/components/vehicleCard.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  HomePage({super.key});

  final fromController = TextEditingController();
  final toController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // @override
  // Widget build(BuildContext context) {
  //   return Consumer<CabBookingProvider>(
  //     builder: (context, providerItem, child) {
  //       return Scaffold(
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
  //                         child: Form(
  //                           key: _formKey,
  //                           child: Column(
  //                             mainAxisSize: MainAxisSize.min,
  //                             // crossAxisAlignment: CrossAxisAlignment.start,
  //                             children: [
  //                               commonTextField(
  //                                 labelText: 'From',
  //                                 hintText: 'Enter your location',
  //                                 context: context,
  //                                 controller: fromController,
  //                                 validator: (String? value) =>
  //                                     validateField(value, 'From'),
  //                                 onChanged: (value) {
  //                                   LoggerUtils.instance.logInfo(value);
  //                                 },
  //                               ),
  //                               SizedBox(
  //                                 height: MediaQueryExtension(context).lowValue,
  //                               ),
  //                               commonTextField(
  //                                 labelText: 'To',
  //                                 hintText: 'Enter your destination',
  //                                 context: context,
  //                                 controller: toController,
  //                                 validator: (String? value) {
  //                                   return validateField(value, 'To');
  //                                 },
  //                                 onChanged: (value) {
  //                                   LoggerUtils.instance.logInfo(value);
  //                                 },
  //                               ),
  //                             ],
  //                           ),
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
  //                         itemCount: providerItem.vehicleData.length,
  //                         itemBuilder: (context, index) {
  //                           final vehicle = providerItem.vehicleData[index];
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
  //                           onPressed: () {
  //                             if (_formKey.currentState!.validate()) {
  //                               LoggerUtils.instance.logInfo(
  //                                 'From: ${fromController.text}, To: ${toController.text}',
  //                               );
  //                               // Perform further actions like making an API call
  //                               if (fromController.text.isEmpty ||
  //                                   toController.text.isEmpty) {
  //                                 context
  //                                     .read<CabBookingProvider>()
  //                                     .setError(true);
  //                               } else {
  //                                 context
  //                                     .read<CabBookingProvider>()
  //                                     .setError(false);
  //                               }
  //                             } else {
  //                               LoggerUtils.instance
  //                                   .logError('Validation failed');
  //                             }
  //                           },
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
  //       );
  //     },
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hey Jude'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                gradient: LinearGradient(
                  colors: [Color(0xffffffff), Color(0xff7b81ed)],
                  stops: [0.001, 0.09],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      commonTextField(
                        labelText: 'From',
                        hintText: 'Enter your location',
                        context: context,
                        controller: fromController,
                        validator: (String? value) =>
                            validateField(value, 'From'),
                        onChanged: (value) {
                          LoggerUtils.instance.logInfo(value);
                        },
                      ),
                      SizedBox(
                        height: MediaQueryExtension(context).lowValue,
                      ),
                      commonTextField(
                        labelText: 'To',
                        hintText: 'Enter your destination',
                        context: context,
                        controller: toController,
                        validator: (String? value) =>
                            validateField(value, 'To'),
                        onChanged: (value) {
                          LoggerUtils.instance.logInfo(value);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQueryExtension(context).defaultValue,
            ),
            Expanded(
              child: Consumer<CabBookingProvider>(
                builder: (context, providerItem, child) {
                  return GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 1.2,
                    ),
                    itemCount: providerItem.vehicleData.length,
                    itemBuilder: (context, index) {
                      final vehicle = providerItem.vehicleData[index];
                      return GestureDetector(
                        onTap: () {
                          Provider.of<CabBookingProvider>(
                            context,
                            listen: false,
                          ).setSelectedIndex(index);
                        },
                        child: buildVehicleCard(
                          vehicle.title,
                          vehicle.price,
                          index ==
                                  Provider.of<CabBookingProvider>(
                                    context,
                                    listen: false,
                                  ).selectedIndex
                              ? true
                              : false,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: MediaQueryExtension(context).defaultValue,
            ),
            Center(
              child: SizedBox(
                height: MediaQueryExtension(context).dynamicHeight(0.07),
                width: MediaQueryExtension(context).dynamicWidth(0.5),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (fromController.text.isEmpty ||
                          toController.text.isEmpty ||
                          context.read<CabBookingProvider>().selectedIndex ==
                              -1) {
                        context.read<CabBookingProvider>().setError(true);
                        ToastUtils.showErrorToast(
                          'Please fill in all the fields to book a cab',
                        );
                      } else {
                        context.read<CabBookingProvider>().setError(false);

                        // Update Provider State
                        context
                            .read<CabBookingProvider>()
                            .setDropOffLocation(toController.text.trim());
                        context
                            .read<CabBookingProvider>()
                            .setPickupLocation(fromController.text.trim());

                        LoggerUtils.instance.logInfo(
                          'From: ${fromController.text}, To: ${toController.text}, Selected Index: ${context.read<CabBookingProvider>().selectedIndex}',
                        );

                        // Navigate to Driver List Page
                        context.go('/home/driver-list');
                      }
                    } else {
                      LoggerUtils.instance.logError('Validation failed');
                    }
                  },
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
    );
  }
}
