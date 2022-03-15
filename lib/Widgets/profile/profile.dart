// ignore_for_file: unnecessary_const

import 'package:bertucanfrontend/Widgets/register/ui/custom_textfiled.dart';
import 'package:bertucanfrontend/Widgets/register/validators.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Validators _validator = Validators();
    return  Scaffold(
      backgroundColor: const Color(0xFFFEEFF2),
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back, size: 25, color: Colors.black,),
        backgroundColor: const Color(0xFFFEEFF2),
        elevation: 0,
        actions: const [Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(child: Text('Logout', style: TextStyle(color: Colors.red),)),
        ),],
      ),
      body:  Padding(padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 8.0,left: 20, bottom: 10),
            child: Text('Profile', style: TextStyle(fontSize: 25, fontFamily: 'Poppins Bold'),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              CircleAvatar(child:Image.asset('assets/profile.png') ,radius: 50,backgroundColor: const Color(0xFFFEEFF2),),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Lauren Kebede', style: TextStyle(fontSize: 18, fontFamily: 'Poppins Medium'),),
                    Text('Age: 27')
                  ],
                ),
              ), 

            ],
          ),
          const SizedBox(height: 20,),
          CustomTextField(initialValue: 'Minasie Alemu',labelText: 'User Name', hintText: 'hintText',inputType: TextInputType.emailAddress,
            validator: (value) => _validator.validateEmail(value)?.toString(),),
          const SizedBox(height: 10,),
          const Padding(
            padding: EdgeInsets.only(top: 8.0,left: 15, bottom: 10),
            child: Text('Your Email: minalem.5d@gmail.com'),
          )
        ],
      ),)
    );
  }
}
