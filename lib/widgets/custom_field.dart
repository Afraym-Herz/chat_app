import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomFormTextField extends StatelessWidget {
   CustomFormTextField({super.key , this.onChanged , required this.hintText , this.obsecureText = false });
  final String hintText ;
  Function (String) ? onChanged ;
  bool obsecureText ;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [

        TextFormField(
          obscureText: obsecureText,
          // ignore: body_might_complete_normally_nullable
          validator: (value) {
            if (value!.isEmpty ) return 'field is required';
          },
              style: const TextStyle(
                color: Colors.white
              ),
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: const TextStyle(
                    color: Colors.white
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white ,
                    )
                  ) ,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white ,
                    )
                  )
                ),
                onChanged: onChanged ,
              ),
             const SizedBox(height: 10,)
      ],
    );
  }
}