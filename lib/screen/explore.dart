import 'package:dreeze_tv/provider/notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Explore extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {

  bool handleKey(FocusNode node, RawKeyEvent key) {
    //print("Event runtimeType is ${key.runtimeType.toString()}");
    if(key.runtimeType.toString() == 'RawKeyUpEvent'){

      RawKeyEventDataAndroid data = key.data as RawKeyEventDataAndroid;
      String _keyCode;
      _keyCode = data.keyCode.toString(); //

      //    print("why does this run twice $_keyCode");
      if(data.keyCode ==22){
        print('right');
        // if(pageFocus >= 0){
        //
        //   final x =  Provider.of<SideNotifier>(context, listen: false).openit;
        //   if(x){
        //     Provider.of<SideNotifier>(context, listen: false).changeopen();
        //   }
        //
        //
        // }
      }else if(data.keyCode ==21){

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
        final y =  Provider.of<SideNotifier>(context, listen: false).openit;
        if(y){
          Provider.of<SideNotifier>(context, listen: false).changeview(2);


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
      //    print('open $opennum');
          Provider.of<SideNotifier>(context, listen: false).changeview(4);
       //   print('open $opennum');

          //print('open $opennum');
          //opennum =1;
          // Provider.of<SideNotifier>(context, listen: false).changeview();





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
    return Focus(
      autofocus: true,
      onKey: handleKey,
      child: Center(child: Text('Loading....', style: TextStyle(
          color: Colors.blueGrey
      ),),),
    );
  }
}
