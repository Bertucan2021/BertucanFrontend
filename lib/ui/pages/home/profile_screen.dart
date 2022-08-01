import 'package:bertucanfrontend/core/models/freezed_models.dart';
import 'package:bertucanfrontend/shared/routes/app_routes.dart';
import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/controllers/auth_controller.dart';
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
  final TextEditingController _passCodeController2 = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final AuthController _authController = Get.find();

  var _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _authController.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.peachBackground,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 15, top: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // Align(
              //     alignment: Alignment.centerRight,
              //     child: const LocalizedText("logout",
              //         style: AppTheme.titleStyle)),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20.0, left: 20, bottom: 10),
                    child: Text('profile', style: AppTheme.titleStyle2),
                  ),
                  SizedBox(width: 20),
                  if (_authController.user.id != -1)
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: InkWell(
                          onTap: () {
                            Get.dialog(
                              SingleChildScrollView(
                                child: Form(
                                  key: _formKey,
                                  child: AlertDialog(
                                    title: const LocalizedText('edit_profile',
                                        style: AppTheme.titleStyle,
                                        textAlign: TextAlign.center),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CustomTextField(
                                          label: 'first_name',
                                          controller: _firstNameController,
                                          hintText: 'enter_your_first_name',
                                          keyboardType: TextInputType.text,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "first_name_required".tr;
                                            }
                                            return null;
                                          },
                                        ),
                                        CustomTextField(
                                          label: 'last_name',
                                          controller: _lastNameController,
                                          keyboardType: TextInputType.text,
                                          hintText: 'enter_your_last_name',
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "last_name_required".tr;
                                            }
                                            return null;
                                          },
                                        ),
                                        CustomTextField(
                                          label: 'email',
                                          controller: _emailController,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          hintText: 'enter_your_email',
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "email_required".tr;
                                            }
                                            if (!RegExp(
                                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                .hasMatch(value)) {
                                              return "invalid_email".tr;
                                            }
                                            return null;
                                          },
                                        ),
                                        CustomTextField(
                                          label: 'phone_number',
                                          controller: _phoneController,
                                          keyboardType: TextInputType.phone,
                                          hintText: 'enter_your_phone_number',
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "phone_required".tr;
                                            }
                                            if (!RegExp(
                                                    r"^(?:\+2519|09)[0-9]{8}$")
                                                .hasMatch(value)) {
                                              return "invalid_phone".tr;
                                            }
                                            return null;
                                          },
                                        ),
                                        CustomTextField(
                                          label: 'age',
                                          controller: _ageController,
                                          keyboardType: TextInputType.name,
                                          hintText: 'enter_your_age',
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      TextButton(
                                        child: const LocalizedText('cancel',
                                            style: AppTheme
                                                .normalPrimaryTextStyle),
                                        onPressed: () {
                                          Get.back();
                                        },
                                      ),
                                      TextButton(
                                          child: const LocalizedText(
                                            'save',
                                            style:
                                                AppTheme.normalPrimaryTextStyle,
                                          ),
                                          onPressed: () async {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              await _authController.editProfile(
                                                  UserToEdit(
                                                      first_name:
                                                          _firstNameController
                                                              .text,
                                                      last_name:
                                                          _lastNameController
                                                              .text,
                                                      email:
                                                          _emailController.text,
                                                      phone_number:
                                                          _phoneController.text,
                                                      birthdate: _ageController
                                                          .toString(),
                                                      status: "active"));
                                            }
                                          }),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          child: const Icon(Icons.edit,
                              color: AppTheme.primaryColor)),
                    )
                  else
                    SizedBox(),
                ],
              ),

              _authController.user.id != -1
                  ? Row(
                      children: [
                        CircleAvatar(
                          child: Image.asset('assets/profile.png'),
                          radius: 50,
                          backgroundColor: const Color(0xFFFEEFF2),
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      LocalizedText(
                                        "name :",
                                        style: AppTheme.titleStyle2
                                            .copyWith(fontSize: 20),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 2),
                                        child: Text(
                                            "${_authController.user.first_name ?? ""} ${_authController.user.last_name ?? ""}",
                                            style: AppTheme.normalTextStyle),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8.0, left: 35),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      LocalizedText(
                                        "email : ",
                                        style: AppTheme.titleStyle2
                                            .copyWith(fontSize: 20),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 2),
                                        child: Text(
                                          "${_authController.user.email}",
                                          style: AppTheme.normal2TextStyle,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    )
                  : Center(
                      child: Column(
                        children: [
                          LocalizedText(
                            'you_are_not_logged_in',
                            style: AppTheme.boldTitle,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                              child: Container(
                                decoration: AppTheme
                                    .primaryColoredRoundedButtonDecoration(),
                                child: LocalizedText(
                                  'login',
                                  style: AppTheme.normal2TextStyle
                                      .copyWith(color: Colors.white),
                                ),
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                              ),
                              onTap: () {
                                Get.toNamed(Routes.loginPage);
                              })
                        ],
                      ),
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
                child: Text('general_setting', style: AppTheme.titleStyle2),
              ),
              InkWell(
                onTap: () {
                  Get.dialog(
                      AlertDialog(
                        title: const LocalizedText('passcode',
                            style: AppTheme.titleStyle,
                            textAlign: TextAlign.center),
                        content: Form(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomTextField(
                                label: 'enter_passcode',
                                controller: _passCodeController,
                                obscureText: true,
                                hintText: 'enter_your_passcode',
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'passcode_canot_be_null'.tr;
                                  }
                                },
                              ),
                              CustomTextField(
                                  label: 'confirm_passcode',
                                  controller: _passCodeController2,
                                  obscureText: true,
                                  keyboardType: TextInputType.number,
                                  hintText: 'enter_your_passcode',
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'passcode_canot_be_null'.tr;
                                    } else if (value.trim() !=
                                        _passCodeController.text) {
                                      return 'the_two_passcodes_are_not_the_same';
                                    }
                                  }),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    child: const LocalizedText('cancel',
                                        style: AppTheme.normalPrimaryTextStyle),
                                    onPressed: () {
                                      _passCodeController.clear();
                                      _passCodeController2.clear();
                                      Get.back();
                                    },
                                  ),
                                  TextButton(
                                      child: const LocalizedText(
                                        'save',
                                        style: AppTheme.normalPrimaryTextStyle,
                                      ),
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          _authController.setPasscode(
                                              _passCodeController.text);
                                          _passCodeController.clear();
                                          _passCodeController2.clear();
                                          Get.back();
                                        }
                                      }),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      barrierDismissible: false);
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
                          LocalizedText('passcode_setting',
                              style: AppTheme.titleStyle3),
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
                        LocalizedText('language', style: AppTheme.titleStyle3),
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
              _authController.user.id != -1
                  ? Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.dialog(
                              AlertDialog(
                                title: const LocalizedText(
                                  'logout',
                                  textAlign: TextAlign.center,
                                ),
                                content: const LocalizedText(
                                    'are_you_sure_you_want_to_logout?'),
                                actions: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
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
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 8),
                                            child: LocalizedText('logout',
                                                style: AppTheme.normalTextStyle
                                                    .copyWith(
                                                        color: Colors.white))),
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
                                    Text('logout', style: AppTheme.titleStyle3),
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
                          onTap: () {
                            Get.dialog(
                              AlertDialog(
                                title: const LocalizedText(
                                  'delete_account',
                                  textAlign: TextAlign.center,
                                ),
                                content: const LocalizedText(
                                    'are_you_sure_you_want_to_delete_your_account?'),
                                actions: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
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
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 8),
                                            child: LocalizedText('delete',
                                                style: AppTheme.normalTextStyle
                                                    .copyWith(
                                                        color: Colors.white))),
                                        onPressed: () {
                                          _authController.deleteAccount();
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
                                    Text('delete_account',
                                        style: AppTheme.titleStyle3),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : SizedBox()
            ]),
          ),
        ));
  }
}
