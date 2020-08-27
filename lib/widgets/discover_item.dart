import 'package:flutter/material.dart';

class DiscoverItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final dynamic onTap;

  DiscoverItem({
    this.title,
    this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: EdgeInsets.only(top: 20, bottom: 20, right: 10, left: 5),
        child: Container(
          height: 180.00,
          width: 145.00,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 20, top: 20),
                  child: Text(
                    this.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Helvetica Neue",
                      fontSize: 18,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
                Icon(
                  this.icon,
                  size: 40,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
            color: Color(0xff1e4dff),
            borderRadius: BorderRadius.circular(18.00),
          ),
        ),
      ),
      onTap: this.onTap,
    );
  }
}
