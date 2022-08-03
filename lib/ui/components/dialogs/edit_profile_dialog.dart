import 'package:bertucanfrontend/core/models/freezed_models.dart';
import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/controllers/auth_controller.dart';
import 'package:bertucanfrontend/ui/widgets/ModalProgressHUD.dart';
import 'package:bertucanfrontend/ui/widgets/custom_dialog.dart';
import 'package:bertucanfrontend/ui/widgets/custom_textfield.dart';
import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class EditProfileDialog extends StatefulWidget {
  EditProfileDialog({Key? key}) : super(key: key);

  @override
  State<EditProfileDialog> createState() => _EditProfileDialogState();
}

class _EditProfileDialogState extends State<EditProfileDialog> {
  var _editFormKey = GlobalKey<FormState>();

  final ImagePicker _imagePicker = ImagePicker();

  final TextEditingController _firstNameController = TextEditingController();

  final TextEditingController _lastNameController = TextEditingController();

  String _ageController = "";
  String? _imageFile;

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  final AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomDialog(
            title: 'edit_profile',
            content: [
              SingleChildScrollView(
                child: Form(
                  key: _editFormKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LocalizedText('profile_picture',
                          style: AppTheme.normalTextStyle),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () async {
                              await takePhoto(ImageSource.gallery);
                            },
                            child: Container(
                                decoration: AppTheme.whiteBoxDecoration(),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 8),
                                child: LocalizedText('select',
                                    style: AppTheme.normalPrimaryTextStyle)),
                          ),
                          SizedBox(width: 10),
                          _imageFile != null
                              ? Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 8),
                                  child: Text(_imageFile!.split('/').last,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: AppTheme.normalPrimaryTextStyle))
                              : Container(),
                        ],
                      ),
                      SizedBox(height: 20),
                      CustomTextField(
                        label: 'first_name',
                        controller: _firstNameController,
                        hintText: 'enter_your_first_name',
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
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
                          if (value == null || value.isEmpty) {
                            return "last_name_required".tr;
                          }
                          return null;
                        },
                      ),
                      CustomTextField(
                        label: 'email',
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        hintText: 'enter_your_email',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
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
                          if (value == null || value.isEmpty) {
                            return "phone_required".tr;
                          }
                          if (!RegExp(r"^(?:\+2519|09)[0-9]{8}$")
                              .hasMatch(value)) {
                            return "invalid_phone".tr;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      LocalizedText('data_of_birth',
                          style: AppTheme.normalTextStyle),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          InkWell(
                            onTap: () => showDatePicker(
                              context: context,
                              firstDate: DateTime.now()
                                  .subtract(Duration(days: 50 * 365)),
                              lastDate: DateTime.now()
                                  .subtract(Duration(days: 365 * 10)),
                              initialDate: DateTime.now()
                                  .subtract(Duration(days: 365 * 10)),
                            ).then((value) {
                              if (value != null) {
                                setState(() {
                                  _ageController =
                                      DateFormat.yMd().format(value);
                                });
                              }
                            }),
                            child: Container(
                                decoration: AppTheme.whiteBoxDecoration(),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 8),
                                child: LocalizedText('select',
                                    style: AppTheme.normalPrimaryTextStyle)),
                          ),
                          SizedBox(width: 10),
                          _ageController != ""
                              ? Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 8),
                                  child: Text(_ageController,
                                      style: AppTheme.normalPrimaryTextStyle))
                              : Container(),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
            onConfirm: () async => {
                  if (_editFormKey.currentState!.validate() &&
                      _ageController != "")
                    {
                      await _authController.editProfile(
                          UserToEdit(
                              first_name: _firstNameController.text,
                              last_name: _lastNameController.text,
                              email: _emailController.text,
                              phone_number: _phoneController.text,
                              birthdate: _ageController,
                              status: "active"),
                          _imageFile ?? ""),
                      Get.back(),
                    },
                }),
        Obx(() => ModalProgressHUD(
              inAsyncCall: _authController.status.isLoading,
            )),
      ],
    );
  }

  Future<void> takePhoto(ImageSource source) async {
    final pickedFile = await _imagePicker.getImage(source: source);
    setState(() {
      _imageFile = pickedFile?.path;
    });
  }
}
