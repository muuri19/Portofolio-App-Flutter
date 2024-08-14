import 'package:flutter/material.dart';
import 'package:muuri_project/common/color_style.dart';
import 'package:muuri_project/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class DialogSaweria extends StatefulWidget {
  const DialogSaweria({super.key});

  @override
  _DialogSaweriaState createState() => _DialogSaweriaState();
}

class _DialogSaweriaState extends State<DialogSaweria> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double widthAlertDialog =
        screenwidth < 600 ? screenwidth * 0.5 : screenwidth * 0.4;

    double fontSize;
    if (screenwidth < 600) {
      fontSize = 14;
    } else {
      fontSize = 18;
    }

    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      insetPadding: const EdgeInsets.all(16),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Your Support QR",
            style: TextStyle(fontSize: fontSize),
          ),
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.cancel,
                color: Colors.black,
              ))
        ],
      ),
      content: SizedBox(
        width: widthAlertDialog,
        height: screenwidth < 600 ? 300 : 600,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)),
              elevation: 12,
              shadowColor: Colors.black,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: screenwidth < 600 ? 100 : 250,
                    width: screenwidth < 600 ? 100 : 250,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 1, color: Colors.black)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/saweria_qr.png',
                        fit: BoxFit.cover,
                      ),
                    )),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text("Scan here or with link"),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 40,
              child: ElevatedButton(
                  onPressed: () {
                    launchUrl(Uri.parse(Constants.saweriaLink));
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 12,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      side: BorderSide(width: 1, color: primaryColor)),
                  child: Center(
                    child: Text(
                      'Saweria Link',
                      style: TextStyle(
                        color: primaryColor,
                      ),
                    ),
                  )),
            ),
            const SizedBox(
              height: 8,
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
                      'Done',
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
