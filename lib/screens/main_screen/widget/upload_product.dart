import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UploadProductScreen extends StatelessWidget {
  const UploadProductScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('upload',style: GoogleFonts.openSans(),),),
    );
  }
}