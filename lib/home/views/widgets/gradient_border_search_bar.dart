import 'package:flutter/material.dart';

class GradientBorderSearchBar extends StatelessWidget {
  const GradientBorderSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25), // Rounded corners
        border: Border.all(
          width: 2, // Border thickness
          color: Colors.transparent, // Transparent to use gradient overlay
        ),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF74FBDE),
            Color(0xFF3C41BF),
          ], // Border gradient colors
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2), // Creates border effect
        child: Container(
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(23), // Slightly smaller for inner box
            color: Colors.white, // Inner background color
          ),
          child: const Row(
            children: [
              SizedBox(width: 15),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: '검색어를 입력하세요',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none, // No default border
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15),
                child: Icon(
                  Icons.search,
                  color: Colors.blueAccent, // Adjust icon color to match border
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
