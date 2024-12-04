import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(padding: const EdgeInsets.all(18.0),
          child: Container(
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                hintText: "From"
              ),
            ),
          ),),
          Padding(padding: const EdgeInsets.all(18.0),
            child: Container(
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    hintText: "To"
                ),
              ),
            ),)
        ],
      ),
    );
  }
}
