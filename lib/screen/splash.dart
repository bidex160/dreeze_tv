import 'package:dreeze_tv/account/login.dart';
import 'package:dreeze_tv/screen/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool login =  false;
  @override
  void initState() {

    super.initState();
  }
  @override
  void didChangeDependencies()async {
    final  sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      login =   sharedPreferences.getBool('login');
    });
    super.didChangeDependencies();
  }
  void fetchlogin() async{




  }
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
        imageSrc: 'images/banner.png',
        home: login ? HomeScreen(): Login(),
        text: 'DreezeTv',
        textType: TextType.TyperAnimatedText,
        backgroundColor: Colors.blueGrey.shade900,
       textStyle: TextStyle(
         color: Colors.white,
         fontSize: 30
       ),
        duration: 3000);
  }
}
