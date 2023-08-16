import 'package:budhana_tech_task/config/colors.dart';
import 'package:budhana_tech_task/custom/common/button.dart';
import 'package:budhana_tech_task/custom/common/container.dart';
import 'package:budhana_tech_task/custom/common/search_bar.dart';
import 'package:budhana_tech_task/enums/trip.dart';
import 'package:budhana_tech_task/screens/vehical.dart';
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

  void onClickNextHandler() => {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const VehicalScreen(),
          ),
        )
      };

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
                Column(
                  children: [
                    const SizedBox(height: 16),
                    const CustomContainer(
                      child: CustomSearchBar(labelText: "Destination"),
                    ),
                    const SizedBox(height: 30),
                    CustomButton(
                        buttonText: "Next", onPressed: onClickNextHandler),
                    const SizedBox(height: 30)
                  ],
                ),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    const CustomContainer(
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
                    CustomButton(
                      buttonText: "Next",
                      onPressed: onClickNextHandler,
                    ),
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
                                  ? Chip(
                                      label: Row(
                                        children: [
                                          const Icon(Icons.done, size: 18),
                                          const SizedBox(width: 6),
                                          Text(TripEnum.oneWay.type)
                                        ],
                                      ),
                                      backgroundColor: black.withOpacity(0.1),
                                    )
                                  : GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          tripType = TripEnum.oneWay;
                                        });
                                      },
                                      child: Chip(
                                        label: Text(TripEnum.oneWay.type),
                                      ),
                                    ),
                              const SizedBox(width: 12),
                              tripType == TripEnum.roundTrip
                                  ? Chip(
                                      label: Row(
                                        children: [
                                          const Icon(Icons.done, size: 18),
                                          const SizedBox(width: 6),
                                          Text(TripEnum.roundTrip.type)
                                        ],
                                      ),
                                      backgroundColor: black.withOpacity(0.1),
                                    )
                                  : GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          tripType = TripEnum.roundTrip;
                                        });
                                      },
                                      child: Chip(
                                        label: Text(TripEnum.roundTrip.type),
                                      ),
                                    ),
                            ],
                          ),
                          const SizedBox(height: 26),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    CustomButton(
                      buttonText: "Next",
                      onPressed: onClickNextHandler,
                    ),
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
