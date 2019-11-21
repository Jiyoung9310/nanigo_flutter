
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(explicitToJson: true)
class QCard {
  final int id;
  final int order;
  final String username;
  final String type;
  final String decision;
  final int userId;
//  final CardDetail detail;
//  final Vote vote;
  final int review;
//  final Tag tag;

  QCard({
    this.id,
    this.order,
    this.username,
    this.type,
    this.decision,
    this.userId,
//    this.detail,
//    this.vote,
    this.review,
//    this.tag
  });

//  factory QCard.fromJson(Map<String, dynamic> json) => _$QCardFromJson(json);
//
//  Map<String, dynamic> toJson() => _$QCardFromJson(this);
}