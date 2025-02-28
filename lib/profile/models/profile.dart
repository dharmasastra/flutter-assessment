class Profile {
  Profile({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.rank,
    required this.reviewCount,
    this.tier,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'] as int,
      name: json['name'] as String,
      rank: json['rank'] as int,
      imageUrl: json['imageUrl'] as String,
      reviewCount: json['reviewCount'] as int,
      tier: json['tier'] as String?,
    );
  }

  final int id;
  final String name;
  final String imageUrl;
  final int rank;
  final int reviewCount;
  final String? tier;
}
