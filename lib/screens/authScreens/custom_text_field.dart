import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {

  TextEditingController? textEditingController;
  IconData? iconData;
  String? hintText;
  TextInputType? textInputType;
  bool? isObscre = true;
  bool? enabled = true;

  CustomTextField({
    super.key,
    this.textEditingController, 
    this.iconData, 
    this.hintText,
    this.textInputType,
    this.isObscre, 
    this.enabled,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override 
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      child: TextField(
        enabled: widget.enabled,
        controller: widget.textEditingController,
        obscureText: widget.isObscre!,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
          //hintText: widget.hintText,
          border: InputBorder.none,
          prefixIcon: Icon(
            widget.iconData,
            color: Theme.of(context).primaryColor,
          ),
          focusColor: Theme.of(context).primaryColor,
          hintText: widget.hintText,
          //keyboardType: widget.textInputType,
        ),
        keyboardType: widget.textInputType,
      ),
    );
  }
}