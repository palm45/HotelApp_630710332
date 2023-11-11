class Reviews {
  final String name;
  final double rating;
  final String review;

  Reviews({
    required this.name,
    required this.rating,
    required this.review,
  });

  factory Reviews.fromJson(Map<String, dynamic> json) {
    return Reviews(
      name: json['name'],
      rating: json['rating'],
      review: json['review'],
    );
  }
}
