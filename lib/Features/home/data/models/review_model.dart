import 'package:fruit_market/Features/home/domain/entites/review_entity.dart';

class ReviewModel {
  final String nameUser;
  final String imageUser;
  final num rating;
  final String reviewDescription;

  ReviewModel({
    required this.nameUser,
    required this.imageUser,
    required this.rating,
    required this.reviewDescription,
  });

  factory ReviewModel.fromEntity(ReviewEntity reviewEntity) {
    return ReviewModel(
      nameUser: reviewEntity.nameUser,
      imageUser: reviewEntity.imageUser,
      rating: reviewEntity.rating,
      reviewDescription: reviewEntity.reviewDescription,
    );
  }

  ReviewEntity toEntity() {
    return ReviewEntity(
      nameUser: nameUser,
      imageUser: imageUser,
      rating: rating,
      reviewDescription: reviewDescription,
    );
  }

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      nameUser: json['nameUser'],
      imageUser: json['imageUser'],
      rating: json['rating'],
      reviewDescription: json['reviewDescription'],
    );
  }

  toJson() {
    return {
      'nameUser': nameUser,
      'imageUser': imageUser,
      'rating': rating,
      'reviewDescription': reviewDescription,
    };
  }
}
