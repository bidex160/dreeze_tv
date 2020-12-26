import 'package:dreeze_tv/Model/model.dart';
import 'package:dreeze_tv/Size_Config/Config.dart';
import 'package:dreeze_tv/apptheme/app_theme.dart';
import 'package:dreeze_tv/provider/notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class MoviesTab extends StatefulWidget {
  @override
  _MoviesTabState createState() => _MoviesTabState();
}

class _MoviesTabState extends State<MoviesTab> {
  final focus = FocusNode();
  int pageFocus = 0;
  List<ListModel> contents =[];
  int verticalCounter = 0;

  bool handleKey(FocusNode node, RawKeyEvent key) {
    //print("Event runtimeType is ${key.runtimeType.toString()}");
    if(key.runtimeType.toString() == 'RawKeyUpEvent'){

      RawKeyEventDataAndroid data = key.data as RawKeyEventDataAndroid;
      String _keyCode;
      _keyCode = data.keyCode.toString(); //

      //    print("why does this run twice $_keyCode");
      if(data.keyCode ==22){
        print('right');
        if(pageFocus >= 0){

          final x =  Provider.of<SideNotifier>(context, listen: false).openit;
          if(x){
            Provider.of<SideNotifier>(context, listen: false).changeopen();
          }


        }
      }else if(data.keyCode ==21){

        if(pageFocus == 0){
          final y =  Provider.of<SideNotifier>(context, listen: false).openit;
          final position = Provider.of<SideNotifier>(context, listen: false).x;
          print('$position po');
          if(!y){
            Provider.of<SideNotifier>(context, listen: false).changeopen();
          }


        }

      }else if(data.keyCode ==19){
        //down for pageview

        // if(open){
        //
        //
        //
        // }else{
        //
        //   setState(() {
        //
        //     if( verticalCounter >= 1){
        //       verticalCounter--;
        //       controller.jumpToPage(verticalCounter);
        //     }
        //
        //   });
        // }

        final y =  Provider.of<SideNotifier>(context, listen: false).openit;
        if(y){
          Provider.of<SideNotifier>(context, listen: false).changeview(1);


        }else{
          setState(() {

            if( verticalCounter >= 1){
              verticalCounter--;
              controller.jumpToPage(verticalCounter);
            }

          });

        }
      }else if (data.keyCode ==20){

        //up for page view

        final y =  Provider.of<SideNotifier>(context, listen: false).openit;

        if(y){
          Provider.of<SideNotifier>(context, listen: false).changeview(3);

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

  PageController controller = PageController(viewportFraction: 1);
  @override
  Widget build(BuildContext context) {
    return contents.isNotEmpty?

    PageView.builder(
        itemCount: contents.length,
        scrollDirection: Axis.vertical,
        controller: controller,
        onPageChanged: (int){
          setState(() {

          });
          setState(() {


          });

        },
        itemBuilder: (ctx, page1index){
          return Container(
            color: Colors.blueGrey.shade900,
            width: Config.xMargin(context, 50),
            height: Config.yMargin(context, 100),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(contents[page1index].Headname, style: appThemeDark.textTheme.title,),
                  ),
                  SizedBox(height: 10,),
                  Container(
                      height: Config.yMargin(context, 50),
                      color: Colors.blueGrey.shade900,
                      width: Config.xMargin(context, 100),
                      child:  ListView.builder(
                        shrinkWrap: true,
                        itemCount:contents[page1index].subhead.length,
                        scrollDirection: Axis.horizontal,

                        itemBuilder: (ctx, indexL){

                          return Focus(
                            // focusNode: focus,
                            onKey: handleKey,

                            onFocusChange: (int){
                              if(int){
                                setState(() {
                                  pageFocus = indexL;
                                });
                                //  print('$indexL index');
                              }

                            },
                            autofocus:indexL ==0 ??  1,
                            child:Builder(builder: (BuildContext context){

                              return Container(
                                height: Config.yMargin(context, 50),
                                width:  Config.xMargin(context, 20),
                                padding: EdgeInsets.all(8.0),
                                color: Colors.blueGrey.shade900,
                                child: Column(
                                  children: [
                                    contents[page1index].subhead[indexL].tvglogo.isNotEmpty
                                        ?  Container(
                                        height: Config.yMargin(context, 30),
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Focus.of(context).hasPrimaryFocus ? Colors.white:Colors.transparent, width: 5),
                                            image: DecorationImage(
                                                fit: BoxFit.contain,
                                                image: NetworkImage(contents[page1index].subhead[indexL].tvglogo)
                                            )

                                        )):
                                    Container(
                                        height: Config.yMargin(context, 30),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color:
                                              Focus.of(context).hasPrimaryFocus
                                                  ? Colors.white:Colors.transparent,

                                              width: 5),
                                        )),

                                    Text(contents[page1index].subhead[indexL].title, overflow: TextOverflow.ellipsis,style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),),

                                  ],
                                ),
                              );}),
                          );

                        },
                      )

                  ),

                  SizedBox(height: 10,),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 8.0),
                  //   child: Text(contents[page1index+1].Headname, style: appThemeDark.textTheme.title,),
                  // ),

                  // Align(
                  //   alignment: Alignment.bottomCenter,
                  //   child: Container(
                  //       height: Config.yMargin(context, 33),
                  //       color: Colors.blueGrey.shade900,
                  //       width: Config.xMargin(context, 100),
                  //       child:  Row(
                  //         children: [
                  //           Container(
                  //             height: Config.yMargin(context, 30),
                  //             width:  Config.xMargin(context, 20),
                  //             padding: EdgeInsets.only(left:8.0, right: 8.0),
                  //             color: Colors.blueGrey.shade900,
                  //             child: Column(
                  //               children: [
                  //                 contents[page1index+1].subhead[0].tvglogo.isNotEmpty
                  //                     ?  Container(
                  //                     height: Config.yMargin(context, 30),
                  //                     decoration: BoxDecoration(
                  //                       //   border: Border.all(color: itemcounter ==indexL ? Colors.white:Colors.transparent, width: 5),
                  //                         image: DecorationImage(
                  //                             fit: BoxFit.cover,
                  //                             image: NetworkImage(contents[page1index].subhead[0].tvglogo)
                  //                         )
                  //
                  //                     )):
                  //                 Container(
                  //                     height: Config.yMargin(context, 30),
                  //                     decoration: BoxDecoration(
                  //                       //border: Border.all(  color: itemcounter ==indexL ? Colors.white:Colors.transparent, width: 5),
                  //                     )),
                  //
                  //
                  //               ],
                  //             ),
                  //           ),
                  //           Container(
                  //             height: Config.yMargin(context, 30),
                  //             width:  Config.xMargin(context, 20),
                  //             padding: EdgeInsets.only(left:8.0, right: 8.0),
                  //             color: Colors.blueGrey.shade900,
                  //             child: Column(
                  //               children: [
                  //                 contents[page1index+1].subhead[1].tvglogo.isNotEmpty
                  //                     ?  Container(
                  //                     height: Config.yMargin(context, 30),
                  //                     decoration: BoxDecoration(
                  //                       //   border: Border.all(color: itemcounter ==indexL ? Colors.white:Colors.transparent, width: 5),
                  //                         image: DecorationImage(
                  //                             fit: BoxFit.cover,
                  //                             image: NetworkImage(contents[page1index+1].subhead[1].tvglogo)
                  //                         )
                  //
                  //                     )):
                  //                 Container(
                  //                     height: Config.yMargin(context, 30),
                  //                     decoration: BoxDecoration(
                  //                       //border: Border.all(  color: itemcounter ==indexL ? Colors.white:Colors.transparent, width: 5),
                  //                     )),
                  //
                  //
                  //               ],
                  //             ),
                  //           ),
                  //           Container(
                  //             height: Config.yMargin(context, 30),
                  //             width:  Config.xMargin(context, 20),
                  //             padding: EdgeInsets.only(left:8.0, right: 8.0),
                  //             color: Colors.blueGrey.shade900,
                  //             child: Column(
                  //               children: [
                  //                 contents[page1index+1].subhead[2].tvglogo.isNotEmpty
                  //                     ?  Container(
                  //                     height: Config.yMargin(context, 30),
                  //                     decoration: BoxDecoration(
                  //                       //   border: Border.all(color: itemcounter ==indexL ? Colors.white:Colors.transparent, width: 5),
                  //                         image: DecorationImage(
                  //                             fit: BoxFit.cover,
                  //                             image: NetworkImage(contents[page1index+1].subhead[2].tvglogo)
                  //                         )
                  //
                  //                     )):
                  //                 Container(
                  //                     height: Config.yMargin(context, 30),
                  //                     decoration: BoxDecoration(
                  //                       //border: Border.all(  color: itemcounter ==indexL ? Colors.white:Colors.transparent, width: 5),
                  //                     )),
                  //
                  //
                  //               ],
                  //             ),
                  //           ),
                  //           Container(
                  //             height: Config.yMargin(context, 30),
                  //             width:  Config.xMargin(context, 20),
                  //             padding: EdgeInsets.only(left:8.0, right: 8.0),
                  //             color: Colors.blueGrey.shade900,
                  //             child: Column(
                  //               children: [
                  //                 contents[page1index+1].subhead[3].tvglogo.isNotEmpty
                  //                     ?  Container(
                  //                     height: Config.yMargin(context, 30),
                  //                     decoration: BoxDecoration(
                  //                       //   border: Border.all(color: itemcounter ==indexL ? Colors.white:Colors.transparent, width: 5),
                  //                         image: DecorationImage(
                  //                             fit: BoxFit.cover,
                  //                             image: NetworkImage(contents[page1index+1].subhead[3].tvglogo)
                  //                         )
                  //
                  //                     )):
                  //                 Container(
                  //                     height: Config.yMargin(context, 30),
                  //                     decoration: BoxDecoration(
                  //                       //border: Border.all(  color: itemcounter ==indexL ? Colors.white:Colors.transparent, width: 5),
                  //                     )),
                  //
                  //
                  //               ],
                  //             ),
                  //           ),
                  //
                  //         ],
                  //       )
                  //
                  //   ),
                  // ),

                ]
            ),
          );

        }


    )
        :Focus(
      onKey: handleKey,
          child: Center(child: Text('Loading....', style: TextStyle(
              color: Colors.blueGrey
          ),),),
        );
  }
}
