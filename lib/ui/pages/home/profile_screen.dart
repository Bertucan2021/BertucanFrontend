import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/widgets/custom_textfield.dart';
import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _nameemailController = TextEditingController();
  final TextEditingController _passCodeController = TextEditingController();

  List<String> languages = ["English", "Amharic"];
  String keyLanguage = "English";

  @override
  Widget build(BuildContext context) {
    var items;
    return Scaffold(
        backgroundColor: AppTheme.peachBackground,
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 15, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Align(
              //     alignment: Alignment.centerRight,
              //     child: const LocalizedText("logout",
              //         style: AppTheme.titleStyle)),
              const Padding(
                padding: EdgeInsets.only(top: 20.0, left: 20, bottom: 10),
                child: Text('Profile', style: AppTheme.titleStyle2),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    child: Image.asset('assets/profile.png'),
                    radius: 50,
                    backgroundColor: const Color(0xFFFEEFF2),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Lauren Kebede', style: AppTheme.normalTextStyle),
                        Text(
                          'Age: 27',
                          style: AppTheme.hintTextStyle,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: AppTheme.textFieldDecoration2(),
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const LocalizedText(
                      "enter_name_or_nickname",
                      style: AppTheme.hintTextStyle,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LocalizedText(
                    "email:",
                    style: AppTheme.titleStyle2,
                  ),
                  Text(
                    "lauren@bertucan.com",
                    style: AppTheme.normal2TextStyle,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Divider(
                color: Color.fromARGB(255, 203, 201, 201),
                thickness: 0.5,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 8, right: 10, bottom: 25, top: 40),
                child: Text('general_setting',
                    style: AppTheme.titleStyle2.copyWith(fontSize: 25)),
              ),
              InkWell(
                onTap: () {
                  Get.dialog(
                    AlertDialog(
                      title: const LocalizedText('passcode',
                          style: AppTheme.titleStyle,
                          textAlign: TextAlign.center),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomTextField(
                            label: 'enter_passcode',
                            controller: _passCodeController,
                            obscureText: true,
                            hintText: 'enter_your_passcode',
                          ),
                          CustomTextField(
                            label: 'confirm_passcode',
                            controller: _passCodeController,
                            obscureText: true,
                            hintText: 'enter_your_passcode',
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          child: const LocalizedText('Cancel',
                              style: AppTheme.normalPrimaryTextStyle),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                        TextButton(
                          child: const LocalizedText(
                            'save',
                            style: AppTheme.normalPrimaryTextStyle,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.lock,
                      size: 35,
                      color: AppTheme.primaryColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('passcode_setting', style: AppTheme.titleStyle2),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.language,
                    size: 35,
                    color: AppTheme.primaryColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('language', style: AppTheme.titleStyle2),
                        SizedBox(
                          width: 20,
                        ),
                        DropdownButton(
                            value: keyLanguage,
                            items: languages.map((item) {
                              return DropdownMenuItem(
                                child: Text(item),
                                value: item,
                              );
                            }).toList(),
                            onChanged: (item) => setState(() {
                                  keyLanguage = item as String;
                                }))
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.logout_rounded,
                      size: 35,
                      color: AppTheme.primaryColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text('logout', style: AppTheme.titleStyle2),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.delete,
                      size: 35,
                      color: AppTheme.primaryColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('delete_account', style: AppTheme.titleStyle2),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
