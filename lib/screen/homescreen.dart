
import 'dart:io';
import 'package:dreeze_tv/Size_Config/Config.dart';
import 'package:dreeze_tv/Model/attributeModel.dart';
import 'package:dreeze_tv/Model/model.dart';
import 'package:dreeze_tv/Model/subheadmodel.dart';
import 'package:dreeze_tv/account/profile.dart';
import 'package:dreeze_tv/provider/notifier.dart';
import 'package:dreeze_tv/screen/Subscription.dart';
import 'package:dreeze_tv/screen/explore.dart';
import 'package:dreeze_tv/screen/moviestab.dart';
import 'package:dreeze_tv/screen/tvtab.dart';
import 'package:dreeze_tv/screen/playerScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
class HomeScreen extends StatefulWidget {
  static final routeName = '/home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget currentItem;
 // Widget currentItem = SubscriptionScreen();
  var isCollapsed = true;
  var mbool = false;
  var tvbool = false;
  var subbool = false;
  var probool = false;
  var expbool = false;
  var name = false;
  int opennum =0;

  @override
  void initState() {
    super.initState();
    currentItem =  TvShow();

  }

  Widget TvShow(){

       return  TvTabScreen();


  }
  Widget movies(){

      return  MoviesTab();
  }
  Widget exploreTab(){

      return  Explore();


  }
  Widget subscriptionTab(){
      return  SubscriptionScreen();


  }
  Widget accountTab(){
      return  Profile();


  }




  void handleKey(RawKeyEvent key) {
    print("Event runtimeType is ${key.runtimeType.toString()}");
    if(key.runtimeType.toString() == 'RawKeyDownEvent'){

      RawKeyEventDataAndroid data = key.data as RawKeyEventDataAndroid;
      String _keyCode;
      _keyCode = data.keyCode.toString(); //
      // setState(() {
      //   //  keypress = data.keyCode;
      //   x = _keyCode;
      // });


        if(data.keyCode ==82 || data.keyCode ==21 || data.keyCode ==22 || data.keyCode ==20 ){
          setState(() {
            isCollapsed = true;
          });
          if(!mbool && !subbool && !probool && !tvbool &&expbool && !name){
            setState(() {
              isCollapsed = true;
            });

          }
        }

      //print("why does this run twice $_keyCode");
    }
  }
  void check(){
    print('corfiring');
    if(!mbool && !subbool && !probool && !tvbool &&expbool && !name){
      print('all false');
      setState(() {
        isCollapsed = true;
      });

    }
  }
  bool open = true;
  final focus = FocusNode();
  @override
  Widget build(BuildContext context) {
    final x =Provider.of<SideNotifier>(context).x;
    final sideopen = Provider.of<SideNotifier>(context,listen: true).openit;
     print('$x ddddddddddd');
    return Scaffold(

      backgroundColor: Colors.blueGrey.shade900,

      body: Row(
        children: [

            sideopen?    Container(
               width: Config.xMargin(context, 20),
               height:  Config.yMargin(context, 100),
               color:  Colors.blueGrey.shade900,
               child: Column(
                 children: [

                   SizedBox(height:  Config.yMargin(context, 1)),

                   ListView.builder(
                     itemCount: 6,
                     shrinkWrap: true,
                     scrollDirection: Axis.vertical,
                     itemBuilder: (ctx, index){
                       // if(index==0){
                       //   return  Container(
                       //     height:  Config.yMargin(context, 10),
                       //     child: Center(
                       //       child: Text('DreezeTv',
                       //       style: TextStyle(
                       //         fontSize: 25
                       //       ),),
                       //     ),
                       //
                       //
                       //   );
                       // }
                       // if(index ==1){
                       //   return Focus(
                       //     autofocus: true,
                       //     child: Builder(builder: (BuildContext context){
                       //       return  Container(
                       //         height:  Config.yMargin(context, 10),
                       //         decoration: BoxDecoration(
                       //           color: Focus.of(context).hasPrimaryFocus ? Colors.white:Colors.transparent,
                       //        //   border: Border.all(  color: Focus.of(context).hasPrimaryFocus ? Colors.white:Colors.transparent, width: 5),
                       //         ),
                       //         child: Row(
                       //          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       //           children: [
                       //             Icon(
                       //               Icons.home,
                       //               size: 30,
                       //             ),
                       //             SizedBox(width: 6,),
                       //             Text('TvShows',style: TextStyle(
                       //                 fontSize: 25
                       //             ),),
                       //           ],
                       //         ),
                       //       );}),
                       //   );
                       // }
                       if(index == 1){
                         return  Container(
                           height:  Config.yMargin(context, 10),
                           decoration: BoxDecoration(
                             color: x==1 ? Colors.white:Colors.transparent,
                             //border: Border.all(  color: Focus.of(context).hasPrimaryFocus ? Colors.white:Colors.transparent, width: 5),
                           ),
                           child: Row(
                          //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                             children: [
                               SizedBox(width: 6,),
                               Icon(
                                 Icons.home,
                                 size: 25,
                                 color: x ==1 ? Colors.black87:Colors.white,
                               ),
                               SizedBox(width: 6,),
                               Text('TVShows',style: TextStyle(
                                   fontSize: 17,
                                 color: x ==1 ? Colors.black87:Colors.white,
                               ),),
                             ],
                           ),
                         );}
                       if(index == 2){
                         return  Container(
                           height:  Config.yMargin(context, 10),
                           decoration: BoxDecoration(
                             color: x==2 ? Colors.white:Colors.transparent,
                           //  border: Border.all(  color: Focus.of(context).hasPrimaryFocus ? Colors.white:Colors.transparent, width: 5),
                           ),
                           child: Row(
                             //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             children: [
                               SizedBox(width: 6,),
                               Icon(
                                 Icons.movie,
                                 size: 20,
                                 color: x ==2 ? Colors.black87:Colors.white,
                               ),
                               SizedBox(width: 6,),
                               Text('Movies',style: TextStyle(
                                   fontSize:  17,
                                 color: x ==2 ? Colors.black87:Colors.white,
                               ),),
                             ],
                           ),
                         );}
                       if(index == 3){
                         return  Container(
                           height:  Config.yMargin(context, 10),
                           decoration: BoxDecoration(
                             color: x ==3 ? Colors.white:Colors.transparent,
                             //  border: Border.all(  color: Focus.of(context).hasPrimaryFocus ? Colors.white:Colors.transparent, width: 5),
                           ),
                           child: Row(
                             //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             children: [
                               SizedBox(width: 6,),
                               Icon(
                                 Icons.search,
                                 size: 20,
                                 color: x ==3 ? Colors.black87:Colors.white,
                               ),
                               SizedBox(width: 6,),
                               Text('Explore',style: TextStyle(
                                   fontSize: 17,
                                 color: x ==3 ? Colors.black87:Colors.white,
                               ),),
                             ],
                           ),
                         );}
                       if(index == 4){
                         return  Container(
                           height:  Config.yMargin(context, 10),
                           decoration: BoxDecoration(
                            color: x ==4 ? Colors.white:Colors.transparent,
                             //  border: Border.all(  color: Focus.of(context).hasPrimaryFocus ? Colors.white:Colors.transparent, width: 5),
                           ),
                           child: Row(
                             //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             children: [
                               SizedBox(width: 6,),
                               Icon(
                                 Icons.subscriptions,
                                 size: 20,
                                 color: x ==4 ? Colors.black87:Colors.white,
                               ),
                               SizedBox(width: 6,),
                               Text('Subscription',style: TextStyle(
                                   fontSize: 17,
                                 color: x ==4 ? Colors.black87:Colors.white,
                               ),),
                             ],
                           ),
                         );}
                       if(index == 5){
                         return  Container(
                           height:  Config.yMargin(context, 10),
                           decoration: BoxDecoration(
                             color: x==5 ? Colors.white:Colors.transparent,
                             //  border: Border.all(  color: Focus.of(context).hasPrimaryFocus ? Colors.white:Colors.transparent, width: 5),
                           ),
                           child: Row(
                             //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             children: [
                               SizedBox(width: 6,),
                               Icon(
                                 Icons.account_circle_outlined,
                                 size: 20,
                                 color: x ==5 ? Colors.black87:Colors.white,
                               ),
                               SizedBox(width: 6,),
                               Text('Account',style: TextStyle(
                                   fontSize: 17,
                                  color: x ==5 ? Colors.black87:Colors.white,
                               ),),
                             ],
                           ),
                         );}

                         return  Container(
                           height:  Config.yMargin(context, 10),
                           child: Center(
                             child: Text('DreezeTV',
                             style: TextStyle(
                               fontSize: 22,
                                color:Colors.white,
                             ),),
                           ),


                         );

                     },
                   ),
                 ],
               ),
             ):
            Container(
              width: Config.xMargin(context, 5),
              height:  Config.yMargin(context, 100),
              color:  Colors.blueGrey.shade900,
              child: Column(
                children: [

                  SizedBox(height:  Config.yMargin(context, 1)),

                  ListView.builder(
                    itemCount: 6,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (ctx, index){
                      // if(index==0){
                      //   return  Container(
                      //     height:  Config.yMargin(context, 10),
                      //     child: Center(
                      //       child: Text('DreezeTv',
                      //       style: TextStyle(
                      //         fontSize: 25
                      //       ),),
                      //     ),
                      //
                      //
                      //   );
                      // }
                      // if(index ==1){
                      //   return Focus(
                      //     autofocus: true,
                      //     child: Builder(builder: (BuildContext context){
                      //       return  Container(
                      //         height:  Config.yMargin(context, 10),
                      //         decoration: BoxDecoration(
                      //           color: Focus.of(context).hasPrimaryFocus ? Colors.white:Colors.transparent,
                      //        //   border: Border.all(  color: Focus.of(context).hasPrimaryFocus ? Colors.white:Colors.transparent, width: 5),
                      //         ),
                      //         child: Row(
                      //          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //           children: [
                      //             Icon(
                      //               Icons.home,
                      //               size: 30,
                      //             ),
                      //             SizedBox(width: 6,),
                      //             Text('TvShows',style: TextStyle(
                      //                 fontSize: 25
                      //             ),),
                      //           ],
                      //         ),
                      //       );}),
                      //   );
                      // }
                      if(index == 1){
                        return  Container(
                          height:  Config.yMargin(context, 10),
                          decoration: BoxDecoration(
                        //    color: x==1 ? Colors.white,
                            //border: Border.all(  color: Focus.of(context).hasPrimaryFocus ? Colors.white:Colors.transparent, width: 5),
                          ),
                          child: Row(

                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 6,),
                              Icon(
                                Icons.home,
                                size: 25,
                                  color:Colors.white
                              ),
                              SizedBox(width: 6,),
                            ],
                          ),
                        );}
                      if(index == 2){
                        return  Container(
                          height:  Config.yMargin(context, 10),
                          decoration: BoxDecoration(

                            //  border: Border.all(  color: Focus.of(context).hasPrimaryFocus ? Colors.white:Colors.transparent, width: 5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 6,),
                              Icon(
                                Icons.movie,
                                size: 20,
                                  color:  Colors.white
                              ),
                              SizedBox(width: 6,),
                            ],
                          ),
                        );}
                      if(index == 3){
                        return  Container(
                          height:  Config.yMargin(context, 10),
                          decoration: BoxDecoration(
                            //  border: Border.all(  color: Focus.of(context).hasPrimaryFocus ? Colors.white:Colors.transparent, width: 5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 6,),
                              Icon(
                                Icons.search,
                                size: 20,
                                  color: Colors.white
                              ),
                              SizedBox(width: 6,),

                            ],
                          ),
                        );}
                      if(index == 4){
                        return  Container(
                          height:  Config.yMargin(context, 10),
                          decoration: BoxDecoration(

                            //  border: Border.all(  color: Focus.of(context).hasPrimaryFocus ? Colors.white:Colors.transparent, width: 5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 6,),
                              Icon(
                                Icons.subscriptions,
                                size: 20,
                                  color: Colors.white
                              ),
                              SizedBox(width: 6,),

                            ],
                          ),
                        );}
                      if(index == 5){
                        return  Container(
                          height:  Config.yMargin(context, 10),
                          decoration: BoxDecoration(
                          //  color: x ==5 ? Colors.white:Colors.transparent,
                            //  border: Border.all(  color: Focus.of(context).hasPrimaryFocus ? Colors.white:Colors.transparent, width: 5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 6,),
                              Icon(
                                Icons.account_circle_outlined,
                                size: 20,
                                color: Colors.white
                              ),
                              SizedBox(width: 6,),
                            ],
                          ),
                        );}

                      return  Container(
                        height:  Config.yMargin(context, 10),
                        child: Center(

                        ),


                      );

                    },
                  ),
                ],
              ),
            ),
          if(x==1)
          Expanded(child: currentItem),
          if(x==2)
            Expanded(child: MoviesTab()),
          if(x==3)
            Expanded(child: exploreTab()),
          if(x==4)
            Expanded(child: subscriptionTab()),
          if(x==5)
            Expanded(child: accountTab()),
        ],
      ),


      );

  }
 }
