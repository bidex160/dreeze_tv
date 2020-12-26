import 'package:dreeze_tv/Model/attributeModel.dart';
import 'package:dreeze_tv/Model/model.dart';
import 'package:dreeze_tv/Size_Config/Config.dart';
import 'package:dreeze_tv/apptheme/app_theme.dart';
import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';

class VideoScreen extends StatefulWidget {
  final  List<AttributeModel> list ;
  final int ind;
  final List<ListModel> channels;
  VideoScreen(this.list, this.ind, this.channels);

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  FijkPlayer player = FijkPlayer(
  );
  var showchannels = false;
  List<AttributeModel> attribue = [];
  _VideoScreenState();
  @override
  void initState() {
    super.initState();
   print('${widget.list[widget.ind].link}');
    player.setDataSource('${widget.list[widget.ind].link}', autoPlay: true,);
    fetchattribute();

  }
  // void _initializeAndPlay(int index) async {
  //   print("_initializeAndPlay -----> $index");
  //
  //   final controller =  player.setDataSource('${widget.list[widget.ind].link}', autoPlay: true,);
  //   final old = player;
  //  player = controller as FijkPlayer;
  //   if (old != null) {
  //     old.removeListener(_onControllerUpdated);
  //     await old.pause();
  //   }
  //   setState(() {
  //     debugPrint("---- controller changed");
  //   });
  //
  //
  //   // controller
  //   //   ..i.then((_) {
  //   //     debugPrint("---- controller initialized");
  //   //     old?.dispose();
  //   //     _playingIndex = index;
  //   //     controller.addListener(_onControllerUpdated);
  //   //     controller.play();
  //   //     setState(() {});
  //   //   });
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

  void fetchattribute(){
    widget.channels.forEach((element) {

      element.subhead.forEach((element) {
        attribue.add(AttributeModel(title:element.title,link: element.link, tvgID: element.tvgID, tvglogo: element.tvglogo, grouptitle: element.grouptitle,
        type: element.type));
      });
    });
  }

  void seekto(){

print(player.currentPos.inMilliseconds);
print(player.value.duration);
 // player.pause();
  player.seekTo(player.currentPos.inMilliseconds + 10000);
 player.start();
  }
  void rewind(){

    print(player.currentPos.inMilliseconds);
    print(player.value.duration);
    // player.pause();
    player.seekTo(player.currentPos.inMilliseconds - 10000);
    player.start();
  }

  void playnext(AttributeModel attributeModel){
    player.pause();
    player.setDataSource('${attributeModel.link}', autoPlay: true,);
    setState(() {

    });
  }
  String x = '';

 void handleKey(RawKeyEvent key) {
    print("Event runtimeType is ${key.runtimeType.toString()}");
    if(key.runtimeType.toString() == 'RawKeyDownEvent'){

      RawKeyEventDataAndroid data = key.data as RawKeyEventDataAndroid;
      String _keyCode;
      _keyCode = data.keyCode.toString(); //
    setState(() {
      x = _keyCode;
    });
if(!showchannels){

  if(data.keyCode ==82 || data.keyCode ==21 || data.keyCode ==22 || data.keyCode ==20 ){
    showchannels = !showchannels;
  }
}
      print("why does this run twice $_keyCode");
    }
  }
  final focus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

     body:RawKeyboardListener(
      autofocus: true,
      onKey: handleKey,
      focusNode: focus,
      child: Stack(

        children: [
          FijkView(
              fit: FijkFit.cover,

             fs: true,
             fsFit: FijkFit.cover,
             color: Colors.black87,
               player: player,
          ),
      if(widget.list[widget.ind].grouptitle.toLowerCase().trim().contains('movies'))
        Container(
            alignment: Alignment.center,
            child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                          icon: Icon(
                                Icons.replay_10,
                            color: Colors.white,
                            size: 30,
                          )

                ),

                  IconButton(
                      icon: Icon(
                        Icons.fast_rewind_outlined,
                        color: Colors.white,
                        size: 30,
                      )

                  ),
                  IconButton(
                      icon: Icon(
                        Icons.fast_forward_outlined,
                        color: Colors.white,
                        size: 30,
                      )

                  ),

                  IconButton(
                      icon: Icon(
                          Icons.replay_10,
                        color: Colors.white,
                        size: 30,
                      ),
                    onPressed: (){
                    },
                  ),
        ]
          ),),
        Container(
          height: Config.yMargin(context, 5),
          alignment: Alignment.center,
          child: Text('$x 9999', style: TextStyle(
            color: Colors.black
          ),),
        ),
          new  Container(
              alignment: Alignment.topRight,
              color: Colors.transparent,
              height: Config.yMargin(context, 5),
              margin: const EdgeInsets.only(right: 30, top: 13),
              child:Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.bookmark,
                      color: Colors.white,
                      size: 25,
                    ),
                    onPressed: (){

                    },

                  ),
                  SizedBox(width: 8.0,),
                  Icon(
                    Icons.download_outlined,
                    color: Colors.white,
                    size: 25,
                  )
                ],
              )

          ),
   if(showchannels)
         Container(
           height:Config.yMargin(context,25),
           width: Config.xMargin(context, 70),
          alignment: Alignment.bottomCenter,
           child: ListView.builder(
             itemCount: attribue.length,
          //   shrinkWrap: true,
             scrollDirection: Axis.horizontal,
             itemBuilder: (ctx, index){
               return InkWell(
                     child: Focus(
                       autofocus: index ==0,
                       child:Builder(builder: (BuildContext context){

                       return Center(
                           child:Container(

                          margin: const EdgeInsets.all(4),
                           height: Focus.of(context).hasPrimaryFocus ? Config.yMargin(context, 25) :Config.yMargin(context, 12) ,
                           width: Focus.of(context).hasPrimaryFocus ? Config.xMargin(context, 12) :Config.xMargin(context, 10) ,
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                               children: [
                                       Container(
                                           height: Focus.of(context).hasPrimaryFocus ? Config.yMargin(context, 10) :Config.yMargin(context, 8) ,
                                           width: Focus.of(context).hasPrimaryFocus ? Config.xMargin(context, 10) :Config.xMargin(context, 8) ,

                                           child: attribue[index].tvglogo != null?
                                           Image.network('${attribue[index].tvglogo}'):Container()
                           ),
                                       SizedBox(width: 3,),
                                   if(Focus.of(context).hasPrimaryFocus) Expanded(
                                         child: Container(

                                             child: Text('${attribue[index].title}', style: TextStyle(
                                               color:  Colors.black87,
                                               fontFamily: 'OpenSans',
                                               fontSize: 16,
                                               fontWeight: FontWeight.w400,
                                               fontStyle: FontStyle.normal,
                                             ))),
                                       ),
                                     ],

                             )
                           )

                       );
                       //  return    Text('$index', style: appThemeDark.textTheme.display4,);

                       }),
                     ),
                     onTap: (){
                       playnext(attribue[index]);
                     },
                   );


             },
           ),
         )

        ],
      ),
    ));
  }

  @override
  void dispose() {
    super.dispose();
    player.release();
  }
}

// class FocusableText extends StatelessWidget {
//   const FocusableText(this.data,this.index, {Key key, this.autofocus}) : super(key: key);
//
//   /// The string to display as the text for this widget.
//   final AttributeModel data;
//
//   final int index;
//   // final  List<SubheadModel> list ;
//   /// Whether or not to focus this widget initially if nothing else is focused.
//   final bool autofocus;
//
//   @override
//   Widget build(BuildContext context) {
//     return Focus(
//
//       autofocus: autofocus,
//       child: Builder(builder: (BuildContext context) {
//
//         return Container(
//           height: Config.yMargin(context, 30),
//           width:  Config.xMargin(context, 20),
//           padding: EdgeInsets.all(8.0),
//           // Change the color based on whether or not this Container has focus.
//           decoration: BoxDecoration(
//               border: Border.all(  color: Focus.of(context).hasPrimaryFocus ? Colors.black : Colors.transparent,width: 4)
//           ),
//
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                   height: Config.yMargin(context, 20),
//                   child: data.tvglogo.isNotEmpty ?Image.network(data.tvglogo): Container()),
//
//               Text(data.title, overflow: TextOverflow.ellipsis,style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.white,
//               ),),
//             ],
//           ),
//         );
//       }),
//     );
//   }
// }