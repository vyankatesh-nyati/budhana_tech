import 'package:budhana_tech_task/config/colors.dart';
import 'package:budhana_tech_task/enums/booking.dart';
import 'package:budhana_tech_task/models/vehical.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class VehicalScreen extends StatefulWidget {
  const VehicalScreen({super.key});

  @override
  State<VehicalScreen> createState() => _VehicalScreenState();
}

class _VehicalScreenState extends State<VehicalScreen> {
  String date = DateFormat.yMd().format(DateTime.now());
  String time = DateFormat.Hm().format(DateTime.now());
  int selectedVehicalIndex = 0;
  BookingEnum bookingType = BookingEnum.bookingForMyself;

  List<VehicalModel> vehicalsList = [
    VehicalModel(
      image: "assets/images/sedan.jpg",
      title: "Sedan",
      subTitle: "Maruti Swift Dzire Or Similar",
      price: 3729,
    ),
    VehicalModel(
      image: "assets/images/suv.webp",
      title: "SUV",
      subTitle: "Toyota Innova 6+1 Or Similar",
      price: 5832,
    ),
    VehicalModel(
      image: "assets/images/creta.webp",
      title: "Creta",
      subTitle: "Maruti Swift Dzire Or Similar",
      price: 8068,
    ),
    VehicalModel(
      image: "assets/images/toyto.webp",
      title: "Toyto",
      subTitle: "Maruti Swift Dzire Or Similar",
      price: 10000,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: transparent,
        ),
        extendBodyBehindAppBar: true,
        body: Column(
          children: [
            Image.asset(
              "assets/images/direction.jpeg",
              height: MediaQuery.of(context).size.height * 0.35,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: green,
                        size: 28,
                      ),
                      SizedBox(
                        height: 28,
                        child: DottedLine(
                          direction: Axis.vertical,
                          dashColor: grey,
                        ),
                      ),
                      Icon(
                        Icons.location_on_outlined,
                        color: red,
                        size: 28,
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Source Location",
                      style: TextStyle(
                        color: grey,
                      ),
                    ),
                    const Text(
                      "Banglore, Karanataka, India",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: const Divider(),
                    ),
                    const Text(
                      "Destination Location",
                      style: TextStyle(
                        color: grey,
                      ),
                    ),
                    const Text(
                      "Mysuru, Karanataka, India",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Top Suggestions for you",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Column(
                    children: [
                      const Text(
                        "Pickup Date Time",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      OutlinedButton.icon(
                        onPressed: () async {
                          final DateTime? dateTime = await showDatePicker(
                            context: context,
                            firstDate: DateTime.now(),
                            initialDate: DateTime.now(),
                            lastDate: DateTime(3000),
                            initialEntryMode: DatePickerEntryMode.calendarOnly,
                          );
                          if (dateTime != null) {
                            if (context.mounted) {
                              final TimeOfDay? timeDate = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );
                              if (timeDate != null) {
                                setState(() {
                                  time = timeDate.format(context);
                                });
                              }
                            }
                            setState(() {
                              date = DateFormat.yMd().format(dateTime);
                            });
                          }
                        },
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        icon: const Icon(
                          Icons.calendar_month_outlined,
                          color: grey,
                        ),
                        label: Text(
                          "$date $time",
                          style: const TextStyle(
                            color: black,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: vehicalsList.length,
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: 20,
                ),
                itemBuilder: (context, index) {
                  return Card(
                    elevation: index == selectedVehicalIndex ? 6 : 0,
                    surfaceTintColor: white,
                    child: ListTile(
                      shape: index == selectedVehicalIndex
                          ? RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(color: grey),
                            )
                          : null,
                      onTap: () {
                        setState(() {
                          selectedVehicalIndex = index;
                        });
                      },
                      leading: SizedBox(
                        height: 80,
                        width: 80,
                        child: Image.asset(vehicalsList[index].image),
                      ),
                      title: Text(
                        vehicalsList[index].title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(vehicalsList[index].subTitle),
                      trailing: Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.currency_rupee_outlined,
                                size: 16,
                                color: green,
                              ),
                              Text(
                                vehicalsList[index].price.toString(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: green,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Icon(Icons.info_outline)
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              children: [
                const SizedBox(width: 12),
                bookingType == BookingEnum.bookingForMyself
                    ? Chip(
                        label: Row(
                          children: [
                            const Icon(Icons.done, size: 18),
                            const SizedBox(width: 6),
                            Text(BookingEnum.bookingForMyself.type)
                          ],
                        ),
                        backgroundColor: black.withOpacity(0.1),
                      )
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            bookingType = BookingEnum.bookingForMyself;
                          });
                        },
                        child: Chip(
                          label: Text(BookingEnum.bookingForMyself.type),
                        ),
                      ),
                const SizedBox(width: 12),
                bookingType == BookingEnum.bookingForOthers
                    ? Chip(
                        label: Row(
                          children: [
                            const Icon(Icons.done, size: 18),
                            const SizedBox(width: 6),
                            Text(BookingEnum.bookingForOthers.type)
                          ],
                        ),
                        backgroundColor: black.withOpacity(0.1),
                      )
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            bookingType = BookingEnum.bookingForOthers;
                          });
                        },
                        child: Chip(
                          label: Text(BookingEnum.bookingForOthers.type),
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
