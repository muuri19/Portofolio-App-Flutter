import 'package:flutter/material.dart';
import 'package:muuri_project/common/color_style.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:muuri_project/common/text_style.dart';
import 'package:muuri_project/data/menus.dart';
import 'package:muuri_project/utils/constants.dart';
import 'package:muuri_project/widgets/alert_success.dart';
import 'package:muuri_project/widgets/text_field_dialog.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DialogFeedbackBuilder extends StatefulWidget {
  const DialogFeedbackBuilder({super.key});

  @override
  _DialogFeedbackBuilderState createState() => _DialogFeedbackBuilderState();
}

class _DialogFeedbackBuilderState extends State<DialogFeedbackBuilder> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _formController = TextEditingController();

  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = null;
  }

  @override
  void dispose() {
    _categoryController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _formController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double widthAlertDialog =
        screenwidth < 600 ? screenwidth * 0.8 : screenwidth * 0.4;
    double fontSize = screenwidth < 600 ? 12 : 14;
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      insetPadding: const EdgeInsets.all(16),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Your Feedback",
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
      content: FormBuilder(
        key: _fbKey,
        child: SizedBox(
          width: widthAlertDialog,
          height: screenwidth < 600 ? 430 : 600,
          child: Column(
            children: [
              FormBuilderDropdown(
                dropdownColor: Colors.white,
                style: textDropdownStyle,
                iconEnabledColor: primaryColor,
                icon: const Icon(Icons.keyboard_arrow_down_rounded),
                name: 'Menu Category',
                items: menus.map<DropdownMenuItem<String>>((menu) {
                  return DropdownMenuItem<String>(
                      value: menu['menuItem'], child: Text(menu['menuItem']!));
                }).toList(),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Category Feedback',
                  labelStyle: TextStyle(
                      fontSize: 13,
                      color: primaryColor.withOpacity(0.7),
                      fontWeight: FontWeight.w900),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.grey)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.grey)),
                ),
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                    _categoryController.text = value ?? '';
                  });
                },
              ),
              const SizedBox(height: 8),
              TextFieldDialog(
                controller: _nameController,
                labelName: 'Your Name',
                idName: 'Name',
                message: 'Name should not be empty!',
              ),
              const SizedBox(height: 8),
              TextFieldDialog(
                controller: _emailController,
                labelName: 'Your Email',
                idName: 'Email',
                message: 'Email should not be empty!',
              ),
              const SizedBox(height: 8),
              FormBuilderTextField(
                controller: _formController,
                maxLines: 8,
                keyboardType: TextInputType.multiline,
                style: textFormStyle,
                cursorColor: Colors.black,
                name: 'Information',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Form should not be empty!';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Your Information',
                  labelStyle: TextStyle(
                      fontSize: 13,
                      color: primaryColor.withOpacity(0.7),
                      fontWeight: FontWeight.w900),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.grey)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.grey)),
                  errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                  focusedErrorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 40,
                child: ElevatedButton(
                    onPressed: () async {
                      if (_fbKey.currentState!.saveAndValidate()) {
                        await Supabase.instance.client.from('feedback').insert({
                          "category": _categoryController.text,
                          "name": _nameController.text,
                          "email": _emailController.text,
                          "description": _formController.text
                        });
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (_) {
                            return const AlertSuccess(
                              title: 'Yeah! Feedback successfully to send',
                              message:
                                  'Thank you for giving your feedback to this app',
                            );
                          },
                        );

                        Constants.logger.i("Success Created Data");
                        _nameController.clear();
                        _emailController.clear();
                        _formController.clear();
                      } else {
                        print("Form is invalid");
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 12,
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: const Center(
                      child: Text(
                        'Send Your Feedback',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
