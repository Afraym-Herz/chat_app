import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
   CustomButton({super.key , required this.onTap , required this.name });
   VoidCallback? onTap ; 
  String name ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Center(child: Text(name)),
      ),
    ) ;
  }
}