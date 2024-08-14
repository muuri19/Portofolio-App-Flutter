import 'package:flutter/material.dart';
import 'package:muuri_project/common/color_style.dart';

class AlertSuccess extends StatelessWidget {
  final String title;
  final String message;
  const AlertSuccess({super.key, required this.title, required this.message});

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double widthAlertDialog =
        screenwidth < 600 ? screenwidth * 0.8 : screenwidth * 0.2;
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      insetPadding: const EdgeInsets.all(16),
      title: Text(
        title, //"Yeah! Idea successfully to share"
        style: TextStyle(fontSize: 16),
      ),
      content: SizedBox(
        height: 250,
        width: widthAlertDialog,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 12,
              shadowColor: Colors.black,
              color: Colors.white,
              child: SizedBox(
                  height: 80,
                  width: 80,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/checkbox.png',
                      fit: BoxFit.cover,
                    ),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              message, //Thank you for giving your idea to this app
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 40,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 12,
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  child: const Center(
                    child: Text(
                      "Ok",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
