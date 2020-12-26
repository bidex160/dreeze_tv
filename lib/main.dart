import 'dart:io';
import 'package:dreeze_tv/account/login.dart';
import 'package:dreeze_tv/account/signUp.dart';
import 'package:dreeze_tv/provider/notifier.dart';
import 'package:dreeze_tv/screen/Subscription.dart';
import 'package:dreeze_tv/screen/homescreen.dart';
import 'package:dreeze_tv/screen/playerScreen.dart';
import 'package:dreeze_tv/screen/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:m3u/m3u.dart';
import 'package:provider/provider.dart';

import 'apptheme/app_theme.dart';
void main() => runApp(
    VideoApp()
);

class VideoApp extends StatefulWidget {
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {


    @override
  void initState() {
    super.initState();


  }


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
     providers: [
       ChangeNotifierProvider(
           create :(ctx) =>  SideNotifier()
       ),
     ],
      child: MaterialApp(
        theme: appThemeDark,
        debugShowCheckedModeBanner: false,
        title: 'DreezeTv',

            initialRoute: '/',
        routes: {
          '/':(ctx) => SplashScreen(),
          HomeScreen.routeName:(ctx)=>HomeScreen(),
          Login.routeName:(ctx)=>Login(),
          SignUp.routeName:(ctx)=>SignUp(),
       //   PlayerScreen.routeName:(ctx)=>PlayerScreen(),
          SubscriptionScreen.routeName:(ctx)=>SubscriptionScreen()

        },
      ),
    );
  }
}

// import 'package:dreeze_tv/screen/homescreen.dart';
// /// Flutter code sample for Focus
// // @dart = 2.9
//
// // This example shows how to wrap another widget in a [Focus] widget to make it
// // focusable. It wraps a [Container], and changes the container's color when it
// // is set as the [FocusManager.primaryFocus].
// //
// // If you also want to handle mouse hover and/or keyboard actions on a widget,
// // consider using a [FocusableActionDetector], which combines several different
// // widgets to provide those capabilities.
//
// import 'package:flutter/material.dart';
//
// void main() => runApp(MyApp());
//
// /// This is the main application widget.
// class MyApp extends StatelessWidget {
//   static const String _title = 'Flutter Code Sample';
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: _title,
//       home: MyStatelessWidget(),
//     );
//   }
// }
//
// class FocusableText extends StatelessWidget {
//   const FocusableText(this.data, this.x,{Key key, this.autofocus}) : super(key: key);
//
//   /// The string to display as the text for this widget.
//   final String data;
//   final int x;
//   /// Whether or not to focus this widget initially if nothing else is focused.
//   final bool autofocus;
//
//   @override
//   Widget build(BuildContext context) {
//     return Focus(
//       autofocus: autofocus,
//       child: Builder(builder: (BuildContext context) {
//
//         return Container(
//           padding: EdgeInsets.all(8.0),
//           // Change the color based on whether or not this Container has focus.
//           color: Focus.of(context).hasPrimaryFocus ? Colors.black12 : null,
//           child: InkWell(child: Text(data),
//           onTap: (){
//             Navigator.of(context).push(MaterialPageRoute(
//              builder: (ctx){
//                return HomeScreen();
//              }
//             ));
//           },),
//         );
//       }),
//     );
//   }
// }
//
// /// This is the stateless widget that the main application instantiates.
// class MyStatelessWidget extends StatelessWidget {
//
//   MyStatelessWidget({Key key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(
//         itemBuilder: (context, index) {
//
//           return FocusableText(
//             'Item $index',
//             index,
//             autofocus: index == 0,
//
//           );
//         },
//         itemCount: 50,
//       ),
//     );
//   }
// }
