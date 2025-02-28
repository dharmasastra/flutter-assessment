import 'package:flutter_app1/profile/models/profile.dart';

class ProfileRepository {
  Future<List<Profile>> getProfile() async {
    try {
      // For demo purposes, returning mock data
      return [
        Profile(
          id: 1,
          name: 'Name01',
          imageUrl: 'assets/images/reviewer1.png',
          rank: 1,
          reviewCount: 35,
          tier: '골드',
        ),
        Profile(
          id: 2,
          name: 'Name02',
          imageUrl: 'assets/images/reviewer2.png',
          rank: 2,
          reviewCount: 30,
          tier: '골드',
        ),
        Profile(
          id: 3,
          name: 'Name03',
          imageUrl: 'assets/images/reviewer3.png',
          rank: 3,
          reviewCount: 28,
          tier: '골드',
        ),
        Profile(
          id: 4,
          name: 'Name04',
          imageUrl: 'assets/images/reviewer4.png',
          rank: 4,
          reviewCount: 25,
          tier: '골드',
        ),
        Profile(
          id: 5,
          name: 'Name05',
          imageUrl: 'assets/images/reviewer5.png',
          rank: 5,
          reviewCount: 20,
          tier: '골드',
        ),
        Profile(
          id: 6,
          name: 'Name06',
          imageUrl: 'assets/images/reviewer6.png',
          rank: 6,
          reviewCount: 16,
          tier: '골드',
        ),
        Profile(
          id: 7,
          name: 'Name07',
          imageUrl: 'assets/images/reviewer7.png',
          rank: 7,
          reviewCount: 12,
          tier: '골드',
        ),
        Profile(
          id: 8,
          name: 'Name08',
          imageUrl: 'assets/images/reviewer8.png',
          rank: 8,
          reviewCount: 8,
          tier: '골드',
        ),
        Profile(
          id: 9,
          name: 'Name09',
          imageUrl: 'assets/images/reviewer9.png',
          rank: 9,
          reviewCount: 4,
          tier: '골드',
        ),
        Profile(
          id: 10,
          name: 'Name10',
          imageUrl: 'assets/images/reviewer10.png',
          rank: 10,
          reviewCount: 2,
          tier: '골드',
        ),
      ];
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }
}
