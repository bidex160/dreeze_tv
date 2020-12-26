import 'dart:math';

import 'package:better_player/better_player.dart';
import 'package:dreeze_tv/Model/attributeModel.dart';
import 'package:dreeze_tv/Model/model.dart';
import 'package:dreeze_tv/Size_Config/Config.dart';
import 'package:dreeze_tv/apptheme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';

class PlayerScreen extends StatefulWidget {
  static final routeName = '/player';
  final  List<AttributeModel> list ;
  final int ind;
  final List<ListModel> channels;
  PlayerScreen(this.list, this.ind, this.channels);
  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {

   BetterPlayerController _betterPlayerController;
   List<AttributeModel> attribue = [];
   var showchannels = false;
   String x = '';
   int index1 = 0;
   int index22 = 0;
   final focus = FocusNode();
   var _disposed = false;
   BetterPlayerDataSource betterPlayerDataSource;
   @override
  void initState() {

     betterPlayerDataSource = BetterPlayerDataSource(
        BetterPlayerDataSourceType.NETWORK,
        '${widget.list[widget.ind].link}');
    _betterPlayerController = BetterPlayerController(

        BetterPlayerConfiguration(
        autoPlay: false,
        fullScreenByDefault: true,
        fit: BoxFit.fill,
        controlsConfiguration: BetterPlayerControlsConfiguration(

        customControls: Container(

        )
        )
        ),
        betterPlayerDataSource: betterPlayerDataSource);

    fetchattribute();
    super.initState();
  }
   void _initializeAndPlay() async {
    print("_initializeAndPlay -----> ");
     betterPlayerDataSource = BetterPlayerDataSource(
         BetterPlayerDataSourceType.NETWORK,
         '${widget.channels[index1].subhead[index22].link

         }');

     final controller =  BetterPlayerController(

         BetterPlayerConfiguration(
             autoPlay: false,
             fullScreenByDefault: true,
             fit: BoxFit.fill,
             controlsConfiguration: BetterPlayerControlsConfiguration(

                 customControls: Container(

                 )
             )
         ),
         betterPlayerDataSource: betterPlayerDataSource);
     final old = _betterPlayerController;
    _betterPlayerController = controller ;
     if (old != null) {
      // old.removeListener(_onControllerUpdated);
       await old.pause();
     }
     setState(() {
       debugPrint("---- controller changed");
     });
  //   old?.dispose();

    // controller.addListener(_onControllerUpdated);
     controller.play();
     // controller
     //   ..then((_) {
     //     debugPrint("---- controller initialized");
     //     old?.dispose();
     //
     //     controller.addListener(_onControllerUpdated);
     //     controller.play();
     //     setState(() {});
     //   });
   }
   PageController controller = PageController(viewportFraction: 1);
   void fetchattribute(){
     widget.channels.forEach((element) {

       element.subhead.forEach((element) {
         attribue.add(AttributeModel(title:element.title,link: element.link, tvgID: element.tvgID, tvglogo: element.tvglogo, grouptitle: element.grouptitle,
             type: element.type));
       });
     });
   }
   void handleKey(RawKeyEvent key) {

    if(key.runtimeType.toString() == 'RawKeyDownEvent'){

      RawKeyEventDataAndroid data = key.data as RawKeyEventDataAndroid;
      String _keyCode;
      _keyCode = data.keyCode.toString(); //
      setState(() {
      //  keypress = data.keyCode;
        x = _keyCode;
      });
      // if(showchannels){
      //   if(data.keyCode ==66 ){
      //   print( widget.channels[index1].subhead[index22].title);
      //
      // _initializeAndPlay();
      //   }
      // }
      // if(!showchannels){
      //
      //   if(data.keyCode ==82 || data.keyCode ==21 || data.keyCode ==22 || data.keyCode ==20 ){
      //     setState(() {
      //       showchannels = !showchannels;
      //     });
      //
      //   }
      // }

        if(data.keyCode ==82 || data.keyCode ==21 || data.keyCode ==22 || data.keyCode ==20 ){

          if(showchannels){
            print('Showing already');

          }else{
            setState(() {
              showchannels = !showchannels;
            });
          }


        }
        print("why does this run twice $_keyCode");



    }
  }

  Future<bool> _backpressed(){
    if(showchannels ){
      return Future.value(false);
    }
    return Future.value(true);
  }
  @override
  void dispose() {
    super.dispose();
    _betterPlayerController.pause();
    _betterPlayerController.dispose();

    _betterPlayerController =null;
    // controller.pause();
    // controller.dispose();
    // controller = null;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RawKeyboardListener(
       autofocus: true,
        onKey: handleKey,
        focusNode: focus,
          child: Stack(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: BetterPlayer(
                  controller: _betterPlayerController,
                ),
              ),
              Container(
                height: Config.yMargin(context, 5),
                alignment: Alignment.center,
                child: Text('$x  |9999|$index1||$index22', style: TextStyle(color: Colors.white,
                  fontSize: 25
                ),),
              ),
              if(showchannels)
             Align(
               alignment: Alignment.bottomCenter,
               child: Container(
                 color: Colors.black54,
                 height:Config.yMargin(context,37),
                 width: Config.xMargin(context, 100),
                // alignment: Alignment.topLeft,

                 child: PageView.builder(
                  controller: controller,
                   scrollDirection: Axis.vertical,

                   itemCount:widget.channels.length ,
                   itemBuilder: (BuildContext context, page1index){
                    return Container(
                      height:Config.yMargin(context,35),
                      color: Colors.black54,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.channels[page1index].Headname, style: appThemeDark.textTheme.title,),
                          Container(
                            height:Config.yMargin(context,23),
                            width: Config.xMargin(context, 100),
                            child: ListView.builder(
                              itemCount: widget.channels[page1index].lenght,
                              //     shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (ctx, index2){
                                return Focus(
                                  onFocusChange: (hasfocus){
                                    if(hasfocus ){
                                      setState(() {
                                        // index1 = index;
                                        // index22 = index2;
                                      });
                                    }
                                  },

                                  autofocus: true,
                                  child:Builder(builder: (BuildContext context){
                                    return Container(

                                          padding: const EdgeInsets.all(5),
                                        //  height: Focus.of(context).hasPrimaryFocus ? Config.yMargin(context, 15) :Config.yMargin(context,15) ,
                                        //  width: Focus.of(context).hasPrimaryFocus ? Config.xMargin(context, 12) :Config.xMargin(context, 10) ,
                                        height:Config.yMargin(context,23),
                                        width:  Config.xMargin(context, 16) ,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: Config.yMargin(context, 16) ,
                                              width:  Config.xMargin(context, 16) ,
                                              decoration: BoxDecoration(
                                                  color:Colors.white12,
                                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(18),topRight: Radius.circular(18),
                                                      bottomRight: Radius.circular(18),bottomLeft: Radius.circular(18)
                                                  ),
                                                border: Border.all(

                                                color: Focus.of(context).hasPrimaryFocus?Colors.white:Colors.transparent,
                                                width: 3
                                                ),

                                                  image: DecorationImage(
                                                      fit: BoxFit.contain,
                                                      image: widget.channels[page1index].subhead[index2].tvglogo != null? NetworkImage('${attribue[index2].tvglogo}'):Container()
                                                  )
                                              ),
                                              // height: index ==7? Config.yMargin(context, 8) :Config.yMargin(context, 5) ,
                                              // width: index ==7? Config.xMargin(context, 10) :Config.xMargin(context, 5) ,
                                              //
                                              // child: attribue[index].tvglogo != null?
                                              // Image.network('${attribue[index].tvglogo}'):Container()
                                            ),
                                            SizedBox(height: 4,),
                                             Container(

                                                 child: Text('${widget.channels[page1index].subhead[index2].title}',

                                                     style: TextStyle(

                                                   color:  Colors.white,
                                                   fontFamily: 'OpenSans',
                                                   fontSize: 16,
                                                   fontWeight: FontWeight.w400,
                                                   fontStyle: FontStyle.normal,
                                                 ),
                                                 overflow: TextOverflow.ellipsis,)),



                                          ],

                                        )
                                    );
                                    //  return    Text('$index', style: appThemeDark.textTheme.display4,);

                                  }),
                                );


                              },
                            ),

                          ),

                          if(page1index+1 <widget.channels.length) Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text('${widget.channels[page1index+1].Headname }', style: appThemeDark.textTheme.title,),
                          ),
                        // SizedBox(height: 1,),
                          if(page1index+1 <widget.channels.length)  Align(

                            alignment: Alignment.bottomCenter,
                            child: Container(
                                height: Config.yMargin(context, 5),
                                color: Colors.black54,
                                width: Config.xMargin(context, 100),
                                child: SingleChildScrollView(
                                  child: Container(
                                    height: Config.yMargin(context, 16) ,
                                    width:  Config.xMargin(context, 16) ,
                                    color: Colors.black54,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: <Widget>[
                                        if(widget.channels[page1index+1].subhead.length>0)     Container(
                                          height: Config.yMargin(context, 16) ,
                                          width:  Config.xMargin(context, 16) ,
                                          margin: const EdgeInsets.only(left: 8.0, right: 8.0),
                                          decoration: BoxDecoration(
                                              color:Colors.white12,
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(18),topRight: Radius.circular(18)),
                                              image: DecorationImage(
                                                  fit: BoxFit.contain,
                                                  image: NetworkImage(widget.channels[page1index+1].subhead[0].tvglogo)
                                              )

                                          ),
                                          // child: Image.network(contents[page1index].subhead[indexL].tvglogo,
                                          // fit: BoxFit.fill,),

                                        ),
                                        if(widget.channels[page1index+1].subhead.length>1)     Container(
                                          height: Config.yMargin(context, 16) ,
                                          width:  Config.xMargin(context, 16) ,
                                          margin: const EdgeInsets.only(left: 8.0, right: 8.0),
                                          decoration: BoxDecoration(
                                              color:Colors.white12,
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(18),topRight: Radius.circular(18)),
                                              image: DecorationImage(
                                                  fit: BoxFit.contain,

                                                  image: NetworkImage(widget.channels[page1index+1].subhead[1].tvglogo,)
                                              )

                                          ),
                                          // child: Image.network(contents[page1index+1].subhead[1].tvglogo,
                                          // fit: BoxFit.contain,
                                          //  width:  Config.xMargin(context, 23),
                                          //  // width: ,
                                          // ),

                                        ),
                                        if(widget.channels[page1index+1].subhead.length>2)   Container(
                                          height: Config.yMargin(context, 16) ,
                                          width:  Config.xMargin(context, 16) ,
                                          margin: const EdgeInsets.only(left: 8.0, right: 8.0),
                                          decoration: BoxDecoration(
                                              color:Colors.white12,
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(18),topRight: Radius.circular(18)),
                                              image: DecorationImage(
                                                  fit: BoxFit.contain,
                                                  image: NetworkImage(widget.channels[page1index+1].subhead[2].tvglogo)
                                              )

                                          ),
                                          // child: Image.network(contents[page1index].subhead[indexL].tvglogo,
                                          // fit: BoxFit.fill,),

                                        ),
                                        if(widget.channels[page1index+1].subhead.length>3)   Container(
                                          height: Config.yMargin(context, 16) ,
                                          width:  Config.xMargin(context, 16) ,
                                      //    margin: const EdgeInsets.only(left: 8.0, right: 8.0),
                                          decoration: BoxDecoration(
                                              color:Colors.white12,
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(18),topRight: Radius.circular(18)),
                                              image: DecorationImage(
                                                  fit: BoxFit.contain,
                                                  image: NetworkImage(widget.channels[page1index+1].subhead[3].tvglogo)
                                              )

                                          ),


                                        ),
                                      ],
                                    ),
                                  ),

                                )


                            ),
                          ),






                        ],
                      ),
                    );
                     }
                 ),
               ),
             )

 ],
),
        ),


    );
  }

}
