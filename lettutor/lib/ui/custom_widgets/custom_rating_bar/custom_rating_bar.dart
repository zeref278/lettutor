import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomRatingBar extends StatelessWidget {
  final double rating;
  final bool isReadonly;
  final void Function(double) onRatingUpdate;

  CustomRatingBar({
    Key? key, required this.rating, this.isReadonly = true, required this.onRatingUpdate}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return RatingBar(
      ignoreGestures: isReadonly,
      allowHalfRating: true,
      initialRating: rating,
      itemSize: 18,
      onRatingUpdate: onRatingUpdate,
      ratingWidget: RatingWidget(
        full: Icon(
          CupertinoIcons.star_fill,
          color: Colors.amber,
        ),
        half: Icon(
            CupertinoIcons
                .star_lefthalf_fill,
            color: Colors.amber),
        empty: Icon(
            CupertinoIcons
                .star_fill,
            color: Colors.grey),
      ),
    );
  }

}