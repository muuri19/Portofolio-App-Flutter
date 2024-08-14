import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:muuri_project/common/color_style.dart';
import 'package:muuri_project/components/form_add_idea.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class IdePage extends StatefulWidget {
  static const routeName = '/idea';
  const IdePage({Key? key}) : super(key: key);

  @override
  State<IdePage> createState() => _IdePageState();
}

class _IdePageState extends State<IdePage> {
  late Future<List<dynamic>> _future;

  Future<List<dynamic>> fetchListIdea() async {
    final response = await Supabase.instance.client
        .from('new_idea')
        .select()
        .order('created_at', ascending: false);
    return response;
  }

  @override
  void initState() {
    super.initState();
    _future = fetchListIdea();
  }

  void _refreshIdeas() {
    setState(() {
      _future = fetchListIdea();
    });
  }

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
              'assets/bg-ide.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: widthAlertDialog,
                  height: 500,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FormAddIdea(onIdeaAdded: _refreshIdeas),
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                              height: MediaQuery.of(context).size.height,
                              child: FutureBuilder(
                                future: _future,
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData) {
                                    return buildLoading();
                                  }
                                  final ideaList = snapshot.data!;
                                  return ListView.builder(
                                      itemCount: ideaList.length,
                                      itemBuilder: (context, index) {
                                        final ideas = ideaList[index];
                                        DateTime changeFormatTime =
                                            DateTime.parse(ideas["created_at"]);
                                        String newFormatDate =
                                            DateFormat('EEEE, d MMMM y')
                                                .format(changeFormatTime);
                                        return Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 6),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color: primaryColor, width: 2),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ListTile(
                                                leading: CircleAvatar(
                                                  backgroundColor:
                                                      secondaryColor,
                                                  child: Center(
                                                    child: Icon(
                                                      Icons.person,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                title: Text(ideas['name']),
                                                subtitle: Text(newFormatDate),
                                              ),
                                              const Divider(
                                                height: 1,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(16.0),
                                                child: Text(ideas["ideas"]),
                                              )
                                            ],
                                          ),
                                        );
                                      });
                                },
                              )),
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
