import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/provider/dark_theme_provider.dart';
import 'package:ecommerce/screens/authen/login_screen.dart';
import 'package:ecommerce/screens/authen/widget/check_account_status.dart';
import 'package:ecommerce/screens/authen/widget/custom_divider.dart';
import 'package:ecommerce/screens/authen/widget/email_field.dart';
import 'package:ecommerce/screens/authen/widget/password_field.dart';
import 'package:ecommerce/screens/authen/widget/signup_background.dart';
import 'package:ecommerce/screens/authen/widget/social_linking.dart';
import 'package:ecommerce/services/firebase_authenticate.dart';
import 'package:ecommerce/services/firebase_firestore.dart';
import 'package:ecommerce/utils/constant.dart';
import 'package:ecommerce/widget/bottombar.dart';
import 'package:ecommerce/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class SignUpBody extends StatefulWidget {
  @override
  _SignUpBodyState createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  String _emailInput = '';
  String _passInput = '';
  File? _pickedImage;
  bool _isLoading = false;

  final _key = GlobalKey<FormState>();
  final AuthFirebase _auth = AuthFirebase();
  final FireDatabase _db = FireDatabase();

  _submit() async {
    var date = DateTime.now().toString();
    var dateParse = DateTime.parse(date);
    var formatDate = '${dateParse.day}-${dateParse.month}-${dateParse.year}';
    FocusScope.of(context).unfocus();
    if (_key.currentState!.validate()) {
      setState(() {
        _isLoading = !_isLoading;
      });
      try {
        final result =
            await _auth.signUpWithEmailAndPassword(_emailInput, _passInput);

        print(result ?? 'ok');
        final snackBar = SnackBar(
          content: Text(
            result ?? 'Successful',
            style: GoogleFonts.poppins(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.white,
        );
        if (result != null) {
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {
          final _uid = _auth.instance.currentUser!.uid;
          print(_uid);
          _db.addUser(
            uid: _uid,
            email: _emailInput,
            imageUrl: '',
            joinedDate: formatDate,
            createAt: DateTime.now(),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Future.delayed(
            Duration(milliseconds: 500),
            () {
              Navigator.pushNamed(context, LoginScreen.routeName);
            },
          );
        }
      } finally {
        setState(() {
          _isLoading = !_isLoading;
        });
      }
    }
  }

  _loginWithGoogle() async {
    try {
      setState(() {
        _isLoading = !_isLoading;
      });
      final result = await _auth.signInWithGoogle();
      print(result);
      final snackBar = SnackBar(
        content: Text(
          result ?? 'Error occured! Please try again',
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: GoogleFonts.poppins(
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.white,
      );
      if (result == null) {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Future.delayed(Duration(milliseconds: 300), () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BottomBarScreen(),
            ),
          );
        });
      }
    } finally {
      setState(() {
        _isLoading = !_isLoading;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkThemeProvider>(context);
    final size = MediaQuery.of(context).size;
    print(size);
    return SignUpBackground(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'signup'.toUpperCase(),
              style: GoogleFonts.poppins(
                color: themeProvider.darkTheme
                    ? kPrimaryLightColor
                    : kPrimaryColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: size.height * 0.005,
            ),
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 30,
                  ),
                  child: CircleAvatar(
                    radius: 70,
                    backgroundColor: themeProvider.darkTheme
                        ? kPrimaryLightColor
                        : kPrimaryColor,
                    child: CircleAvatar(
                      radius: 65,
                      backgroundColor: themeProvider.darkTheme
                          ? kPrimaryColor
                          : kPrimaryLightColor,
                      backgroundImage: _pickedImage == null
                          ? null
                          : FileImage(_pickedImage!),
                    ),
                  ),
                ),
                Positioned(
                  right: 30,
                  bottom: 15,
                  child: Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      color: themeProvider.darkTheme
                          ? kPrimaryLightColor
                          : kPrimaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      splashRadius: 29,
                      icon: Icon(
                        Icons.add_a_photo,
                        size: 30,
                        color: themeProvider.darkTheme
                            ? kPrimaryColor
                            : kPrimaryLightColor,
                      ),
                      onPressed: () => _optionImage(context),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Form(
              key: _key,
              child: Column(
                children: [
                  EmailField(
                    darkMode: themeProvider.darkTheme,
                    isSignUp: true,
                    hintText: 'Your Email',
                    icon: Icons.person,
                    onChanged: (String value) {
                      setState(() {
                        _emailInput = value;
                      });
                    },
                  ),
                  PasswordField(
                    darkMode: themeProvider.darkTheme,
                    isSignUp: true,
                    nextAction: TextInputAction.next,
                    onChanged: (String value) {
                      setState(() {
                        _passInput = value;
                      });
                    },
                  ),
                  PasswordField(
                    darkMode: themeProvider.darkTheme,
                    isSignUp: true,
                    onCompleted: null,
                    password: _passInput,
                    isRepeat: true,
                    onChanged: (String value) {},
                  ),
                ],
              ),
            ),
            ButtonWidget(
              text: 'SIGN IN',
              onPressed: _submit,
              isLoading: _isLoading,
            ),
            SizedBox(
              height: size.height * 0.015,
            ),
            CheckHavingAccountStatus(
              darkMode: themeProvider.darkTheme,
              function: () => Navigator.pushNamed(
                context,
                LoginScreen.routeName,
              ),
              type: false,
            ),
            CustomDividerWidget(
              darkMode: themeProvider.darkTheme,
              title: 'OR',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialLinkingAccount(
                  assetName: 'assets/icons/google.svg',
                  onPressed: _loginWithGoogle,
                ),
                SocialLinkingAccount(
                  assetName: 'assets/icons/facebook.svg',
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _optionImage(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Choose option',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              color: kPrimaryColor,
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                ListTile(
                  onTap: _imageFromCamera,
                  leading: Icon(
                    Icons.camera,
                    color: kPrimaryColor,
                  ),
                  title: Text(
                    'Camera',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  onTap: _imageFromGallery,
                  leading: Icon(
                    Icons.collections,
                    color: kPrimaryColor,
                  ),
                  title: Text(
                    'Gallery',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                    ),
                  ),
                ),
                if (_pickedImage != null)
                  ListTile(
                    onTap: _removeImage,
                    leading: Icon(
                      Icons.delete,
                      color: kPrimaryColor,
                    ),
                    title: Text(
                      'Remove',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _imageFromCamera() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      final pickedImageFile = File(pickedImage.path);
      setState(() {
        _pickedImage = pickedImageFile;
      });
    }
    Navigator.pop(context);
  }

  void _imageFromGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      final pickedImageFile = File(pickedImage.path);
      setState(() {
        _pickedImage = pickedImageFile;
      });
    }
    Navigator.pop(context);
  }

  void _removeImage() {
    setState(() {
      _pickedImage = null;
    });
    Navigator.pop(context);
  }
}
