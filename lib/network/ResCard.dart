import 'package:json_annotation/json_annotation.dart';
import 'package:nanigo_flutter/network/QCard.dart';


@JsonSerializable()
class ResCard {
  final String type;
  final String message;
  final List<QCard> cardList;

  ResCard({this.type, this.message, this.cardList});

}