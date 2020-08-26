import 'package:Lenus_Final/screens/congestionDetails.dart';
import 'package:flutter/material.dart';

class SliderItem extends StatefulWidget {
  final String title;
  final Color color;
  final IconData icon;
  final double congestRate;

  SliderItem({
    Key key,
    @required this.title,
    @required this.color,
    @required this.icon,
    @required this.congestRate,
  }) : super(key: key);

  @override
  _SliderItemState createState() => _SliderItemState();
}

class _SliderItemState extends State<SliderItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: EdgeInsets.only(top: 20, bottom: 20, right: 10, left: 5),
        child: Container(
          height: 150.00,
          width: 150.00,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30, bottom: 10),
                child: Icon(
                  this.widget.icon,
                  color: Colors.white,
                  size: 50,
                ),
              ),
              Text(
                "${TimeOfDay.now().format(context)}",
                style: TextStyle(
                  fontFamily: "Helvetica Neue",
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: Color(0xffffffff),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "View details",
                style: TextStyle(
                  fontFamily: "Helvetica Neue",
                  fontSize: 13,
                  color: Color(0xffffffff).withOpacity(0.8),
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
            color: this.widget.color,
            borderRadius: BorderRadius.circular(18.00),
          ),
        ),
      ),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CongestionDetails(
                  title: this.widget.title,
                  congestRate: this.widget.congestRate,
                  color: this.widget.color,
                )),
      ),
    );
  }
}

class BoxItem extends StatelessWidget {
  final String title;
  final double height;
  final double width;
  final Color color;

  BoxItem({
    this.title,
    this.height,
    this.width,
    this.color,
  });
  Widget text(String text) {
    if (text == "")
      return SizedBox(
        height: 5,
      );
    else
      return Padding(
        padding: EdgeInsets.only(top: 5),
        child: new Text(
          this.title,
          style: TextStyle(
            fontFamily: "Helvetica Neue",
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: Color(0xffbebebe),
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: this.width != null ? this.width : null,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: this.height,
            width: 8.00,
            decoration: BoxDecoration(
              color: this.color,
              borderRadius: BorderRadius.circular(11.00),
            ),
          ),
          text(this.title),
        ],
      ),
    );
  }
}
