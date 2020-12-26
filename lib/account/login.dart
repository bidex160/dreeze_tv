import 'package:dreeze_tv/Size_Config/Config.dart';
import 'package:dreeze_tv/apptheme/app_theme.dart';
import 'package:dreeze_tv/main.dart';
import 'package:dreeze_tv/screen/fijkplayer.dart';
import 'package:dreeze_tv/screen/homescreen.dart';
import 'package:dreeze_tv/screen/playerScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;
enum AuthMode { Signup, Login }
class Login extends StatefulWidget {
  static final routeName = '/login';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var login = true;
  var signup = false;
  var error = '';
  var loading=false;
  AuthMode _authMode = AuthMode.Login;

  final GlobalKey _key = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController pasword = TextEditingController();
  TextEditingController num = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  var _hide = true;

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.Signup;
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
  }
  void loginFunction()async{
    final  sharedPreferences = await SharedPreferences.getInstance();
    print('login');
    var par = {'e':'${email.text}', 'p':'${pasword.text}'};
    var url ='https://dreezetv.com/login_tv.php';
  // Navigator.of(context).pushNamed(HomeScreen.routeName);
    var resp = await http.post(url, body: par);

    if(resp.statusCode== 200){

      var username = resp.body.toString().split('|').first;
      var emaile = resp.body.toString().split('|').last;
       print(emaile);
       print(email.text.toLowerCase());
      if(emaile.toLowerCase().trim() == email.text.toLowerCase()){
        sharedPreferences.setString('username', username);
        sharedPreferences.setString('email', emaile);
        sharedPreferences.setBool('login', true);
        Navigator.of(context).pushNamed(HomeScreen.routeName);
      }else{
        setState(() {
          error  = resp.body;
        });
      }

    }
  }
  void signupnFunction()async{

    print('im here');
    var par = {'u':'bidex160','ph':'${num.text}',
      'e':'${email.text}','p':'${pasword.text}', 'f':'${firstname.text}','l':'${lastname.text}'};
    var url ='https://www.dreezetv.com/signup_tv.php';
    var resp = await http.post(url, body: par);

    if(resp.statusCode== 200){
      var split = resp.body.toString().split('|').first;
      if(split.toLowerCase() == 'signup_success'.toLowerCase()){
        print(split);


       Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
      }

    }else{
      print(resp.statusCode);
    }
  }
 // 9378
 //  Widget country(){
 //    return  CountryCodePicker(
 //      onChanged: print,
 //      // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
 //      initialSelection: 'NG',
 //      favorite: ['+39', 'US'],
 //      countryFilter: ['NG', 'FR'],
 //      showFlag: true,
 //      showFlagDialog: false,
 //      comparator: (a, b) => b.name.compareTo(a.name),
 //      //Get the country information relevant to the initial selection
 //      onInit: (code) =>
 //          print("on init ${code.name} ${code.dialCode} ${code.name}"),
 //    );
 //
 //  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      body: Center(
        child: SingleChildScrollView(

          child: Container(
            padding: const EdgeInsets.only(left: 20, right: 20),

            width: Config.xMargin(context,50),

            child: Center(
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Text('DreezeTv'),
                    Container(
                      height: Config.yMargin(context, 10),
                      width: Config.xMargin(context,10),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('images/banner.png')
                          )
                      ),
                      //      child: Image.asset('images/banner.png', fit: BoxFit.cover,)
                    ),
                    SizedBox(height: 20,),
                    Text(_authMode == AuthMode.Signup ? 'Sign Up' :'Login') ,
                    SizedBox(height: 40,),
                    if(_authMode == AuthMode.Login)  Form(

                      key:_key,
                      child:Column(
                        children: [

                          TextFormField(

                            controller: email,

                               style: appThemeDark.textTheme.display2,
                            decoration: InputDecoration(

                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(color: Colors.blueGrey, width: 2.0),
                              ),

                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(color:Colors.blueGrey, width: 2.0),
                              ),
                              prefixIcon: Icon(Icons.email_outlined,
                                  color: Colors.blueGrey),
                              labelText: "Email/Username",

                              labelStyle: appThemeDark.textTheme.display2,


                            ),
                            validator: (value){
                              if(value.isEmpty){
                                return 'Please enter email/username';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10,),
                          TextFormField(

                            controller: pasword,
                            obscureText: _hide,
                            style: appThemeDark.textTheme.display2,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(color: Colors.blueGrey, width: 2.0),
                                ),

                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blueGrey, width: 2.0),
                                    borderRadius: BorderRadius.all(Radius.circular(15))
                                ),
                                // prefixIcon: Icon(Icons.hid,
                                //     color: Colors.black),
                                labelText: "Password",

                                labelStyle:  appThemeDark.textTheme.display2,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    Icons.remove_red_eye,
                                    color: Colors.blueGrey,

                                  ),
                                  onPressed: (){
                                    setState(() {
                                      _hide = !_hide;
                                    });
                                  },
                                )

                            ),
                            validator: (value){
                              if(value.isEmpty){
                                return 'Please enter password';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10,),
                        if(error.isNotEmpty)  Text('$error',  style: appThemeDark.textTheme.display2,),
                          RaisedButton(

                            onPressed: (){
                              loginFunction();

                            },
                            child: Text('Login'),
                          ),
                          FlatButton(
                            onPressed: (){
                              _switchAuthMode();
                            },
                            child: Text('Signup'),
                          )
                        ],
                      ) ,
                    ),
                    if(_authMode == AuthMode.Signup)  Form(

                      key:_key,
                      child:Column(
                        children: [

                          TextFormField(

                            controller: email,

                            style: appThemeDark.textTheme.display2,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blueGrey, width: 2.0),
                              ),

                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blueGrey, width: 2.0),
                              ),
                              prefixIcon: Icon(Icons.email_outlined,
                                  color: Colors.blueGrey),
                              labelText: "Email",

                              labelStyle: appThemeDark.textTheme.display2,


                            ),
                            validator: (value){
                              if(value.isEmpty){
                                return 'Please enter email';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10,),
                          Text('and/or'),
                          SizedBox(height: 10,),
                          TextFormField(
                            style: appThemeDark.textTheme.display2,
                            controller: num,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blueGrey, width: 2.0),
                              ),

                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blueGrey, width: 2.0),
                              ),
                              // prefixIcon: country(),
                              labelText: "Phone",
                             labelStyle:  appThemeDark.textTheme.display2,


                            ),
                            validator: (value){
                              if(value.isEmpty){
                                return 'Please enter phone';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10,),
                          TextFormField(

                            controller: pasword,
                            obscureText: _hide,
                            style: appThemeDark.textTheme.display2,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blueGrey, width: 2.0),
                                ),

                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blueGrey, width: 2.0),
                                ),
                                // prefixIcon: Icon(Icons.hid,
                                //     color: Colors.black),
                                labelText: "Password",

                                labelStyle: appThemeDark.textTheme.display2,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    Icons.remove_red_eye,
                                    color: Colors.blueGrey,

                                  ),
                                  onPressed: (){
                                    setState(() {
                                      _hide = !_hide;
                                    });
                                  },
                                )

                            ),
                            validator: (value){
                              if(value.isEmpty){
                                return 'Please enter password';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10,),
                          TextFormField(

                            controller:firstname,
                                 style: appThemeDark.textTheme.display2,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blueGrey, width: 2.0),
                                ),

                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blueGrey, width: 2.0),
                                ),
                                // prefixIcon: Icon(Icons.hid,
                                //     color: Colors.black),
                                labelText: "FirstName",

                                labelStyle: appThemeDark.textTheme.display2,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    Icons.remove_red_eye,
                                    color: Colors.blueGrey,

                                  ),
                                  onPressed: (){
                                    setState(() {
                                      _hide = !_hide;
                                    });
                                  },
                                )

                            ),
                            validator: (value){
                              if(value.isEmpty){
                                return 'Please enter password';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10,),
                          TextFormField(

                            controller:lastname,
                            style: appThemeDark.textTheme.display2,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blueGrey, width: 2.0),
                              ),

                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blueGrey, width: 2.0),
                              ),
                              // prefixIcon: Icon(Icons.hid,
                              //     color: Colors.black),
                              labelText: "LastName",

                              labelStyle: appThemeDark.textTheme.display2,


                            ),
                            validator: (value){
                              if(value.isEmpty){
                                return 'Please enter password';
                              }
                              return null;
                            },
                          ),
                          RaisedButton(
                            onPressed: (){
                              signupnFunction();
                            },
                            child: Text('Sign Up'),
                          ),
                          SizedBox(height: 10,),
                          FlatButton(
                            onPressed: (){
                              _switchAuthMode();
                            },
                            child: Text('Login'),
                          )

                        ],
                      ) ,
                    ),
                  ],
                )
            ),
          ),
        ),
      ),
    );
  }
}
