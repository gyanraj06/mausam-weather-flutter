import 'package:flutter/material.dart';

class LocationButton extends StatelessWidget {
  const LocationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 50,
          width: 250,
          decoration: const BoxDecoration(color: Color(0xFFE21A41)),
          child: const Center(
            child: Text(
              "Check For Location",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Container(
          height: 50,
          width: 50,
          decoration:
              BoxDecoration(border: Border.all(color: const Color(0xFFE21A41))),
          child: const Center(
            child: Icon(
              Icons.arrow_right_rounded,
              color: Colors.white,
              size: 50,
            ),
          ),
        ),
      ],
    );
  }
}
