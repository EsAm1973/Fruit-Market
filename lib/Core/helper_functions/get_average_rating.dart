import 'package:fruit_market/Features/home/domain/entites/review_entity.dart';

getAverageRating(List<ReviewEntity> reviews) {
  var totalRating = 0.0;
  for (var review in reviews) {
    totalRating += review.rating;
  }
  return totalRating / reviews.length;
}
