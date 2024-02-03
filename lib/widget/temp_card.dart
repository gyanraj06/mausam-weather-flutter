// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';

class TempCard extends StatelessWidget {
  double temperature;
  double high_today;
  double low_today;
  double feels_like;
  String description;

  TempCard({
    super.key,
    required this.temperature,
    required this.high_today,
    required this.low_today,
    required this.feels_like,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        width: screenWidth,
        height: 200,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Temperature Today",
                style: TextStyle(
                  color: Color(0xFF161618),
                  fontSize: 22,
                ),
              ),
              Row(
                children: [
                  Text(
                    temperature.toString(),
                    style: const TextStyle(
                      color: Color(0xFFE21A41),
                      fontSize: 50,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Text(
                    "°",
                    style: TextStyle(
                      color: Color(0xFFE21A41),
                      fontSize: 50,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),

              //!* High and Low

              Row(
                children: [
                  const Icon(
                    Icons.arrow_upward_rounded,
                    color: Color(0xFF161618),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    high_today.toString(),
                    style: const TextStyle(
                      color: Color(0xFF161618),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Icon(
                    Icons.arrow_downward_rounded,
                    color: Color(0xFF161618),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    low_today.toString(),
                    style: const TextStyle(
                      color: Color(0xFF161618),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 5),
              Row(
                children: [
                  const Text(
                    "Feels Like ",
                    style: TextStyle(
                      color: Color(0xFF161618),
                    ),
                  ),
                  Text(
                    "${feels_like.toString()}°",
                    style: const TextStyle(
                        color: Color(0xFFE21A41), fontWeight: FontWeight.w700),
                  ),
                  Text(
                    ", ${description.toUpperCase()}.",
                    style: const TextStyle(
                        color: Color(0xFFE21A41), fontWeight: FontWeight.w700),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
