import 'package:flutter/material.dart';

import '../../../../utils/color.dart';
TextFormField textfiledudf(
    {required String hint,
      required var prefix,
      required bool isphone,
      required bool isAddress,required TextEditingController txtController}) {
  return TextFormField(
    validator: (value) {
      return value!.isEmpty?"This deatils is mandatory":null;
    },
    maxLines: (isAddress) ? 3 : 1,
    keyboardType: (isphone)?TextInputType.number:TextInputType.text,
    decoration: InputDecoration(
        prefixIcon: Icon(
          prefix,
          color: Colors.deepPurple,
        ),
        border: OutlineInputBorder(),
        hintText: '$hint',
        hintStyle: TextStyle(color: Colors.black26),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.red, width: 2)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.deepPurple, width: 2)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: secondary, width: 1))),
  );
}

Text defaulttext(String name) {
  return Text(
    '$name',
    style: TextStyle(color: secondary, fontSize: 17,fontWeight: FontWeight.w400),
  );
}
Text ndefaulttext(String name) {
  return Text(
    '$name',
    style: TextStyle(color: secondary, fontSize: 20,fontWeight: FontWeight.w500),
  );
}

