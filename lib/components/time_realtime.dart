import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:muuri_project/common/color_style.dart';

class TimeRealtime extends StatefulWidget {
  const TimeRealtime({Key? key}) : super(key: key);

  @override
  _TimeRealtimeState createState() => _TimeRealtimeState();
}

class _TimeRealtimeState extends State<TimeRealtime> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double widthButton =
        screenwidth < 600 ? screenwidth * 0.8 : screenwidth * 0.4;
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEEE, dd MMMM yyyy').format(now);
    return Container(
      height: 40,
      width: widthButton,
      decoration: BoxDecoration(
          color: secondaryAscent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 1, color: Colors.white)),
      child: Center(
        child: Text(
          formattedDate,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      ),
    );
  }
}
