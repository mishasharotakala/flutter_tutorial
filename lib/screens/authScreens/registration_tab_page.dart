import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_tutorial/screens/authScreens/custom_text_field.dart';
import 'package:image_picker/image_picker.dart';

class RegistrationTabPage extends StatefulWidget {

  @override
  State<RegistrationTabPage> createState() => _RegistrationTabPageState();
}

class _RegistrationTabPageState extends State<RegistrationTabPage> {

  final TextEditingController nameTextEditingController = TextEditingController();
  final TextEditingController emailTextEditingController = TextEditingController();
  final TextEditingController passwordTextEditingController = TextEditingController();
  final TextEditingController confirmPasswordTextEditingController = TextEditingController();
  //Uint8List? _image;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

 
  /*XFile? imgxFile;
  final ImagePicker imagePicker = ImagePicker();*/

  @override 
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            const SizedBox(height: 10,),
            //get or capture image
            GestureDetector(
              onTap: () {
                //pickImage();
              },
              child: CircleAvatar(
                radius: MediaQuery.of(context).size.width *0.20,
                backgroundColor: const Color.fromARGB(255, 234, 233, 233),
                //backgroundImage: MemoryImage(_image!),
                child: Icon(
                  Icons.add_photo_alternate,
                  color: const Color.fromARGB(255, 46, 83, 101),
                  size: MediaQuery.of(context).size.width * 0.20,
                ),
              ),
            ),
            const SizedBox(height: 5,),
            //inputs form fields
            Form(
              key: formKey,
              child: Column(
                children: [
                  //name
                  CustomTextField(
                    textEditingController: nameTextEditingController,
                    iconData: Icons.person,
                    hintText: 'Name',
                    textInputType: TextInputType.text,
                    isObscre: false,
                    enabled: true,
                  ),
                  //email
                  CustomTextField(
                    textEditingController: emailTextEditingController,
                    iconData: Icons.email,
                    hintText: 'Email',
                    textInputType: TextInputType.emailAddress,
                    isObscre: false,
                    enabled: true,
                  ),
                  //password
                  CustomTextField(
                    textEditingController: passwordTextEditingController,
                    iconData: Icons.lock_outline,
                    hintText: 'Password',
                    textInputType: TextInputType.text,
                    isObscre: true,
                    enabled: true,
                  ),
                  //confirmPassword
                  CustomTextField(
                    textEditingController: confirmPasswordTextEditingController,
                    iconData: Icons.lock_outline,
                    hintText: 'Confirm Password',
                    textInputType: TextInputType.text,
                    isObscre: true,
                    enabled: true,
                  ),

                  const SizedBox(height: 10,),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 12,
                ),
              ),
              onPressed: () {}, 
              child: Text(
                'Sign Up',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}