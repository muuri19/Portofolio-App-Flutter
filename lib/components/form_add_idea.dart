import 'package:flutter/material.dart';
import 'package:muuri_project/common/color_style.dart';
import 'package:muuri_project/utils/constants.dart';
import 'package:muuri_project/widgets/alert_success.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FormAddIdea extends StatelessWidget {
  final VoidCallback onIdeaAdded;
  FormAddIdea({super.key, required this.onIdeaAdded});
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ideController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: const Color(0xffF5F7F8),
        shadowColor: Colors.black,
        elevation: 12,
        child: SizedBox(
          width: 300,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  SizedBox(
                    height: 80,
                    width: 80,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.asset('assets/feedback.png'),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text("It's time to write your ideas"),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    cursorColor: Colors.black,
                    style: const TextStyle(fontSize: 14),
                    controller: _nameController,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        labelText: "Your Name",
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: primaryColor)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: primaryColor)),
                        errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                        focusedErrorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                        isDense: true),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    style: const TextStyle(fontSize: 12),
                    cursorColor: Colors.black,
                    controller: _ideController,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    maxLines: 11,
                    decoration: InputDecoration(
                        labelText: "Your Idea",
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: primaryColor)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: primaryColor)),
                        errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                        focusedErrorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                        isDense: true),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your idea';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    height: 40,
                    child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await Supabase.instance.client
                                .from("new_idea")
                                .insert([
                              {
                                "name": _nameController.text,
                                "ideas": _ideController.text
                              }
                            ]);
                            onIdeaAdded();
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (_) {
                                return const AlertSuccess(title: 'Yeah! Idea successfully to share', message: 'Thank you for giving your idea to this app',);
                              },
                            );
                            Constants.logger.i("Success Created Data");
                            _nameController.clear();
                            _ideController.clear();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            elevation: 12,
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                        child: const Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Send Your Idea',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Icon(
                                Icons.send_rounded,
                                color: Colors.white,
                                size: 20,
                              ),
                            ],
                          ),
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
