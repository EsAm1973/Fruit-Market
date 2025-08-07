import 'dart:io';

import 'package:fruit_market/Features/home/domain/entites/review_entity.dart';

class ProductEntity {
  final String productName;
  final String productCode;
  final num price;
  final String description;
  String? imageUrl;
  final File fileImage;
  final bool isFeatured;
  final int expiryDate;
  final bool isOrganic;
  final int unitAmount;
  final int numberOfCalories;
  final num averageRating;
  final num ratingCount;
  final List<ReviewEntity> reviews;

  ProductEntity({
    required this.productName,
    required this.productCode,
    required this.price,
    required this.description,
    this.imageUrl,
    required this.fileImage,
    required this.isFeatured,
    required this.expiryDate,
    required this.isOrganic,
    required this.unitAmount,
    required this.numberOfCalories,
    this.averageRating = 0,
    this.ratingCount = 0,
    required this.reviews,
  });
}