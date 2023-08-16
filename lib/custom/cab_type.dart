import 'package:budhana_tech_task/config/colors.dart';
import 'package:budhana_tech_task/custom/common/button.dart';
import 'package:budhana_tech_task/custom/common/container.dart';
import 'package:budhana_tech_task/custom/common/search_bar.dart';
import 'package:budhana_tech_task/enums/trip.dart';
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

  TripEnum tripType = TripEnum.oneWay;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 50,
              child: AppBar(
                backgroundColor: white,
                bottom: TabBar(
                  labelColor: black,
                  unselectedLabelColor: grey,
                  indicatorColor: black,
                  tabs: [
                    for (var value in cabTypeList)
                      Tab(
                        child: Column(
                          children: [
                            Icon(value["logo"], size: 24),
                            Text(value["title"]),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.45,
            child: TabBarView(
              children: [
                const Column(
                  children: [
                    SizedBox(height: 16),
                    CustomContainer(
                      child: CustomSearchBar(labelText: "Destination"),
                    ),
                    SizedBox(height: 30),
                    CustomButton(buttonText: "Next"),
                    SizedBox(height: 30)
                  ],
                ),
                const Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 16),
                    CustomContainer(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 24,
                          horizontal: 16,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Select packages",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 12),
                            Row(
                              children: [
                                CustomContainer(
                                  boxConstraints: BoxConstraints(
                                    maxWidth: 60,
                                  ),
                                  margin: null,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 6),
                                      Text(
                                        "8 Hr",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "80 KM",
                                        style: TextStyle(
                                          color: grey,
                                        ),
                                      ),
                                      SizedBox(height: 6),
                                    ],
                                  ),
                                ),
                                CustomContainer(
                                  boxConstraints: BoxConstraints(
                                    maxWidth: 60,
                                  ),
                                  // margin: null,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 6),
                                      Text(
                                        "10 Hr",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "100 KM",
                                        style: TextStyle(
                                          color: grey,
                                        ),
                                      ),
                                      SizedBox(height: 6),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    CustomButton(buttonText: "Next"),
                    SizedBox(height: 30)
                  ],
                ),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(height: 16),
                    CustomContainer(
                      child: Column(
                        children: [
                          const CustomSearchBar(labelText: "Destination"),
                          Row(
                            children: [
                              const SizedBox(width: 12),
                              tripType == TripEnum.oneWay
                                  ? ElevatedButton.icon(
                                      onPressed: null,
                                      icon: const Icon(Icons.done),
                                      label: Text(TripEnum.oneWay.type),
                                      style: ElevatedButton.styleFrom(
                                        disabledForegroundColor: black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    )
                                  : OutlinedButton(
                                      onPressed: () {
                                        setState(() {
                                          tripType = TripEnum.oneWay;
                                        });
                                      },
                                      style: OutlinedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      child: Text(
                                        TripEnum.oneWay.type,
                                        style: const TextStyle(
                                          color: black,
                                        ),
                                      ),
                                    ),
                              const SizedBox(width: 12),
                              tripType == TripEnum.roundTrip
                                  ? ElevatedButton.icon(
                                      onPressed: null,
                                      icon: const Icon(Icons.done),
                                      label: Text(TripEnum.roundTrip.type),
                                      style: ElevatedButton.styleFrom(
                                        disabledForegroundColor: black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    )
                                  : OutlinedButton(
                                      onPressed: () {
                                        setState(() {
                                          tripType = TripEnum.roundTrip;
                                        });
                                      },
                                      style: OutlinedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      child: Text(
                                        TripEnum.roundTrip.type,
                                        style: const TextStyle(
                                          color: black,
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                          const SizedBox(height: 26),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    const CustomButton(buttonText: "Next"),
                    const SizedBox(height: 30)
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
