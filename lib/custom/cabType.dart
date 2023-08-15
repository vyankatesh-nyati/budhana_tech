import 'package:budhana_tech_task/config/colors.dart';
import 'package:flutter/material.dart';

class CabTypeWidget extends StatefulWidget {
  const CabTypeWidget({super.key});

  @override
  State<CabTypeWidget> createState() => _CabTypeWidgetState();
}

class _CabTypeWidgetState extends State<CabTypeWidget> {
  List<Map<String, dynamic>> cabTypeList = [
    {"logo": Icons.local_taxi_outlined, "title": "CityCab"},
    {"logo": Icons.car_rental_outlined, "title": "Rental"},
    {"logo": Icons.hail_outlined, "title": "Outstation"},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (var value in cabTypeList)
              Column(
                children: [
                  Icon(value["logo"]),
                  Text(value["title"]),
                  Container(
                    color: yellow,
                    child: Text(
                      value["title"],
                      style: const TextStyle(
                        color: yellow,
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
