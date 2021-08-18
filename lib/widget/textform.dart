import 'package:flutter/material.dart';

import 'package:refactory_test/constant.dart';

class TextForm extends StatefulWidget {
  final String hint;
  final TextEditingController cr;

  final Icon icon;

  const TextForm({
    Key? key,
    required this.hint,
    required this.cr,
    required this.icon,
  }) : super(key: key);

  @override
  _TextFormState createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Material(
        color: Colors.white,
        elevation: 5,
        shadowColor: Colors.black,
        borderRadius: BorderRadius.circular(30),
        child: TextFormField(
          controller: widget.cr,
          keyboardType: TextInputType.multiline,
          style: TextStyle(color: baseColor),
          maxLines: null,
          decoration: InputDecoration(
              errorStyle: const TextStyle(
                fontSize: 12.0,
                backgroundColor: Colors.transparent,
              ),
              counterStyle: const TextStyle(fontSize: 10),
              prefixIcon: widget.icon,
              fillColor: Colors.white,
              filled: true,
              hintText: widget.hint,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.white),
                  gapPadding: 10),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.white),
                  gapPadding: 10)),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class TextFormPass extends StatefulWidget {
  final String hint;
  final TextEditingController cr;

  final Icon icon;
  bool benar = true;

  TextFormPass({
    Key? key,
    required this.hint,
    required this.cr,
    required this.icon,
    required this.benar,
  }) : super(key: key);

  @override
  _TextFormPassState createState() => _TextFormPassState();
}

class _TextFormPassState extends State<TextFormPass> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      shadowColor: Colors.black,
      borderRadius: BorderRadius.circular(30),
      child: TextFormField(
        style: TextStyle(color: baseColor),
        controller: widget.cr,
        obscureText: widget.benar,
        decoration: InputDecoration(
          prefixIcon: widget.icon,
          fillColor: Colors.white,
          filled: true,
          hintText: widget.hint,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          contentPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.white),
              gapPadding: 10),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.white),
              gapPadding: 10),
          suffixIcon: IconButton(
            icon: Icon(
              // Based on passwordVisible state choose the icon
              widget.benar ? Icons.visibility : Icons.visibility_off,
              color: baseColor,
            ),
            onPressed: () {
              // Update the state i.e. toogle the state of passwordVisible variable
              setState(() {
                widget.benar = !widget.benar;
              });
            },
          ),
        ),
      ),
    );
  }
}
