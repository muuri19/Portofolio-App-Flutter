import 'package:flutter/material.dart';
import 'package:muuri_project/components/clock_live.dart';
import 'package:muuri_project/components/dialog_saweria.dart';
import 'package:muuri_project/components/time_realtime.dart';
import 'package:muuri_project/pages/profile_page.dart';
import 'package:muuri_project/pages/project_page.dart';
import 'package:muuri_project/widgets/button_menu.dart';
import 'package:muuri_project/widgets/opsi_feedback_or_idea.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/bg-home.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ClockLive(),
                const SizedBox(
                  height: 20,
                ),
                const TimeRealtime(),
                const SizedBox(
                  height: 8,
                ),
                ButtonMenu(
                    text: "Contribute to My Journey",
                    onPressed: () {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) {
                          return const DialogSaweria();
                        },
                      );
                    },
                    iconButton: Icons.fastfood_rounded),
                const SizedBox(
                  height: 8,
                ),
                ButtonMenu(
                    text: "See What I'm Working On",
                    onPressed: () {
                      Navigator.pushNamed(context, ProjectPage.routeName);
                    },
                    iconButton: Icons.code_rounded),
                const SizedBox(
                  height: 8,
                ),
                ButtonMenu(
                    text: "Who I Am and Why",
                    onPressed: () {
                      Navigator.pushNamed(context, ProfilePage.routeName);
                    },
                    iconButton: Icons.person),
                const SizedBox(
                  height: 8,
                ),
                ButtonMenu(
                    text: "Let Me Know Your Thoughts",
                    onPressed: () {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) {
                          return const OpsiFeedbackOrIdea();
                        },
                      );
                    },
                    iconButton: Icons.feedback),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
          const Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                '@ 2024 Muuri . All rights reserved .',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
