import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
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
          onTap: () => Navigator.pushNamed(context, "/RestaurantPage"),
        ),
        DiscoverItem(
          icon: Icons.spa,
          title: "SPA",
        ),
        DiscoverItem(
          icon: MdiIcons.handball,
          title: "Sport",
          onTap: () => Navigator.pushNamed(context, "/Sports"),
        ),
        DiscoverItem(
          icon: MdiIcons.palette,
          title: "Leisure Time",
        ),
      ],
    );
  }
}
