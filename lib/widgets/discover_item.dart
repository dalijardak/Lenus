import 'package:flutter/material.dart';

class DiscoverItem extends StatelessWidget {
  final String title;
  final IconData icon;

  DiscoverItem({
    this.title,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: EdgeInsets.only(top: 20, bottom: 20, right: 10, left: 5),
        child: Container(
          height: 180.00,
          width: 145.00,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                this.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Helvetica Neue",
                  fontSize: 18,
                  color: Color(0xffffffff),
                ),
              ),
              Icon(
                this.icon,
                size: 30,
                color: Colors.white,
              ),
              Text(
                "View details",
                style: TextStyle(
                  fontFamily: "Helvetica Neue",
                  fontSize: 13,
                  color: Color(0xffffffff).withOpacity(0.8),
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Color(0xff1e4dff),
            borderRadius: BorderRadius.circular(18.00),
          ),
        ),
      ),
    );
  }
}
