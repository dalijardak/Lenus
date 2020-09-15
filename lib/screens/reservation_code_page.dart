import "package:flutter/material.dart";

class ReservationCodePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/backgrouds/qs2.png"),
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
            )
          ],
        ),
      ),
    );
  }
}
