import 'package:flutter/material.dart';
import 'package:flutter_tutorial/screens/authScreens/custom_text_field.dart';
import 'package:flutter_tutorial/screens/authScreens/text_field_input.dart';

class SignUpScreen extends StatefulWidget {

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override 
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }
  @override 
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10,),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 10, color: Colors.white),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Image.asset(
              'assets/images/download.png',
              height: MediaQuery.of(context).size.height * 0.2,
            ),
          ),
          const SizedBox(height: 10,),
          const SizedBox(height: 10,),
          TextFieldInput(
            textEditingController: _nameController, 
            hintText: "Full Name", 
            textInputType: TextInputType.text,
          ),
          TextFieldInput(
            textEditingController: _usernameController, 
            hintText: "Username", 
            textInputType: TextInputType.text,
          ),
          const SizedBox(height: 10,),
          TextFieldInput(
            textEditingController: _emailController, 
            hintText: "Email", 
            textInputType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 10,),
          TextFieldInput(
            textEditingController: _passwordController, 
            hintText: "Password", 
            textInputType: TextInputType.text,
            isPass: true,
          ),
          const SizedBox(height: 10,),
          TextFieldInput(
            textEditingController: _confirmPasswordController, 
            hintText: "Confirm Password", 
            textInputType: TextInputType.text,
          ),
          const SizedBox(height: 20,),
          // Login Button
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
          Flexible(child: Container(), flex: 2,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text("Don't have an account? "),
                padding: const EdgeInsets.symmetric(vertical: 8,),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  child: Text("Sign Up", style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),),
                  padding: const EdgeInsets.symmetric(vertical: 8,),
                ),
              ),
            ],
          ),

          /*Form(
              key: formKey,
              child: Column(
                children: [
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
                  const SizedBox(height: 10,),

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
                      'Login',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30,),
                ],
              ),
            ),*/
            
        ],
      ),
    );
  }
}