
import '../../domain/entities/review_entity.dart';

class ReviewsModel extends ReviewEntity {
const  ReviewsModel({
  super.rating,
  super.comment,
  super.date,
  super.reviewerName,
  super.reviewerEmail,});

factory  ReviewsModel.fromJson(dynamic json) {
  return ReviewsModel(
    rating: (json['rating'] as num).toInt(),
    comment: json['comment'].toString(),
    date: json['date'].toString(),
    reviewerName: json['reviewerName'].toString(),
    reviewerEmail: json['reviewerEmail'].toString(),

  );

  }

}
