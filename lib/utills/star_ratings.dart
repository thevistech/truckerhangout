import 'package:flutter/material.dart';
import 'package:flutterapp/utills/config.dart';

typedef void RatingChangeCallback(double rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback onRatingChanged;
  final Color color;

  StarRating({this.starCount = 5, this.rating = .0, this.onRatingChanged, this.color});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = new Icon(
        Icons.star_border,
        color: ratingColor,
        size: 18,
      );
    }
    else if (index > rating - 1 && index < rating) {
      icon = new Icon(
        Icons.star_half,
        color: ratingColor,
        size: 18,
      );
    } else {
      icon = new Icon(
        Icons.star,
        color: ratingColor,
        size: 18,
      );
    }
    return new InkResponse(
      onTap: onRatingChanged == null ? null : () => onRatingChanged(index + 1.0),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Row(children: new List.generate(starCount, (index) => buildStar(context, index)));
  }
}