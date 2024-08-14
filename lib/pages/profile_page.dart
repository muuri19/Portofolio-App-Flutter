import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:muuri_project/common/color_style.dart';
import 'package:muuri_project/components/charts/line_chart_sample_10.dart';

class ProfilePage extends StatefulWidget {
  static const routeName = '/profile';
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double widthAlertDialog =
        screenwidth < 600 ? screenwidth * 0.8 : screenwidth * 0.75;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/bg-profile.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: widthAlertDialog,
                  height: 550,
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                            child: Text("See What’s in My Profile"),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const Text(
                          'Experienced Mobile Developer with a strong proficiency in Flutter and Dart, specializing in creating high-performance, responsive mobile applications. Proven ability to transform complex designs into functional user interfaces and integrate backend services efficiently. Skilled in leveraging Firebase and Supabase to enhance app functionality and user experience. Demonstrated success in delivering projects on time with a focus on quality and performance.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.white)),
                                child: const LineChartSample10()),
                            Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("Framework",
                                          style:
                                              TextStyle(color: Colors.white)),
                                      SizedBox(
                                        height: 50,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: const Row(
                                          children: [
                                            Chip(label: Text("Flutter")),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Chip(label: Text("React")),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Chip(label: Text("Angular")),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Chip(label: Text("Vue")),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Chip(label: Text("Express")),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Chip(label: Text("Elysia")),
                                          ],
                                        ),
                                      ),
                                      const Text("Database Management",
                                          style:
                                              TextStyle(color: Colors.white)),
                                      SizedBox(
                                        height: 50,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: const Row(
                                          children: [
                                            Chip(label: Text("Supabase")),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Chip(label: Text("Firebase")),
                                          ],
                                        ),
                                      ),
                                      const Text("Programming Language",
                                          style:
                                              TextStyle(color: Colors.white)),
                                      SizedBox(
                                        height: 50,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: const Row(
                                          children: [
                                            Chip(label: Text("Dart")),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Chip(label: Text("Java")),
                                          ],
                                        ),
                                      ),
                                      const Text("Tools",
                                          style:
                                              TextStyle(color: Colors.white)),
                                      SizedBox(
                                        height: 50,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: const Row(
                                          children: [
                                            Chip(
                                                label:
                                                    Text("Visual Studio Code")),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Chip(label: Text("Android Studio")),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Chip(label: Text("Figma")),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Chip(label: Text("Notion")),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 40,
                  width: 200,
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
                          'Back',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      )),
                )
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

  Widget buildLoading() => Center(
        child: LoadingAnimationWidget.halfTriangleDot(
            color: primaryColor, size: 50),
      );
}
