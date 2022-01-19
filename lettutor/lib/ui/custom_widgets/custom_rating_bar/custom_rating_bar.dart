import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomRatingBar extends StatelessWidget {
  final double rating;
  final bool isReadonly;
  final bool isAllowHalfStar;
  final void Function(double) onRatingUpdate;
  final double? sizeOfStar;

  CustomRatingBar(
      {Key? key,
      required this.rating,
      this.isReadonly = true,
      this.isAllowHalfStar = true,
      required this.onRatingUpdate,
      this.sizeOfStar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      ignoreGestures: isReadonly,
      allowHalfRating: isAllowHalfStar,
      initialRating: rating,
      itemSize: sizeOfStar ?? 18,
      onRatingUpdate: onRatingUpdate,
      ratingWidget: RatingWidget(
        full: Icon(
          CupertinoIcons.star_fill,
          color: Colors.amber,
        ),
        half: Icon(CupertinoIcons.star_lefthalf_fill, color: Colors.amber),
        empty: Icon(CupertinoIcons.star_fill, color: Colors.grey),
      ),
    );
  }
}
