import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_tutorial/screens/authScreens/custom_text_field.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
   
   XFile? imgXFile;
   final ImagePicker imagePicker = ImagePicker();

   getImageFromGallery() async {
    imgXFile = await imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      imgXFile;
    });
   }
  
  formValidation() async {
    //image is not selected
    if(imgXFile == null) {
      Fluttertoast.showToast(msg: 'Please select an image.');
    } 
    // image is already selected
    else {
      // password is equal to confirm password
      if(passwordTextEditingController.text == confirmPasswordTextEditingController.text) {
        // check name, email, password and confirmPassword text fields
        if (nameTextEditingController.text.isNotEmpty 
            && emailTextEditingController.text.isNotEmpty
            && passwordTextEditingController.text.isNotEmpty
            && confirmPasswordTextEditingController.text.isNotEmpty
          ) {
            // 1. upload image to storage
            // 2. save the user info to firebase database
          }
          else {
            Fluttertoast.showToast(msg: 'Please complete the form');
          }
      }
      // password is NOT equal to confirm password
      else{
        Fluttertoast.showToast(msg: 'Password and Confirm Password do not match');
      }
    }
  }


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
                getImageFromGallery();
              },
              child: CircleAvatar(
                radius: MediaQuery.of(context).size.width *0.20,
                backgroundColor: const Color.fromARGB(255, 234, 233, 233),
                backgroundImage: imgXFile == null 
                    ? null 
                    : FileImage(
                      File(imgXFile!.path),
                    ),
                child: imgXFile == null 
                    ? Icon(
                      Icons.add_photo_alternate,
                      color: const Color.fromARGB(255, 46, 83, 101),
                      size: MediaQuery.of(context).size.width * 0.20,
                    ) : null,
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
              onPressed: () {
                formValidation();
              }, 
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