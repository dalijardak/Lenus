import "package:flutter/material.dart";

import 'discover_item.dart';

class DiscoverSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      children: [
        DiscoverItem(
          icon: Icons.restaurant,
          title: "Restaurant",
        ),
        DiscoverItem(
          icon: Icons.pool,
          title: "Pool",
        ),
        DiscoverItem(
          icon: Icons.shop,
          title: "Shop",
        ),
        DiscoverItem(
          icon: Icons.ac_unit,
          title: "Sport",
        ),
      ],
    );
  }
}
