import 'package:corp_cab_app/app/providers/driver_provider.dart';
import 'package:corp_cab_app/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DriverListPage extends StatelessWidget {
  const DriverListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select drivers',
          style: TextStyle(
            fontSize: MediaQueryExtension(context).defaultValue * 2,
            color: Colors.white,
          ),
        ),
      ),
      body: Consumer<DriverProvider>(
        builder: (context, providerItem, child) {
          if (providerItem.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (providerItem.drivers.isEmpty) {
            return const Center(
              child: Text(
                'No drivers available',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            );
          }
          return ListView.builder(
            itemCount: providerItem.drivers.length,
            itemBuilder: (context, index) {
              final driver = providerItem.drivers[index];
              final isSelected = driver == providerItem.selectedDriver;
              return Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  color: isSelected ? const Color(0xff7b81ed) : null,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey.shade300,
                    child: const Icon(Icons.person, color: Colors.black),
                  ),
                  title: Text(
                    driver.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Rating: ${driver.rating.toStringAsFixed(1)}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                  trailing: isSelected
                      ? const Icon(Icons.check_circle, color: Colors.white)
                      : const Icon(Icons.circle_outlined),
                  onTap: () {
                    providerItem.selectDriver(driver);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${driver.name} selected')),
                    );
                  },
                  // tileColor:
                ),
              );
            },
          );
        },
      ),
    );
  }
}
