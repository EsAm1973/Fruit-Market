import 'dart:io';

import 'package:fruit_market/Features/home/data/models/review_model.dart';
import 'package:fruit_market/Features/home/domain/entites/product_entity.dart';

class ProductModel {
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
  final List<ReviewModel> reviews;
  final int sellingCount;

  ProductModel({
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
    required this.averageRating,
    required this.ratingCount,
    required this.reviews,
    this.sellingCount = 0,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productName: json['productName'],
      productCode: json['productCode'],
      price: json['price'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      fileImage: json['fileImage'],
      isFeatured: json['isFeatured'],
      expiryDate: json['expiryDate'],
      isOrganic: json['isOrganic'],
      unitAmount: json['unitAmount'],
      numberOfCalories: json['numberOfCalories'],
      averageRating: json['averageRating'],
      ratingCount: json['ratingCount'],
      reviews:
          (json['reviews'] as List)
              .map((e) => ReviewModel.fromJson(e))
              .toList(),
      sellingCount: json['sellingCount'],
    );
  }

  ProductEntity toEntity() {
    return ProductEntity(
      productName: productName,
      productCode: productCode,
      price: price,
      description: description,
      imageUrl: imageUrl,
      fileImage: fileImage,
      isFeatured: isFeatured,
      expiryDate: expiryDate,
      isOrganic: isOrganic,
      unitAmount: unitAmount,
      numberOfCalories: numberOfCalories,
      averageRating: averageRating,
      ratingCount: ratingCount,
      reviews: reviews.map((review) => review.toEntity()).toList(),
    );
  }

  toMap() {
    return {
      'productName': productName,
      'productCode': productCode,
      'price': price,
      'description': description,
      'imageUrl': imageUrl,
      'isFeatured': isFeatured,
      'expiryDate': expiryDate,
      'isOrganic': isOrganic,
      'unitAmount': unitAmount,
      'numberOfCalories': numberOfCalories,
      'averageRating': averageRating,
      'ratingCount': ratingCount,
      'reviews': reviews.map((review) => review.toJson()).toList(),
      'sellingCount': sellingCount,
    };
  }
}
