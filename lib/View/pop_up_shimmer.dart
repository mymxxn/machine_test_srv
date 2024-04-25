import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerDesign {
  static Widget popShimmer() {
    return Shimmer.fromColors(
      baseColor: Color(0xFFd3e7e8),
      highlightColor: Color(0xFFECFAFB),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Card(
              child: Padding(
            padding: const EdgeInsets.all(100),
          ));
        },
        separatorBuilder: (context, index) => SizedBox(
          height: 5,
        ),
      ),
    );
  }
}
