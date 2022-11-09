import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tutorial/screens/authScreens/text_field_input.dart';
import 'package:flutter_tutorial/screens/myscreens/pickImage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class SignUpScreen extends StatefulWidget {

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  Uint8List? _image;

  @override 
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(child: Container(), flex: 2,),
              Text(
                'shopping 🛍',
                style: GoogleFonts.lobster(
                  textStyle: const TextStyle(
                    fontSize: 30,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              //svg image,
              /*SvgPicture.asset(
                'assets/shopping-svgrepo-com (1).svg',
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.20,
              ),*/
              const SizedBox(height: 10,),

              // circular widget to accept and show our selected file
              Stack(
                children: [
                  _image != null
                    ? CircleAvatar(
                      radius: 54,
                      backgroundImage: MemoryImage(_image!),
                    )
                  : const CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 241, 214, 214),
                    radius: 54,
                    child: Icon(
                      Icons.person,
                      size: 90,
                      color: Colors.blueGrey,
                    ),
                    /*backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkH5w8otgrD11yjJwk6HW7ENe9E7rpj7qd5Q&usqp=CAU",
                    ),*/
                  ),
                  Positioned(
                    bottom: -10,
                    left: 70,
                    child: IconButton(
                      onPressed: selectImage,
                      icon: const Icon(
                        Icons.add_a_photo,
                        color: Colors.lightBlue,
                      ),
                    ),
                  ),
                  /*GestureDetector(
                    onTap: () {},
                    child: CircleAvatar(
                      radius: MediaQuery.of(context).size.width * 0.15,
                      backgroundColor: Colors.blueGrey,
                      child: Icon(
                        Icons.add_a_photo,
                        color: Colors.grey,
                        size: MediaQuery.of(context).size.width * 0.20,
                      ),
                    ),
                  ),*/
                ],
              ), 
              const SizedBox(height: 10,),

              //text field input for name
              TextFieldInput( 
                hintText: "Full Name", 
                textInputType: TextInputType.text,
                textEditingController: _nameController,
              ),
              const SizedBox(height: 10,),
              //text field input for email
              TextFieldInput( 
                hintText: "Email", 
                textInputType: TextInputType.emailAddress,
                textEditingController: _emailController,
              ),
              const SizedBox(height: 10,),
              //text field input for password,
              TextFieldInput( 
                hintText: "Password", 
                textInputType: TextInputType.text,
                textEditingController: _passwordController,
                isPass: true,
              ),
              const SizedBox(height: 10,),
              //text field input for confirm password,
              TextFieldInput( 
                hintText: "Confirm Password", 
                textInputType: TextInputType.text,
                textEditingController: _passwordController,
                isPass: true,
              ),
              const SizedBox(height: 10,),
              InkWell(
                child: Container(
                  child: const Text("Sign Up"),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4),),
                    ),
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              const SizedBox(height: 12,),
              Flexible(child: Container(), flex: 2,),

              //Transition to loging in
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: const Text("Already has an account? "),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  GestureDetector(
                    child: Container(
                      child: Text(
                        "Login",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}