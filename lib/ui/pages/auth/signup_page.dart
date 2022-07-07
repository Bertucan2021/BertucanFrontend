import 'package:bertucanfrontend/shared/routes/app_routes.dart';
import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/widgets/custom_textfield.dart';
import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:bertucanfrontend/ui/widgets/rectangular_button.dart';
import 'package:bertucanfrontend/utils/helpers/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  PickedFile? _imageFile;
  final ImagePicker _imagePicker = ImagePicker();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40, top: 40),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundColor: AppTheme.primaryColor,
                    // backgroundImage: _imageFile != null
                    //     ? AssetImage('assets/images/user.png')
                    //     : FileImage(_imageFile!.path),
                 child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),                  
                  Positioned(
                      top: 90,
                      right: 20,
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: ((builder) => bottomspace()));
                        },
                        child:
                            Icon(Icons.camera_alt, color: AppTheme.lightPink),
                      ))
                ]),
              ),
              const SizedBox(
                height: 25,
              ),
              const LocalizedText(
                "hello_there,",
                style: AppTheme.thinTextStyle,
              ),
              const LocalizedText(
                "sign_up_with",
                style: AppTheme.titleStyle,
              ),
              const SizedBox(
                height: 25,
              ),
              CustomTextField(
                label: "full_name",
                hintText: "marry_doe",
                controller: _nameController,
              ),
              CustomTextField(
                  label: "email",
                  hintText: "username@example.com",
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress),
              CustomTextField(
                label: "phone",
                hintText: "09923...",
                controller: _phoneController,
                keyboardType: TextInputType.phone,
              ),
              CustomTextField(
                label: "password",
                hintText: "password",
                controller: _passwordController,
                rightIcon: Icons.remove_red_eye,
                obscureText: true,
              ),
              const SizedBox(
                height: 40,
              ),
              RectangularButton(
                  label: "register",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print("Form is valid");
                    } else {
                      print("Form is invalid");
                    }
                  }),
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.center,
                child: LocalizedText(
                  "or",
                  style: AppTheme.thinTextStyle,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              RectangularButton(
                  label: "continue_without_account",
                  isColorPrimary: false,
                  onPressed: () {
                    Get.toNamed(Routes.questionnairePage);
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const LocalizedText(
                    "already_have_an_account",
                    style: AppTheme.thinTextStyle,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(Routes.loginPage);
                    },
                    child: const LocalizedText(
                      "sign_in",
                      style: AppTheme.buttonLabelStyle2,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }

  Widget bottomspace() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Text("Choose Profile Picture", style: AppTheme.titleStyle),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FlatButton.icon(
                icon: Icon(Icons.photo_camera),
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
                label: Text("Camera"),
              ),
              FlatButton.icon(
                icon: Icon(Icons.photo_library),
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                label: Text("Gallery"),
              ),
            ],
          )
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _imagePicker.getImage(source: source);
    setState(() {
      _imageFile = pickedFile;
    });
  }
}
