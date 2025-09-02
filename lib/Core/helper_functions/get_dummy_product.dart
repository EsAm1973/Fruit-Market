import 'package:fruit_market/Features/home/domain/entites/product_entity.dart';
import 'package:fruit_market/Features/home/domain/entites/review_entity.dart';

ProductEntity getDummyProduct() {
  ProductEntity product = ProductEntity(
    productName: "Organic Apple",
    productCode: "APL-123",
    price: 2.5,
    description: "Fresh organic apple from local farms.",
    imageUrl:
        "https://saratogasnowmobile.com/wp-content/uploads/woocommerce-placeholder.png",
    isFeatured: true,
    expiryDate: 20250810, // YYYYMMDD format example
    isOrganic: true,
    unitAmount: 1,
    numberOfCalories: 95,
    averageRating: 4.5,
    ratingCount: 20,
    reviews: [
      ReviewEntity(
        nameUser: 'John Doe',
        imageUser: 'https://example.com/images/john_doe.jpg',
        rating: 5,
        reviewDescription: 'Great product, highly recommended!',
      ),
      ReviewEntity(
        nameUser: 'John Doe',
        imageUser: 'https://example.com/images/john_doe.jpg',
        rating: 5,
        reviewDescription: 'Great product, highly recommended!',
      ),
    ],
  );

  return product;
}

List<ProductEntity> getDummyProducts() {
  return [
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
  ];
}
