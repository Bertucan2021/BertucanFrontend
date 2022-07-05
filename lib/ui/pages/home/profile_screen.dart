
import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/widgets/custom_textfield.dart';
import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({Key? key}) : super(key: key);
  
  final TextEditingController _nameemailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:AppTheme.peachBackground,
      
      body:  Padding(
        padding:  const EdgeInsets.only(left: 10, right: 15, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Align(
              alignment: Alignment.centerRight,
              child: const LocalizedText("logout",style: AppTheme.titleStyle)),
              const Padding(
            padding: EdgeInsets.only(top: 8.0,left: 20, bottom: 10),
            
            child: Text('Profile', style: AppTheme.titleStyle2),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              CircleAvatar(
                child:Image.asset('assets/profile.png'),
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
                    Text('Age: 27', style: AppTheme.hintTextStyle,)
                  ],
                ),
              ), 

            ],
          ),
          const SizedBox(height: 20,),
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
          const SizedBox(height: 25,),
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
          )
        ],
      ),)
    );
  }
}
