import 'package:flutter/material.dart';
import 'dart:async';

import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:muuri_project/common/color_style.dart';

class ClockLive extends StatefulWidget {
  const ClockLive({Key? key}) : super(key: key);

  @override
  _ClockLiveState createState() => _ClockLiveState();
}

class _ClockLiveState extends State<ClockLive> {
  late Stream<DateTime> clockStream;

  @override
  void initState() {
    super.initState();
    clockStream = Stream.periodic(
      const Duration(seconds: 1),
      (_) => DateTime.now(),
    );
  }

  Widget buildLoading() => Center(
        child: LoadingAnimationWidget.halfTriangleDot(
            color: primaryColor, size: 50),
      );

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double containerWidth = screenwidth < 600 ? 75 : 100;

    double fontSize;
    if (screenwidth < 600) {
      fontSize = 38;
    } else {
      fontSize = 48;
    }
    return StreamBuilder<DateTime>(
      stream: clockStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final time = snapshot.data!;
          return SizedBox(
            height: containerWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: SizedBox(
                    width: containerWidth,
                    height: containerWidth,
                    child: Center(
                      child: Text(
                        time.hour.toString(),
                        style: TextStyle(fontSize: fontSize),
                      ),
                    ),
                  ),
                ),
                const Text(
                  ":",
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: SizedBox(
                    width: containerWidth,
                    height: containerWidth,
                    child: Center(
                      child: Text(
                        time.minute.toString(),
                        style: TextStyle(fontSize: fontSize),
                      ),
                    ),
                  ),
                ),
                const Text(
                  ":",
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: SizedBox(
                    width: containerWidth,
                    height: containerWidth,
                    child: Center(
                      child: Text(
                        time.second.toString(),
                        style: TextStyle(fontSize: fontSize),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return buildLoading();
        }
      },
    );
  }
}
