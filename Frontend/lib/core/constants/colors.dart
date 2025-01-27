import 'package:flutter/material.dart';

abstract class Colorgraphy {
  Color get primaryColor;
  Color get secondaryColor;
}

class AppColors implements Colorgraphy {
  @override
  Color get primaryColor => const Color(0xFFFFE082); // Replace with the actual color code
 
  @override
  
  Color get secondaryColor =>const Color.fromARGB(255, 254, 214, 94); 
}
