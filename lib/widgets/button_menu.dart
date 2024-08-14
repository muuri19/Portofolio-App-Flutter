import 'package:flutter/material.dart';
import 'package:muuri_project/common/color_style.dart';

class ButtonMenu extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData iconButton;
  const ButtonMenu(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.iconButton});

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;

    double widthButton =
        screenwidth < 600 ? screenwidth * 0.8 : screenwidth * 0.4;

    return SizedBox(
      height: 40,
      width: widthButton,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: const BorderSide(color: Colors.white, width: 1)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconButton,
              color: Colors.white,
              size: 15,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
