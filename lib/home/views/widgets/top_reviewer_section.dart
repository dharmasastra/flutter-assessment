import 'package:flutter/material.dart';
import 'package:flutter_app1/profile/models/profile.dart';
import 'package:flutter_app1/profile/views/profile_screen.dart';

class TopReviewerSection extends StatelessWidget {
  const TopReviewerSection({required this.profile, super.key});
  final List<Profile> profile;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      margin: const EdgeInsets.only(top: 12),
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        scrollDirection: Axis.horizontal,
        itemCount: profile.length,
        itemBuilder: (context, index) {
          final reviewer = profile[index];
          // Special styling for the first item
          final isFirstItem = index == 0;

          return GestureDetector(
            onTap: () {
              // Navigate to profile screen when clicked
              Navigator.push(
                context,
                // ignore: inference_failure_on_instance_creation
                MaterialPageRoute(
                  builder: (context) =>
                      ProfileScreen(profile: reviewer,),
                ),
              );
            },
            child: Container(
              width: 80,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              child: Column(
                children: [
                  Stack(
                    children: [
                      // Profile image with special border for first item
                      Container(
                        width: 72,
                        height: 72,
                        margin: const EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: isFirstItem
                              ? Border.all(color: Colors.amber, width: 3)
                              : null,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(36),
                          child: Image.asset(
                            reviewer.imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Crown icon for the first reviewer
                      if (isFirstItem)
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 16,
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  // Reviewer name
                  Text(
                    reviewer.name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
