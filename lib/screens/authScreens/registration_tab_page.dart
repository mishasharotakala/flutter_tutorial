import 'package:flutter/material.dart';
import 'package:flutter_tutorial/screens/authScreens/custom_text_field.dart';

class RegistrationScreen extends StatefulWidget {

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController confirmPasswordTextEditingController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override 
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            const SizedBox(height: 10,),
            //get or capture image
            GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                radius: MediaQuery.of(context).size.width *0.20,
                backgroundColor: const Color.fromARGB(255, 234, 233, 233),
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
                    isObscre: false,
                    enabled: true,
                  ),
                  //email
                  CustomTextField(
                    textEditingController: emailTextEditingController,
                    iconData: Icons.email,
                    hintText: 'Email',
                    isObscre: false,
                    enabled: true,
                  ),
                  //password
                  CustomTextField(
                    textEditingController: passwordTextEditingController,
                    iconData: Icons.lock,
                    hintText: 'Password',
                    isObscre: true,
                    enabled: true,
                  ),
                  //confirmPassword
                  CustomTextField(
                    textEditingController: confirmPasswordTextEditingController,
                    iconData: Icons.lock_open_sharp,
                    hintText: 'Confirm Password',
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