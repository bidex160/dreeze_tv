import 'dart:io';

import 'package:dreeze_tv/Size_Config/Config.dart';
import 'package:dreeze_tv/provider/notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  List<int> data = [];
  int _focusIndex =0;
  File _imageFile;
  final ImagePicker _picker = ImagePicker();
  String username='';
  String email ='';

  @override
  void initState() {
    super.initState();
    fetchdetails();
    for(int x=0; x<30; x++){
      data.add(x);
    }

  }
void fetchdetails() async{
  final  sharedPreferences = await SharedPreferences.getInstance();
  setState(() {
    username = sharedPreferences.getString('username');
    email = sharedPreferences.getString('email');

  });

}
Future<void> imagepicker ()async{
final picked = await _picker.getImage(source: ImageSource.gallery,);

setState(() {
  _imageFile = File(picked.path) ;
});
}

  // void _initializeAndPlay(int index) async {
  //   print("_initializeAndPlay -----> $index");
  //   final clip = _clips[index];
  //   final controller = VideoPlayerController.network('https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
  //   final old = _controller;
  //   _controller = controller;
  //   if (old != null) {
  //     old.removeListener(_onControllerUpdated);
  //     await old.pause();
  //   }
  //   setState(() {
  //     debugPrint("---- controller changed");
  //   });
  //
  //   controller
  //     ..initialize().then((_) {
  //       debugPrint("---- controller initialized");
  //       old?.dispose();
  //       _playingIndex = index;
  //       controller.addListener(_onControllerUpdated);
  //       controller.play();
  //       setState(() {});
  //     });
  // }
  //
  // var _updateProgressInterval = 0.0;
  //
  // Future<void> _onControllerUpdated() async {
  //   if (_disposed) return;
  //   final controller = _controller;
  //   if (controller == null) return;
  //   if (!controller.value.initialized) return;
  //   final position = await controller.position;
  //   final duration = controller.value.duration;
  //   if (position == null || duration == null) return;
  //
  //   final playing = controller.value.isPlaying;
  //   final isEndOfClip =
  //       position.inMilliseconds > 0 && position.inSeconds == duration.inSeconds;
  //
  //   // blocking too many updation
  //   final interval = position.inMilliseconds / 250.0;
  //   if (playing && _updateProgressInterval != interval) {
  //     // handle progress indicator
  //     _updateProgressInterval = interval;
  //     if (_disposed) return;
  //     setState(() {
  //       _progress = position.inMilliseconds.ceilToDouble() /
  //           duration.inMilliseconds.ceilToDouble();
  //     });
  //   }
  //
  //   // handle clip end
  //   if (_isPlaying != playing || _isEndOfClip != isEndOfClip) {
  //     _isPlaying = playing;
  //     _isEndOfClip = isEndOfClip;
  //     debugPrint(
  //         "updated -----> isPlaying=$playing / isEndPlaying=$isEndOfClip");
  //     if (isEndOfClip && !playing) {
  //       debugPrint(
  //           "========================== End of Clip / Handle NEXT ========================== ");
  //       final isComplete = _playingIndex == _clips.length - 1;
  //       if (isComplete) {
  //         print("played all!!");
  //         if (!_showingDialog) {
  //           _showingDialog = true;
  //           _showPlayedAllDialog().then((value) {
  //             _exitFullScreen();
  //             _showingDialog = false;
  //           });
  //         }
  //       } else {
  //         _initializeAndPlay(_playingIndex + 1);
  //       }
  //     }
  //   }
  // }
  bool handleKey(FocusNode node, RawKeyEvent key) {
    //print("Event runtimeType is ${key.runtimeType.toString()}");
    if(key.runtimeType.toString() == 'RawKeyUpEvent'){

      RawKeyEventDataAndroid data = key.data as RawKeyEventDataAndroid;
      String _keyCode;
      _keyCode = data.keyCode.toString(); //

      //    print("why does this run twice $_keyCode");
      if(data.keyCode ==22){
        print('right');


          final x =  Provider.of<SideNotifier>(context, listen: false).openit;
          if(x){
            Provider.of<SideNotifier>(context, listen: false).changeopen();
          }



      }else if(data.keyCode ==21){
print('left');
          final y =  Provider.of<SideNotifier>(context, listen: false).openit;
          final position = Provider.of<SideNotifier>(context, listen: false).x;
        //  print('$position po');
          if(!y){
            Provider.of<SideNotifier>(context, listen: false).changeopen();
          }
        // if(pageFocus == 0){
        //   final y =  Provider.of<SideNotifier>(context, listen: false).openit;
        //   final position = Provider.of<SideNotifier>(context, listen: false).x;
        //   print('$position po');
        //   if(!y){
        //     Provider.of<SideNotifier>(context, listen: false).changeopen();
        //   }
        //
        //
        // }

      }else if(data.keyCode ==19){
        print('up');
        final y =  Provider.of<SideNotifier>(context, listen: false).openit;
        if(y){
          Provider.of<SideNotifier>(context, listen: false).changeview(4);


        }else{
          setState(() {
            // if(verticalCounter < contents.length -1){
            //   verticalCounter++;
            //   controller.jumpToPage(verticalCounter);
            // }


          });}


      }else if (data.keyCode ==20){

        //up for page view

        final y =  Provider.of<SideNotifier>(context, listen: false).openit;

        if(y){
          Provider.of<SideNotifier>(context, listen: false).changeview(1);


        }else{
          setState(() {
            // if(verticalCounter < contents.length -1){
            //   verticalCounter++;
            //   controller.jumpToPage(verticalCounter);
            // }


          });}
      }

      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey.shade900,
      height: Config.yMargin(context,100),
      child: Focus(
        onKey: handleKey,
        autofocus: true,
        child: SingleChildScrollView(

         child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Focus(
                  child: SizedBox(height: 30,)),
              InkWell(
                child: CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.white,
                  backgroundImage: _imageFile != null ?FileImage(_imageFile):null,
                ),
                onTap: (){
                  imagepicker();
                },
              ),
              SizedBox(height: 30,),
              Text('WELCOME MR. ${username.toUpperCase()}', style: TextStyle(
                fontSize: 25,
                color:Colors.white
              ),),
              SizedBox(height: 30,),
              Container(
                color: Colors.blueGrey.shade800,
                height: Config.yMargin(context, 20),
                  width: Config.xMargin(context, 50),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      color: Colors.blueGrey.shade700,
                      height: Config.yMargin(context, 12),
                      width:  Config.xMargin(context, 100),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('DreezeTv', style: TextStyle(
                              fontSize: 20,
                              color:Colors.white
                          ),),
                          SizedBox(height: 3,),
                          Text('Confirm', style: TextStyle(
                              fontSize: 10,
                              color:Colors.white
                          ),),
                        ],
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10, top: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Starter'),
                            Text('NGN 4000')
                          ],
                        )),
                  ],
                )
              ),
              SizedBox(height: 30,),
              Container(
                color: Colors.blueGrey.shade800,
                height: Config.yMargin(context, 25),
                padding: const EdgeInsets.all(20),
                width: Config.xMargin(context, 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Row(
                        children: [
                          Text('NGN', style: TextStyle(
                              fontSize: 20,
                              color:Colors.white
                          ),),
                          SizedBox(width: 5,),
                          Text('4500', style: TextStyle(
                              fontSize: 30,
                              color:Colors.white
                          ),)
                        ],
                      ),
                        SizedBox(height: 10,),
                        Text('Next Payment *****', style: TextStyle(
                            fontSize: 10,
                            color:Colors.white
                        ),),
                        SizedBox(height: 7,),
                        Text('View days Payment *****', style: TextStyle(
                        fontSize: 10,
                        color:Colors.blue
                        ),),
                      ],
                    ),

                   Container(
                     height: Config.yMargin(context, 5),
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(20),
                       color: Colors.white
                     ),
                     child: FlatButton(
                       onPressed: () {

                       },
                       child: Text('PAY NOW'),
                     ),
                   )
                  ],
                ),
              ),
              Focus(child: SizedBox(height: 30,)),
              Text('Packages',style: TextStyle(
                  fontSize: 20,
                  color:Colors.white
              ),),
              SizedBox(height: 15,),
              Container(
                height: Config.yMargin(context, 25),
                width: double.infinity,
                alignment: Alignment.center,
                child: ListView(
                  padding: const EdgeInsets.all(8.0),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      color: Colors.blueGrey,
                      margin: const EdgeInsets.only(left: 8.0, right: 8.0),
                       width: Config.xMargin(context, 25),
                      child: Text('Starter'),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 8.0, right: 8.0),
                      color: Colors.blueGrey,
                      height: Config.yMargin(context, 25),
                      width: Config.xMargin(context, 25),
                      child: Text('Bumper'),
                    ),
                    Container(
                      color: Colors.blueGrey,
                      margin: const EdgeInsets.only(left: 8.0, right: 8.0),
                      height: Config.yMargin(context, 25),
                      width: Config.xMargin(context, 25),
                      child: Text('Jumbo'),
                    )
                  ],
                ),
              ),

              Focus(child: SizedBox(height: 30,)),

            ],
          ),
        ),
      ),
    );

  }
}
