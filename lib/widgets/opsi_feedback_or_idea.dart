import 'package:flutter/material.dart';
import 'package:muuri_project/components/dialog_feedback_builder.dart';
import 'package:muuri_project/pages/ide_page.dart';

class OpsiFeedbackOrIdea extends StatelessWidget {
  const OpsiFeedbackOrIdea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double widthAlertDialog =
        screenWidth < 600 ? screenWidth * 0.8 : screenWidth * 0.4;
    double fontSize = screenWidth < 600 ? 12 : 18;

    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      insetPadding: const EdgeInsets.all(16),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Give me your ideas and feedback!",
            style: TextStyle(fontSize: fontSize),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.cancel,
              color: Colors.black,
            ),
          )
        ],
      ),
      content: SizedBox(
        height: screenWidth < 600 ? 350 : 600,
        width: widthAlertDialog,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 12,
              shadowColor: Colors.black,
              color: Colors.white,
              child: SizedBox(
                height: screenWidth < 600 ? 100 : 250,
                width: screenWidth < 600 ? 100 : 250,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/question.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Choose whether you want to give ideas or feedback to this application?",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            buildButtonType(context),
          ],
        ),
      ),
    );
  }

  Widget buildButtonType(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 600) {
      return mobileButton(context);
    } else {
      return desktopButton(context);
    }
  }

  Widget mobileButton(BuildContext context) {
    return Column(
      children: [
        buildButton(
          context,
          label: "See people's ideas",
          color: const Color(0xffFF8225),
          onPressed: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, IdePage.routeName);
          },
        ),
        const SizedBox(height: 8),
        buildButton(
          context,
          label: 'Give me your feedback!',
          color: const Color(0xffB43F3F),
          onPressed: () {
            Navigator.pop(context);
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) {
                return const DialogFeedbackBuilder();
              },
            );
          },
        ),
      ],
    );
  }

  Widget desktopButton(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double btnWidth = screenWidth < 600 ? 150 : 250;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildButton(
          context,
          label: "See people's ideas",
          color: const Color(0xffFF8225),
          width: btnWidth,
          onPressed: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, IdePage.routeName);
          },
        ),
        buildButton(
          context,
          label: 'Give me your feedback!',
          color: const Color(0xffB43F3F),
          width: btnWidth,
          onPressed: () {
            Navigator.pop(context);
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) {
                return const DialogFeedbackBuilder();
              },
            );
          },
        ),
      ],
    );
  }

  Widget buildButton(BuildContext context,
      {required String label,
      required Color color,
      required VoidCallback onPressed,
      double? width}) {
    return SizedBox(
      height: 40,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 12,
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
