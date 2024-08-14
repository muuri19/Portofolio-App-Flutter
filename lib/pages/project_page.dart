import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:muuri_project/common/color_style.dart';
import 'package:muuri_project/common/text_style.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectPage extends StatefulWidget {
  static const routeName = '/project';
  const ProjectPage({super.key});

  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  final TextEditingController _searchController = TextEditingController();
  late Future<List<dynamic>> _future;

  @override
  void initState() {
    super.initState();
    _future = fetchProjects('');
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      _future = fetchProjects(_searchController.text);
    });
  }

  Future<List<dynamic>> fetchProjects(String query) async {
    final response = await Supabase.instance.client
        .from('project')
        .select()
        .ilike('name', '%$query%');
    return response;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double searchWidth =
        screenWidth < 600 ? screenWidth * 0.8 : screenWidth * 0.5;
    return Scaffold(
      backgroundColor: const Color(0xffEAE0DA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios_new_rounded)),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    height: 40,
                    width: searchWidth,
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Search project',
                        labelStyle: TextStyle(
                            fontSize: 13,
                            color: primaryColor.withOpacity(0.7),
                            fontWeight: FontWeight.w900),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: primaryColor)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: primaryColor)),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Divider(
                height: 1,
                color: primaryColor,
              ),
              const SizedBox(
                height: 12,
              ),
              Expanded(
                child: buildTable(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTable() {
    double screenwidth = MediaQuery.of(context).size.width;
    double widthAlertDialog =
        screenwidth < 600 ? screenwidth * 0.8 : screenwidth * 0.4;
    double widthSizeBox = screenwidth < 600 ? 110 : 220;
    double widthButton = screenwidth < 600 ? 50 : 100;
    double heightButton = screenwidth < 600 ? 25 : 40;

    double sizeIcon = screenwidth < 600 ? 15 : 20;
    TextStyle textStyle;
    double sizePaddingHorizontal;
    if (screenwidth < 600) {
      textStyle = textMobileStyle;
      sizePaddingHorizontal = 0;
    } else {
      textStyle = textDesktopStyle;
      sizePaddingHorizontal = 30;
    }
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: sizePaddingHorizontal, vertical: 10),
      child: FutureBuilder(
          future: _future,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return buildLoading();
            }
            final projects = snapshot.data!;

            return ListView.builder(
                itemCount: projects.length,
                itemBuilder: (context, index) {
                  final dataProject = projects[index];
                  return ListTile(
                    title: Text(dataProject['name']),
                    titleTextStyle: textStyle,
                    subtitle: Text(dataProject['company']),
                    subtitleTextStyle: textStyle,
                    trailing: SizedBox(
                      width: widthSizeBox,
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: heightButton,
                            width: widthButton,
                            child: ElevatedButton(
                                onPressed: () {
                                  final Uri urlGithub =
                                      Uri.parse(dataProject['github']);
                                  launchUrl(urlGithub);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: primaryColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    padding: EdgeInsets.zero),
                                child: Center(
                                  child: Icon(
                                    Icons.code_rounded,
                                    size: sizeIcon,
                                    color: Colors.white,
                                  ),
                                )),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            height: heightButton,
                            width: widthButton,
                            child: ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (_) {
                                      return AlertDialog(
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        insetPadding: const EdgeInsets.all(16),
                                        title: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(dataProject['name']),
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
                                        content: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Card(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              elevation: 12,
                                              shadowColor: Colors.black,
                                              color: Colors.white,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: SizedBox(
                                                  width: widthAlertDialog,
                                                  height: 300,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
                                                    child: CachedNetworkImage(
                                                      fit: BoxFit.cover,
                                                      imageUrl:
                                                          dataProject['banner'],
                                                      placeholder:
                                                          (context, url) =>
                                                              buildLoading(),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          Icon(
                                                        Icons.error,
                                                        color: primaryColor,
                                                        size: 40,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                                "Technolgy : ${dataProject['technology']}"),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            SizedBox(
                                              height: 40,
                                              child: ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                      elevation: 12,
                                                      backgroundColor:
                                                          primaryColor,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8))),
                                                  child: const Center(
                                                    child: Text(
                                                      'Ok',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  )),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    padding: EdgeInsets.zero),
                                child: Center(
                                  child: Icon(
                                    Icons.visibility_rounded,
                                    size: sizeIcon, //Mobile = 15 Web = 20
                                    color: Colors.white,
                                  ),
                                )),
                          )
                        ],
                      ),
                    ),
                  );
                });
          }),
    );
  }

  Widget buildLoading() => Center(
        child: LoadingAnimationWidget.halfTriangleDot(
            color: primaryColor, size: 50),
      );
}
