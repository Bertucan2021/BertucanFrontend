import 'package:bertucanfrontend/shared/routes/app_routes.dart';
import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/controllers/auth_controller.dart';
import 'package:bertucanfrontend/ui/widgets/custom_textfield.dart';
import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:bertucanfrontend/utils/functions.dart';
import 'package:bertucanfrontend/ui/widgets/rounded_button.dart';
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
  final TextEditingController _passCodeController2 = TextEditingController();
  final AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.peachBackground,
        body: SingleChildScrollView(
          child: Padding(
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
                          Text('Lauren Kebede',
                              style: AppTheme.normalTextStyle),
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
                              keyboardType: TextInputType.number,
                            ),
                            CustomTextField(
                              label: 'confirm_passcode',
                              controller: _passCodeController2,
                              obscureText: true,
                              keyboardType: TextInputType.number,
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
                              onPressed: () {
                                if (_passCodeController.text.trim() !=
                                    _passCodeController2.text.trim()) {
                                  toast(
                                    'error',
                                    'passcodes_do_not_match',
                                  );
                                } else {
                                  _authController
                                      .setPasscode(_passCodeController.text);
                                  Get.back();
                                }
                              }),
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
                            Text('passcode_setting',
                                style: AppTheme.titleStyle2),
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
                  mainAxisSize: MainAxisSize.max,
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
                          LocalizedText('language',
                              style: AppTheme.titleStyle2),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            child: DropdownButton<Locale>(
                                hint: LocalizedText(
                                  "set_language",
                                  style: AppTheme.hintTextStyle,
                                ),
                                onChanged: (value) {
                                  if (value != null) {
                                    _authController.setLocale(value);
                                  }
                                },
                                items: const <DropdownMenuItem<Locale>>[
                                  DropdownMenuItem(
                                    value: Locale('am', 'ET'),
                                    child: Text('Amharic'),
                                  ),
                                  DropdownMenuItem(
                                    value: Locale('en', 'US'),
                                    child: Text('English'),
                                  )
                                ]),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Get.dialog(
                      AlertDialog(
                        title: const LocalizedText('logout'),
                        content: const LocalizedText(
                            'are_you_sure_you_want_to_logout?'),
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              TextButton(
                                child: LocalizedText('cancel',
                                    style: AppTheme.normalTextStyle),
                                onPressed: () {
                                  Get.back();
                                },
                              ),
                              TextButton(
                                child: Container(
                                    decoration: AppTheme
                                        .primaryColoredRectangularButtonDecoration(),
                                    padding: EdgeInsets.all(10),
                                    child: LocalizedText('logout',
                                        style: AppTheme.normalTextStyle
                                            .copyWith(color: Colors.white))),
                                onPressed: () {
                                  _authController.logout();
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
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
          ),
        ));
  }
}
