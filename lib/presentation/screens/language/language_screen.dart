import 'package:flutter/material.dart';

import '../data/data_screen.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[100],
      body:  Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Select alignment',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  const DataScreen(alignment: "LTR")),
                      );                      },
                    child: const Text("left-to-right"),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  const DataScreen(alignment: "RTL")),
                      );
                    },
                    child: const Text("right-to-left"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
