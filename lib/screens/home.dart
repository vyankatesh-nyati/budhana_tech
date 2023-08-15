import 'package:budhana_tech_task/config/colors.dart';
import 'package:budhana_tech_task/custom/cabType.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CABTO"),
        centerTitle: true,
      ),
      drawer: const Drawer(),
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                "assets/images/map.jpeg",
                height: MediaQuery.of(context).size.height * 0.45,
                fit: BoxFit.cover,
              ),
              const Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: white,
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              )
            ],
          ),
          const CabTypeWidget(),
        ],
      ),
    );
  }
}
