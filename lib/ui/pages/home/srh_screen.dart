import 'package:bertucanfrontend/ui/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class SrhScreenPage extends StatelessWidget {
  SrhScreenPage({Key? key}) : super(key: key);
  final TextEditingController _searchController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             CustomTextField(
              label: '',
               hintText: "search",
               controller: _searchController,
               leftIcon: Icons.search,
               )
            ],
          ),
          ),
      )
    );
  }
}
 