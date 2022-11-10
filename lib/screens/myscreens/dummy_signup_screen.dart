import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/global/global.dart';
import 'package:flutter_tutorial/home.dart';
import 'package:flutter_tutorial/screens/authScreens/custom_text_field.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as fStorage;
import 'package:shared_preferences/shared_preferences.dart';

class DummySignUpScreen extends StatefulWidget {
  const DummySignUpScreen({super.key});


  @override
  State<DummySignUpScreen> createState() => _DummySignUpScreenState();
}

class _DummySignUpScreenState extends State<DummySignUpScreen> {

  final TextEditingController nameTextEditingController = TextEditingController();
  final TextEditingController emailTextEditingController = TextEditingController();
  final TextEditingController passwordTextEditingController = TextEditingController();
  final TextEditingController confirmPasswordTextEditingController = TextEditingController();
  //Uint8List? _image;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String downloadUrlImage = "";
   
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
            String fileName = DateTime.now().microsecondsSinceEpoch.toString();
            fStorage.Reference storageRef = fStorage.FirebaseStorage.instance
                .ref()
                .child("usersImages").child(fileName);

            fStorage.UploadTask uploadImageTask = storageRef.putFile(File(imgXFile!.path));

            fStorage.TaskSnapshot taskSnapshot = await uploadImageTask.whenComplete(() {});

            await taskSnapshot.ref.getDownloadURL().then((urlImage) {
              downloadUrlImage = urlImage;
            });

            // 2. save the user info to firebase database
            saveInformationToDatabase();
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

  saveInformationToDatabase() async {
    // authenticate the user first
    User? currentUser;

    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailTextEditingController.text.trim(), 
      password: passwordTextEditingController.text.trim(),
    ).then((auth) {
      currentUser = auth.user;
    }).catchError((errorMessage) {
      Fluttertoast.showToast(msg: "Error Occured : \n $errorMessage");
    });

    if (currentUser != null) {
      // save info to database and save locally
      saveInfoToFirestoreAndLocally(currentUser!);
    }
  }

  saveInfoToFirestoreAndLocally(User currentUser) async {
    // save to firestore
    FirebaseFirestore.instance
        .collection("users")
        .doc(currentUser.uid)
        .set({
          "uid": currentUser.uid,
          "email": currentUser.email,
          "name": nameTextEditingController.text.trim(),
          "photoUrl": downloadUrlImage,
          "status": "approved",
          "userCart": ["initialValue"],
        });

    // save loacally
    sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences!.setString("uid", currentUser.uid);
    await sharedPreferences!.setString("email", currentUser.email!);
    await sharedPreferences!.setString("name", nameTextEditingController.text.trim());
    await sharedPreferences!.setString("photoUrl", downloadUrlImage);
    await sharedPreferences!.setStringList("userCart", ["initialValue"]);

    Navigator.push(context, MaterialPageRoute(builder: (c) => Home()));
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(child: Container(), flex: 2,),
              Text(
                  "Hello World",
                  style: TextStyle(
                    fontFamily: "Countryside",
                    //fontFamily: "Signamaestro",
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              const SizedBox(height: 10,),
              //get or capture image
      
              Stack(
                  children: [
                    imgXFile != null
                      ? CircleAvatar(
                        radius: MediaQuery.of(context).size.height * 0.10,
                        backgroundImage: FileImage(File(imgXFile!.path),),
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
                        onPressed: getImageFromGallery,
                        icon: const Icon(
                          Icons.add_a_photo,
                          color: Colors.lightBlue,
                        ),
                      ),
                    ),
                  ],
              ),
            
      
      
              /*GestureDetector(
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
              ), */
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
      ),
    );
  }
}