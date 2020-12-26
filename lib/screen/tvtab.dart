import 'dart:convert';
import 'package:dreeze_tv/Model/attributeModel.dart';
import 'package:dreeze_tv/Model/model.dart';
import 'package:dreeze_tv/Model/subheadmodel.dart';
import 'package:dreeze_tv/Size_Config/Config.dart';
import 'package:dreeze_tv/apptheme/app_theme.dart';
import 'package:dreeze_tv/provider/notifier.dart';
import 'package:dreeze_tv/provider/tvmovies.dart';
import 'package:dreeze_tv/screen/fijkplayer.dart';
import 'package:dreeze_tv/screen/playerScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:m3u/m3u.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';
/// This is the main application widget.
// class TvTabScreen extends StatelessWidget {
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
/// This is the stateless widget that the main application instantiates.
class TvTabScreen extends StatefulWidget {

  TvTabScreen({Key key}) : super(key: key);

  @override
  _TvTabScreenState createState() => _TvTabScreenState();
}

class _TvTabScreenState extends State<TvTabScreen> {
  //  List< Map<String,List<M3uGenericEntry>> > list = [];
  //List<ListModel> list = [];
  bool isCollapsed = true;
 //List<SubheadModel> movies  = [];

// List<M3uGenericEntry> generic = [];



//   Future<void> fetchchannels() async {
//     WidgetsFlutterBinding.ensureInitialized();
//     print('im here');
//     String fileContent =  await rootBundle.loadString('images/tv_channels_dreezetv1_plus.m3u');
//     final List<M3uGenericEntry> listOfTracks = await parseFile(fileContent);
//     // Organized categories
//     final categories =
//     sortedCategories(entries: listOfTracks, attributeName: 'group-title');
//     categories.forEach((key, value) {
//       print(key);
//    //   print('...........*****************............');
//      // var x ={'String':'$key' ,'list':value};
//       //list.add(x);
//      List<SubheadModel> subhead =[];
//       // List<AttributeModel> attribute = [];
//       value.forEach((element) {
//
//         String id= '';
//         String name='';
//         String logo ='';
//         String title='';
//         element.attributes.forEach((key, value) {
//
//            if(key.toLowerCase() == 'tvg-ID'.toLowerCase()){
//              id=value;
//            }else if(key.toLowerCase() == 'tvg-name'.toLowerCase()){
//              name= value;
//            }else if( key.toLowerCase() == 'tvg-logo'.toLowerCase()){
//              logo =value;
//            }
//            else if(key.toLowerCase() == 'group-title'.toLowerCase()){
//              title = value;
//            }
//
//       });
//         // print('$id !! $name !! $logo !! $title');
//
//        // print(attribute)
//         subhead.add(SubheadModel(name: element.title, link: element.link,tvname: name,logo: logo,group: title));
//       });
//
// setState(() {
//   list.add(ListModel(Headname: key,lenght: subhead.length, subhead:subhead ));
//
// });
//
//
//     });
// print('done');
// // filtering();
//   }


//   void filtering() async{
//
//
//      print('filter lenght');
//     int x= 0;
//     list.forEach((element) async {
//       String id= '';
//       String name='';
//       String logo ='';
//       String title='';
//
//       element.subhead.forEach((element) async{
//         x++;
//       attr.add(SubheadModel(name: element.name, link: element.link, tvname: element.tvname, logo: element.logo, group: element.group));
//       });
//       // element.attributes.forEach((key, value) {
//       //
//       //   if(key.toLowerCase() == 'tvg-ID'.toLowerCase()){
//       //     id=value;
//       //   }else if(key.toLowerCase() == 'tvg-name'.toLowerCase()){
//       //     name= value;
//       //   }else if( key.toLowerCase() == 'tvg-logo'.toLowerCase()){
//       //     logo =value;
//       //   }
//       //   else if(key.toLowerCase() == 'group-title'.toLowerCase()){
//       //     title = value;
//       //   }
//       //
//       // });
//     });
//
//      // movies =attr.where((element) {
//      //   if(element.group.toString().toLowerCase().contains('SERIES'.toLowerCase())){
//      //     return true;
//      //   }
//      //   // if(element.Headname.toLowerCase().contains('film')){
//      //   //   return true;
//      //   // }
//      //   return false;
//      // }).toList();
// print(attr.length);
//
// for(int i =0; i<attr.length; i++ ) {
//
//
//   if(attr[i].tvname.toLowerCase().contains('NEWS'.toLowerCase())){
//     var par = {
//       'title': '${attr[i].name}',
//       'link': '${attr[i].link}',
//       'tv_id': '$i',
//       'logo': '${attr[i].logo}',
//       'group_title': '${attr[i].group}',
//       'type': 'News'
//     };
//
//     var resp = await http.post(
//         'https://dreezetv.com/upload_channels.php', body: par);
//     print('done');
//     if (resp.statusCode == 200) {
//       print(resp.statusCode);
//       print(resp.body);
//     } else {
//       print(resp.statusCode);
//     }
//   }
//   if(attr[i].tvname.toLowerCase().contains('ENTERTAINMENT'.toLowerCase())){
//     var par = {
//       'title': '${attr[i].name}',
//       'link': '${attr[i].link}',
//       'tv_id': '$i',
//       'logo': '${attr[i].logo}',
//       'group_title': '${attr[i].group}',
//       'type': 'Entertainment'
//     };
//
//     var resp = await http.post(
//         'https://dreezetv.com/upload_channels.php', body: par);
//     print('done');
//     if (resp.statusCode == 200) {
//       print(resp.statusCode);
//       print(resp.body);
//     } else {
//       print(resp.statusCode);
//     }
//   }
//   if(attr[i].tvname.toLowerCase().contains('SPORTS'.toLowerCase())){
//     var par = {
//       'title': '${attr[i].name}',
//       'link': '${attr[i].link}',
//       'tv_id': '$i',
//       'logo': '${attr[i].logo}',
//       'group_title': '${attr[i].group}',
//       'type': 'Sports'
//     };
//
//     var resp = await http.post(
//         'https://dreezetv.com/upload_channels.php', body: par);
//     print('done');
//     if (resp.statusCode == 200) {
//       print(resp.statusCode);
//       print(resp.body);
//     } else {
//       print(resp.statusCode);
//     }
//   }
//   if(attr[i].tvname.toLowerCase().contains('DOCUMENTARY'.toLowerCase())||
//       attr[i].tvname.toLowerCase().contains('CRIME'.toLowerCase())||
//       attr[i].tvname.toLowerCase().contains('INVESTIGATION'.toLowerCase())  ){
//     var par = {
//       'title': '${attr[i].name}',
//       'link': '${attr[i].link}',
//       'tv_id': '$i',
//       'logo': '${attr[i].logo}',
//       'group_title': '${attr[i].group}',
//       'type': 'Documentary'
//     };
//
//     var resp = await http.post(
//         'https://dreezetv.com/upload_channels.php', body: par);
//     print('done');
//     if (resp.statusCode == 200) {
//       print(resp.statusCode);
//       print(resp.body);
//     } else {
//       print(resp.statusCode);
//     }
//   }
//   if(attr[i].group.toLowerCase().contains('MOVIES'.toLowerCase())||
//       attr[i].group.toLowerCase().contains('FILMS'.toLowerCase())||
//       attr[i].group.toLowerCase().contains('FILME'.toLowerCase())){
//     var par = {
//       'title': '${attr[i].name}',
//       'link': '${attr[i].link}',
//       'tv_id': '$i',
//       'logo': '${attr[i].logo}',
//       'group_title': '${attr[i].group}',
//       'type': 'Movies'
//     };
//
//     var resp = await http.post(
//         'https://dreezetv.com/upload_movies.php', body: par);
//     print('done');
//     if (resp.statusCode == 200) {
//       print(resp.statusCode);
//       print(resp.body);
//     } else {
//       print(resp.statusCode);
//     }
//   }
//   if(attr[i].tvname.toLowerCase().contains('MUSIC'.toLowerCase())){
//     var par = {
//       'title': '${attr[i].name}',
//       'link': '${attr[i].link}',
//       'tv_id': '$i',
//       'logo': '${attr[i].logo}',
//       'group_title': '${attr[i].group}',
//       'type': 'Music'
//     };
//
//     var resp = await http.post(
//         'https://dreezetv.com/upload_channels.php', body: par);
//     print('done');
//     if (resp.statusCode == 200) {
//       print(resp.statusCode);
//       print(resp.body);
//     } else {
//       print(resp.statusCode);
//     }
//   }
//   if(attr[i].tvname.toLowerCase().contains('CARTOON'.toLowerCase())){
//     var par = {
//       'title': '${attr[i].name}',
//       'link': '${attr[i].link}',
//       'tv_id': '$i',
//       'logo': '${attr[i].logo}',
//       'group_title': '${attr[i].group}',
//       'type': 'Cartoon'
//     };
//
//     var resp = await http.post(
//         'https://dreezetv.com/upload_channels.php', body: par);
//     print('done');
//     if (resp.statusCode == 200) {
//       print(resp.statusCode);
//       print(resp.body);
//     } else {
//       print(resp.statusCode);
//     }
//   }
//   if(attr[i].tvname.toLowerCase().contains('COOKING'.toLowerCase())){
//     var par = {
//       'title': '${attr[i].name}',
//       'link': '${attr[i].link}',
//       'tv_id': '$i',
//       'logo': '${attr[i].logo}',
//       'group_title': '${attr[i].group}',
//       'type': 'Cooking'
//     };
//
//     var resp = await http.post(
//         'https://dreezetv.com/upload_channels.php', body: par);
//     print('done');
//     if (resp.statusCode == 200) {
//       print(resp.statusCode);
//       print(resp.body);
//     } else {
//       print(resp.statusCode);
//     }
//   }
//   if(attr[i].tvname.toLowerCase().contains('GAME SHOW'.toLowerCase())){
//     var par = {
//       'title': '${attr[i].name}',
//       'link': '${attr[i].link}',
//       'tv_id': '$i',
//       'logo': '${attr[i].logo}',
//       'group_title': '${attr[i].group}',
//       'type': 'Game'
//     };
//
//     var resp = await http.post(
//         'https://dreezetv.com/upload_channels.php', body: par);
//     print('done');
//     if (resp.statusCode == 200) {
//       print(resp.statusCode);
//       print(resp.body);
//     } else {
//       print(resp.statusCode);
//     }
//   }
//   if(attr[i].tvname.toLowerCase().contains('REALITY'.toLowerCase())){
//     var par = {
//       'title': '${attr[i].name}',
//       'link': '${attr[i].link}',
//       'tv_id': '$i',
//       'logo': '${attr[i].logo}',
//       'group_title': '${attr[i].group}',
//       'type': 'Reality'
//     };
//
//     var resp = await http.post(
//         'https://dreezetv.com/upload_channels.php', body: par);
//     print('done');
//     if (resp.statusCode == 200) {
//       print(resp.statusCode);
//       print(resp.body);
//     } else {
//       print(resp.statusCode);
//     }
//   }
//   if(attr[i].tvname.toLowerCase().contains('WILDLIFE'.toLowerCase())){
//     var par = {
//       'title': '${attr[i].name}',
//       'link': '${attr[i].link}',
//       'tv_id': '$i',
//       'logo': '${attr[i].logo}',
//       'group_title': '${attr[i].group}',
//       'type': 'Wildlife'
//     };
//
//     var resp = await http.post(
//         'https://dreezetv.com/upload_channels.php', body: par);
//     print('done');
//     if (resp.statusCode == 200) {
//       print(resp.statusCode);
//       print(resp.body);
//     } else {
//       print(resp.statusCode);
//     }
//   }
//   if(attr[i].tvname.toLowerCase().contains('KIDS'.toLowerCase())){
//     var par = {
//       'title': '${attr[i].name}',
//       'link': '${attr[i].link}',
//       'tv_id': '$i',
//       'logo': '${attr[i].logo}',
//       'group_title': '${attr[i].group}',
//       'type': 'Kids'
//     };
//
//     var resp = await http.post(
//         'https://dreezetv.com/upload_channels.php', body: par);
//     print('done');
//     if (resp.statusCode == 200) {
//       print(resp.statusCode);
//       print(resp.body);
//     } else {
//       print(resp.statusCode);
//     }
//   }
//   if(attr[i].tvname.toLowerCase().contains('HOLIDAY'.toLowerCase())){
//     var par = {
//       'title': '${attr[i].name}',
//       'link': '${attr[i].link}',
//       'tv_id': '$i',
//       'logo': '${attr[i].logo}',
//       'group_title': '${attr[i].group}',
//       'type': 'Holiday'
//     };
//
//     var resp = await http.post(
//         'https://dreezetv.com/upload_channels.php', body: par);
//     print('done');
//     if (resp.statusCode == 200) {
//       print(resp.statusCode);
//       print(resp.body);
//     } else {
//       print(resp.statusCode);
//     }
//   }
//   if(attr[i].tvname.toLowerCase().contains('TRAVEL'.toLowerCase())){
//     var par = {
//       'title': '${attr[i].name}',
//       'link': '${attr[i].link}',
//       'tv_id': '$i',
//       'logo': '${attr[i].logo}',
//       'group_title': '${attr[i].group}',
//       'type': 'Travel'
//     };
//
//     var resp = await http.post(
//         'https://dreezetv.com/upload_channels.php', body: par);
//     print('done');
//     if (resp.statusCode == 200) {
//       print(resp.statusCode);
//       print(resp.body);
//     } else {
//       print(resp.statusCode);
//     }
//   }
//   if(attr[i].tvname.toLowerCase().contains('FOOD'.toLowerCase())){
//     var par = {
//       'title': '${attr[i].name}',
//       'link': '${attr[i].link}',
//       'tv_id': '$i',
//       'logo': '${attr[i].logo}',
//       'group_title': '${attr[i].group}',
//       'type': 'Food'
//     };
//
//     var resp = await http.post(
//         'https://dreezetv.com/upload_channels.php', body: par);
//     print('done');
//     if (resp.statusCode == 200) {
//       print(resp.statusCode);
//       print(resp.body);
//     } else {
//       print(resp.statusCode);
//     }
//   }
//   if(attr[i].tvname.toLowerCase().contains('FASHION'.toLowerCase())||
//       attr[i].tvname.toLowerCase().contains('LIFESTYLE'.toLowerCase())){
//     var par = {
//       'title': '${attr[i].name}',
//       'link': '${attr[i].link}',
//       'tv_id': '$i',
//       'logo': '${attr[i].logo}',
//       'group_title': '${attr[i].group}',
//       'type': 'Fashion & lifestyle'
//     };
//
//     var resp = await http.post(
//         'https://dreezetv.com/upload_channels.php', body: par);
//     print('done');
//     if (resp.statusCode == 200) {
//       print(resp.statusCode);
//       print(resp.body);
//     } else {
//       print(resp.statusCode);
//     }
//   }
//   if(attr[i].tvname.toLowerCase().contains('ADVENTURE'.toLowerCase())){
//     var par = {
//       'title': '${attr[i].name}',
//       'link': '${attr[i].link}',
//       'tv_id': '$i',
//       'logo': '${attr[i].logo}',
//       'group_title': '${attr[i].group}',
//       'type': 'Adventure'
//     };
//
//     var resp = await http.post(
//         'https://dreezetv.com/upload_channels.php', body: par);
//     print('done');
//     if (resp.statusCode == 200) {
//       print(resp.statusCode);
//       print(resp.body);
//     } else {
//       print(resp.statusCode);
//     }
//   }
//
//   if(i>2586) {
//     if (attr[i].group.toLowerCase().contains('SERIES'.toLowerCase())
//         &&
//         attr[i].tvname.toLowerCase().contains('Comedy'.toLowerCase())
//     ) {
//       var split = attr[i].name
//           .split(' ')
//           .last;
//       var par = {
//         'title': '${attr[i].name}',
//         'link': '${attr[i].link}',
//         'tv_id': '$split',
//         'logo': '${attr[i].logo}',
//         'group_title': '${attr[i].group}',
//         'type': 'Comedy'
//       };
//
//       var resp = await http.post(
//           'https://dreezetv.com/upload_series.php', body: par);
//       print('done');
//       if (resp.statusCode == 200) {
//         print(resp.statusCode);
//         print(resp.body);
//       } else {
//         print(resp.statusCode);
//       }
//     }
//     else if (attr[i].group.toLowerCase().contains('SERIES'.toLowerCase()) &&
//         attr[i].tvname.toLowerCase().contains('Action'.toLowerCase())) {
//       var split = attr[i].name
//           .split(' ')
//           .last;
//       var par = {
//         'title': '${attr[i].name}',
//         'link': '${attr[i].link}',
//         'tv_id': '$split',
//         'logo': '${attr[i].logo}',
//         'group_title': '${attr[i].group}',
//         'type': 'Action'
//       };
//
//       var resp = await http.post(
//           'https://dreezetv.com/upload_series.php', body: par);
//       print('done');
//       if (resp.statusCode == 200) {
//         print(resp.statusCode);
//         print(resp.body);
//       } else {
//         print(resp.statusCode);
//       }
//     }
//     else if ((attr[i].group.toLowerCase().contains('SERIES'.toLowerCase()) &&
//         attr[i].tvname.toLowerCase().contains('Horror'.toLowerCase()))) {
//       var split = attr[i].name
//           .split(' ')
//           .last;
//       var par = {
//         'title': '${attr[i].name}',
//         'link': '${attr[i].link}',
//         'tv_id': '$split',
//         'logo': '${attr[i].logo}',
//         'group_title': '${attr[i].group}',
//         'type': 'Horror'
//       };
//
//       var resp = await http.post(
//           'https://dreezetv.com/upload_series.php', body: par);
//       print('done');
//       if (resp.statusCode == 200) {
//         print(resp.statusCode);
//         print(resp.body);
//       } else {
//         print(resp.statusCode);
//       }
//     }
//     else if ((attr[i].group.toLowerCase().contains('SERIES'.toLowerCase()) &&
//         attr[i].tvname.toLowerCase().contains('Drama'.toLowerCase()))) {
//       var split = attr[i].name
//           .split(' ')
//           .last;
//       var par = {
//         'title': '${attr[i].name}',
//         'link': '${attr[i].link}',
//         'tv_id': '$split',
//         'logo': '${attr[i].logo}',
//         'group_title': '${attr[i].group}',
//         'type': 'Drama'
//       };
//
//       var resp = await http.post(
//           'https://dreezetv.com/upload_series.php', body: par);
//       print('done');
//       if (resp.statusCode == 200) {
//         print(resp.statusCode);
//         print(resp.body);
//       } else {
//         print(resp.statusCode);
//       }
//     }
//     else if ((attr[i].group.toLowerCase().contains('SERIES'.toLowerCase()) &&
//         attr[i].tvname.toLowerCase().contains('Mystery'.toLowerCase()))) {
//       var split = attr[i].name
//           .split(' ')
//           .last;
//       var par = {
//         'title': '${attr[i].name}',
//         'link': '${attr[i].link}',
//         'tv_id': '$split',
//         'logo': '${attr[i].logo}',
//         'group_title': '${attr[i].group}',
//         'type': 'Mystery'
//       };
//
//       var resp = await http.post(
//           'https://dreezetv.com/upload_series.php', body: par);
//       print('done');
//       if (resp.statusCode == 200) {
//         print(resp.statusCode);
//         print(resp.body);
//       } else {
//         print(resp.statusCode);
//       }
//     }
//     else if ((attr[i].group.toLowerCase().contains('SERIES'.toLowerCase()) &&
//         attr[i].tvname.toLowerCase().contains('Romance'.toLowerCase()))) {
//       var split = attr[i].name
//           .split(' ')
//           .last;
//       var par = {
//         'title': '${attr[i].name}',
//         'link': '${attr[i].link}',
//         'tv_id': '$split',
//         'logo': '${attr[i].logo}',
//         'group_title': '${attr[i].group}',
//         'type': 'Romance'
//       };
//
//       var resp = await http.post(
//           'https://dreezetv.com/upload_series.php', body: par);
//       print('done');
//       if (resp.statusCode == 200) {
//         print(resp.statusCode);
//         print(resp.body);
//       } else {
//         print(resp.statusCode);
//       }
//     }
//     else if ((attr[i].group.toLowerCase().contains('SERIES'.toLowerCase()) &&
//         attr[i].tvname.toLowerCase().contains('Thriller'.toLowerCase()))) {
//       var split = attr[i].name
//           .split(' ')
//           .last;
//       var par = {
//         'title': '${attr[i].name}',
//         'link': '${attr[i].link}',
//         'tv_id': '$split',
//         'logo': '${attr[i].logo}',
//         'group_title': '${attr[i].group}',
//         'type': 'Thriller'
//       };
//
//       var resp = await http.post(
//           'https://dreezetv.com/upload_series.php', body: par);
//       print('done');
//       if (resp.statusCode == 200) {
//         print(resp.statusCode);
//         print(resp.body);
//       } else {
//         print(resp.statusCode);
//       }
//     }
//     else if ((attr[i].group.toLowerCase().contains('SERIES'.toLowerCase()) &&
//         attr[i].tvname.toLowerCase().contains('Noir'.toLowerCase()))) {
//       var split = attr[i].name
//           .split(' ')
//           .last;
//       var par = {
//         'title': '${attr[i].name}',
//         'link': '${attr[i].link}',
//         'tv_id': '$split',
//         'logo': '${attr[i].logo}',
//         'group_title': '${attr[i].group}',
//         'type': 'Noir'
//       };
//
//       var resp = await http.post(
//           'https://dreezetv.com/upload_series.php', body: par);
//       print('done');
//       if (resp.statusCode == 200) {
//         print(resp.statusCode);
//         print(resp.body);
//       } else {
//         print(resp.statusCode);
//       }
//     }
//     else if ((attr[i].group.toLowerCase().contains('SERIES'.toLowerCase()) &&
//         attr[i].tvname.toLowerCase().contains('Adventure'.toLowerCase()))) {
//       var split = attr[i].name
//           .split(' ')
//           .last;
//       var par = {
//         'title': '${attr[i].name}',
//         'link': '${attr[i].link}',
//         'tv_id': '$split',
//         'logo': '${attr[i].logo}',
//         'group_title': '${attr[i].group}',
//         'type': 'Adventure'
//       };
//
//       var resp = await http.post(
//           'https://dreezetv.com/upload_series.php', body: par);
//       print('done');
//       if (resp.statusCode == 200) {
//         print(resp.statusCode);
//         print(resp.body);
//       } else {
//         print(resp.statusCode);
//       }
//     }
//     else if ((attr[i].group.toLowerCase().contains('SERIES'.toLowerCase()) &&
//         attr[i].tvname.toLowerCase().contains('Crime'.toLowerCase()))) {
//       var split = attr[i].name
//           .split(' ')
//           .last;
//       var par = {
//         'title': '${attr[i].name}',
//         'link': '${attr[i].link}',
//         'tv_id': '$split',
//         'logo': '${attr[i].logo}',
//         'group_title': '${attr[i].group}',
//         'type': 'Crime'
//       };
//
//       var resp = await http.post(
//           'https://dreezetv.com/upload_series.php', body: par);
//       print('done');
//       if (resp.statusCode == 200) {
//         print(resp.statusCode);
//         print(resp.body);
//       } else {
//         print(resp.statusCode);
//       }
//     }
//     else if ((attr[i].group.toLowerCase().contains('SERIES'.toLowerCase()) &&
//         attr[i].tvname.toLowerCase().contains('Documentary'.toLowerCase()))) {
//       var split = attr[i].name
//           .split(' ')
//           .last;
//       var par = {
//         'title': '${attr[i].name}',
//         'link': '${attr[i].link}',
//         'tv_id': '$split',
//         'logo': '${attr[i].logo}',
//         'group_title': '${attr[i].group}',
//         'type': 'Documentary'
//       };
//
//       var resp = await http.post(
//           'https://dreezetv.com/upload_series.php', body: par);
//       print('done');
//       if (resp.statusCode == 200) {
//         print(resp.statusCode);
//         print(resp.body);
//       } else {
//         print(resp.statusCode);
//       }
//     }
//     else if ((attr[i].group.toLowerCase().contains('SERIES'.toLowerCase()) &&
//         attr[i].tvname.toLowerCase().contains('War'.toLowerCase()))) {
//       var split = attr[i].name
//           .split(' ')
//           .last;
//       var par = {
//         'title': '${attr[i].name}',
//         'link': '${attr[i].link}',
//         'tv_id': '$split',
//         'logo': '${attr[i].logo}',
//         'group_title': '${attr[i].group}',
//         'type': 'War'
//       };
//
//       var resp = await http.post(
//           'https://dreezetv.com/upload_series.php', body: par);
//       print('done');
//       if (resp.statusCode == 200) {
//         print(resp.statusCode);
//         print(resp.body);
//       } else {
//         print(resp.statusCode);
//       }
//     }
//     else if ((attr[i].group.toLowerCase().contains('SERIES'.toLowerCase()) &&
//         attr[i].tvname.toLowerCase().contains('Romantic'.toLowerCase()))) {
//       var split = attr[i].name
//           .split(' ')
//           .last;
//       var par = {
//         'title': '${attr[i].name}',
//         'link': '${attr[i].link}',
//         'tv_id': '$split',
//         'logo': '${attr[i].logo}',
//         'group_title': '${attr[i].group}',
//         'type': 'Romantic'
//       };
//
//       var resp = await http.post(
//           'https://dreezetv.com/upload_series.php', body: par);
//       print('done');
//       if (resp.statusCode == 200) {
//         print(resp.statusCode);
//         print(resp.body);
//       } else {
//         print(resp.statusCode);
//       }
//     }
//     else if ((attr[i].group.toLowerCase().contains('SERIES'.toLowerCase()) &&
//         attr[i].tvname.toLowerCase().contains('Musical'.toLowerCase()))) {
//       var split = attr[i].name
//           .split(' ')
//           .last;
//       var par = {
//         'title': '${attr[i].name}',
//         'link': '${attr[i].link}',
//         'tv_id': '$split',
//         'logo': '${attr[i].logo}',
//         'group_title': '${attr[i].group}',
//         'type': 'Musical'
//       };
//
//       var resp = await http.post(
//           'https://dreezetv.com/upload_series.php', body: par);
//       print('done');
//       if (resp.statusCode == 200) {
//         print(resp.statusCode);
//         print(resp.body);
//       } else {
//         print(resp.statusCode);
//       }
//     }
//     else if ((attr[i].group.toLowerCase().contains('SERIES'.toLowerCase()) &&
//         attr[i].tvname.toLowerCase().contains('Martial'.toLowerCase()))) {
//       var split = attr[i].name
//           .split(' ')
//           .last;
//       var par = {
//         'title': '${attr[i].name}',
//         'link': '${attr[i].link}',
//         'tv_id': '$split',
//         'logo': '${attr[i].logo}',
//         'group_title': '${attr[i].group}',
//         'type': 'Martial'
//       };
//
//       var resp = await http.post(
//           'https://dreezetv.com/upload_series.php', body: par);
//       print('done');
//       if (resp.statusCode == 200) {
//         print(resp.statusCode);
//         print(resp.body);
//       } else {
//         print(resp.statusCode);
//       }
//     }
//     else if ((attr[i].group.toLowerCase().contains('SERIES'.toLowerCase()) &&
//         attr[i].tvname.toLowerCase().contains('Melodrama'.toLowerCase()))) {
//       var split = attr[i].name
//           .split(' ')
//           .last;
//       var par = {
//         'title': '${attr[i].name}',
//         'link': '${attr[i].link}',
//         'tv_id': '$split',
//         'logo': '${attr[i].logo}',
//         'group_title': '${attr[i].group}',
//         'type': 'Melodrama'
//       };
//
//       var resp = await http.post(
//           'https://dreezetv.com/upload_series.php', body: par);
//       print('done');
//       if (resp.statusCode == 200) {
//         print(resp.statusCode);
//         print(resp.body);
//       } else {
//         print(resp.statusCode);
//       }
//     }
//     else if ((attr[i].group.toLowerCase().contains('SERIES'.toLowerCase()) &&
//         attr[i].tvname.toLowerCase().contains('Sports'.toLowerCase()))) {
//       var split = attr[i].name
//           .split(' ')
//           .last;
//       var par = {
//         'title': '${attr[i].name}',
//         'link': '${attr[i].link}',
//         'tv_id': '$split',
//         'logo': '${attr[i].logo}',
//         'group_title': '${attr[i].group}',
//         'type': 'Sports'
//       };
//
//       var resp = await http.post(
//           'https://dreezetv.com/upload_series.php', body: par);
//       print('done');
//       if (resp.statusCode == 200) {
//         print(resp.statusCode);
//         print(resp.body);
//       } else {
//         print(resp.statusCode);
//       }
//     }
//     else if ((attr[i].group.toLowerCase().contains('SERIES'.toLowerCase()) &&
//         attr[i].tvname.toLowerCase().contains('Epic'.toLowerCase()))) {
//       var split = attr[i].name
//           .split(' ')
//           .last;
//       var par = {
//         'title': '${attr[i].name}',
//         'link': '${attr[i].link}',
//         'tv_id': '$split',
//         'logo': '${attr[i].logo}',
//         'group_title': '${attr[i].group}',
//         'type': 'Epic'
//       };
//
//       var resp = await http.post(
//           'https://dreezetv.com/upload_series.php', body: par);
//       print('done');
//       if (resp.statusCode == 200) {
//         print(resp.statusCode);
//         print(resp.body);
//       } else {
//         print(resp.statusCode);
//       }
//     }
//     else if ((attr[i].group.toLowerCase().contains('SERIES'.toLowerCase()) &&
//         attr[i].tvname.toLowerCase().contains('Science'.toLowerCase()))) {
//       var split = attr[i].name
//           .split(' ')
//           .last;
//       var par = {
//         'title': '${attr[i].name}',
//         'link': '${attr[i].link}',
//         'tv_id': '$split',
//         'logo': '${attr[i].logo}',
//         'group_title': '${attr[i].group}',
//         'type': 'Science'
//       };
//
//       var resp = await http.post(
//           'https://dreezetv.com/upload_series.php', body: par);
//       print('done');
//       if (resp.statusCode == 200) {
//         print(resp.statusCode);
//         print(resp.body);
//       } else {
//         print(resp.statusCode);
//       }
//     }
//     else if ((attr[i].group.toLowerCase().contains('SERIES'.toLowerCase()) &&
//         attr[i].tvname.toLowerCase().contains('Zombie'.toLowerCase()))) {
//       var split = attr[i].name
//           .split(' ')
//           .last;
//       var par = {
//         'title': '${attr[i].name}',
//         'link': '${attr[i].link}',
//         'tv_id': '$split',
//         'logo': '${attr[i].logo}',
//         'group_title': '${attr[i].group}',
//         'type': 'Zombie'
//       };
//
//       var resp = await http.post(
//           'https://dreezetv.com/upload_series.php', body: par);
//       print('done');
//       if (resp.statusCode == 200) {
//         print(resp.statusCode);
//         print(resp.body);
//       } else {
//         print(resp.statusCode);
//       }
//     }
//   }
//   // if(i< 5){
//   //
//
//   //   print(split);
//   // }
//
//   // Map<String, String> map = {
//   //   'title': '${attr[i].name}',
//   //   'link': '${attr[i].link}',
//   //   'tv_id': '$x',
//   //   'logo': '${attr[i].logo}',
//   //   'group_title': '${attr[i].group}'
//   // };
//
// }
//
//   }
  List<ListModel> contents =[];
  int verticalCounter = 0;

  int itemcounter = 0;

  final focus = FocusNode();
  int pageFocus = 0;
  ScrollController listcontroller = ScrollController();
  bool open = false;
  double topcontainer = 0;
  int c = 0;
  int opennum =0;


// Widget showpage1 (){
//  return Container(
//    color: Colors.blueGrey.shade900,
//    height: Config.yMargin(context, 100),
//
//    child:ListView.builder(
//
//      itemBuilder: (context, index) {
//     return Container (
//       padding: EdgeInsets.only(left: 8.0),
//       color: Colors.blueGrey.shade900,
//       height: Config.yMargin(context, 35),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//        children: [
//          Text('${list[index].Headname}'),
//
//          Container(
//            color: Colors.blueGrey.shade900,
//            height: Config.yMargin(context, 30),
//            width: double.infinity,
//            child: ListView.builder(
//              shrinkWrap: true,
//              itemCount: 30,
//              scrollDirection: Axis.horizontal,
//              itemBuilder: (ctx,index2){
//                return FocusableText(
//                  '${list[index].subhead[index2].name}',
//                  autofocus: index2 == 0,
//
//                );
//              },
//            ),
//          )
//        ],
//       ),
//     );
//        // return FocusableText(
//        //   'Item $index',
//        //   index,
//        //   autofocus: index == 0,
//        //
//        // );
//      },
//      itemCount: list.length,
//    ),
//
//  );
// }
  bool handleKey(FocusNode node, RawKeyEvent key) {
    //print("Event runtimeType is ${key.runtimeType.toString()}");
    if(key.runtimeType.toString() == 'RawKeyUpEvent'){

      RawKeyEventDataAndroid data = key.data as RawKeyEventDataAndroid;
      String _keyCode;
      _keyCode = data.keyCode.toString(); //

   // print("why does this run twice $_keyCode");
     if(data.keyCode ==22){
       print('right');
       if(pageFocus >= 0){

       final x =  Provider.of<SideNotifier>(context, listen: false).openit;
       if(x){
         Provider.of<SideNotifier>(context, listen: false).changeopen();
       }


       }
     }else if(data.keyCode ==21)
     {

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
       print('up');

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
         print('open $opennum');

        Provider.of<SideNotifier>(context, listen: false).changeview(2);
         print('open $opennum');







       }else{
      setState(() {
        print('down');
       if(verticalCounter < contents.length -1){
         verticalCounter++;
         controller.jumpToPage(verticalCounter);
       }


      });}
     }else if(data.keyCode ==66){
       print('$pageFocus');
       if(pageFocus != null){
         Navigator.of(context).push(MaterialPageRoute(
           builder: (ctx){
             return PlayerScreen(contents[verticalCounter].subhead ,pageFocus,contents );
           }
         ));
       }

     }

      return true;
    }
    return false;
  }

  PageController controller = PageController(viewportFraction: 1);
int num=2 ;
  @override
  void initState() {
    super.initState();
    // listcontroller.addListener(() {
    //
    //   double value = listcontroller.offset/ Config.yMargin(context, 100);
    //   setState(() {
    //     topcontainer = value;
    //   });
    // });
  }
 @override
  void didChangeDependencies() {
    print('im here');
    setState(() {

      // if(contents.isNotEmpty){
      //   news =   contents.where((element) {
      //     if(element.type.toLowerCase() == 'News'.toLowerCase()){
      //       return true;
      //     }
      //     return false;
      //   }).toList();
      //   kids =   contents.where((element) {
      //     if(element.type.toLowerCase() == 'Kids'.toLowerCase()){
      //
      //       return true;
      //     }
      //     return false;
      //   }).toList();
      //
      //   fashion =   contents.where((element) {
      //     if(element.type.toLowerCase() == 'Fashion'.toLowerCase()){
      //       print(element.title);
      //       print(element.link);
      //       return true;
      //     }
      //     return false;
      //   }).toList();
      //   documentary =   contents.where((element) {
      //     if(element.type.toLowerCase() == 'Documentary'.toLowerCase()){
      //       // print(element.title);
      //       // print(element.link);
      //       return true;
      //     }
      //     return false;
      //   }).toList();
      //   crime=   contents.where((element) {
      //     if(element.type.toLowerCase() == 'Crime'.toLowerCase()){
      //       // print(element.title);
      //       // print(element.link);
      //       return true;
      //     }
      //     return false;
      //   }).toList();
      //   series =   contents.where((element) {
      //     if(element.type.toLowerCase() == 'Series'.toLowerCase()){
      //       // print(element.title);
      //       // print(element.link);
      //       return true;
      //     }
      //     return false;
      //   }).toList();
      //   sport =   contents.where((element) {
      //     if(element.type.toLowerCase() == 'SPORTS'.toLowerCase()){
      //       // print(element.title);
      //       // print(element.link);
      //       return true;
      //     }
      //     return false;
      //   }).toList();
      //   movies =   contents.where((element) {
      //     if(element.type.toLowerCase() == 'MOVIES'.toLowerCase()){
      //       // print(element.title);
      //       // print(element.link);
      //       return true;
      //     }
      //     return false;
      //   }).toList();
      //   adventure=   contents.where((element) {
      //     if(element.type.toLowerCase() == 'Adventure'.toLowerCase()){
      //       // print(element.title);
      //       // print(element.link);
      //       return true;
      //     }
      //     return false;
      //   }).toList();
      //   music =   contents.where((element) {
      //     if(element.type.toLowerCase() == 'MUSIC'.toLowerCase()){
      //       // print(element.title);
      //       // print(element.link);
      //       return true;
      //     }
      //     return false;
      //   }).toList();
      //   holiday =   contents.where((element) {
      //     if(element.type.toLowerCase() == 'Holiday'.toLowerCase()){
      //       // print(element.title);
      //       // print(element.link);
      //       return true;
      //     }
      //     return false;
      //   }).toList();
      //   food =   contents.where((element) {
      //     if(element.type.toLowerCase() == 'Food'.toLowerCase()){
      //       // print(element.title);
      //       // print(element.link);
      //       return true;
      //     }
      //     return false;
      //   }).toList();
      //   wildlife =   contents.where((element) {
      //     if(element.type.toLowerCase() == 'Wildlife'.toLowerCase()){
      //       // print(element.title);
      //       // print(element.link);
      //       return true;
      //     }
      //     return false;
      //   }).toList();
      //   travel =   contents.where((element) {
      //     if(element.type.toLowerCase() == 'Travel'.toLowerCase()){
      //       // print(element.title);
      //       // print(element.link);
      //       return true;
      //     }
      //     return false;
      //   }).toList();
      //   reality =   contents.where((element) {
      //     if(element.type.toLowerCase() == 'Reality'.toLowerCase()){
      //       // print(element.title);
      //       // print(element.link);
      //       return true;
      //     }
      //     return false;
      //   }).toList();
      //   game =   contents.where((element) {
      //     if(element.type.toLowerCase() == 'Game'.toLowerCase()){
      //       // print(element.title);
      //       // print(element.link);
      //       return true;
      //     }
      //     return false;
      //   }).toList();
      //
      //   cooking =   contents.where((element) {
      //     if(element.type.toLowerCase() == 'Cooking'.toLowerCase()){
      //       // print(element.title);
      //       // print(element.link);
      //       return true;
      //     }
      //     return false;
      //   }).toList();
      //   cooking =   contents.where((element) {
      //     if(element.type.toLowerCase() == 'Entertainment'.toLowerCase()){
      //       // print(element.title);
      //       // print(element.link);
      //       return true;
      //     }
      //     return false;
      //   }).toList();
      //
      //
      //
      // }

    });
   TvShows.fetchtv().then((value)  {
     setState(() {
       contents = value;
       print(contents.length);
       // if(contents.isNotEmpty){
       //   news =   contents.where((element) {
       //     if(element.type.toLowerCase() == 'News'.toLowerCase()){
       //       return true;
       //     }
       //     return false;
       //   }).toList();
       //   kids =   contents.where((element) {
       //     if(element.type.toLowerCase() == 'Kids'.toLowerCase()){
       //
       //       return true;
       //     }
       //     return false;
       //   }).toList();
       //
       //   fashion =   contents.where((element) {
       //     if(element.type.toLowerCase() == 'Fashion'.toLowerCase()){
       //       print(element.title);
       //       print(element.link);
       //       return true;
       //     }
       //     return false;
       //   }).toList();
       //   documentary =   contents.where((element) {
       //     if(element.type.toLowerCase() == 'Documentary'.toLowerCase()){
       //       // print(element.title);
       //       // print(element.link);
       //       return true;
       //     }
       //     return false;
       //   }).toList();
       //   crime=   contents.where((element) {
       //     if(element.type.toLowerCase() == 'Crime'.toLowerCase()){
       //       // print(element.title);
       //       // print(element.link);
       //       return true;
       //     }
       //     return false;
       //   }).toList();
       //   series =   contents.where((element) {
       //     if(element.type.toLowerCase() == 'Series'.toLowerCase()){
       //       // print(element.title);
       //       // print(element.link);
       //       return true;
       //     }
       //     return false;
       //   }).toList();
       //   sport =   contents.where((element) {
       //     if(element.type.toLowerCase() == 'SPORTS'.toLowerCase()){
       //       // print(element.title);
       //       // print(element.link);
       //       return true;
       //     }
       //     return false;
       //   }).toList();
       //   movies =   contents.where((element) {
       //     if(element.type.toLowerCase() == 'MOVIES'.toLowerCase()){
       //       // print(element.title);
       //       // print(element.link);
       //       return true;
       //     }
       //     return false;
       //   }).toList();
       //   adventure=   contents.where((element) {
       //     if(element.type.toLowerCase() == 'Adventure'.toLowerCase()){
       //       // print(element.title);
       //       // print(element.link);
       //       return true;
       //     }
       //     return false;
       //   }).toList();
       //   music =   contents.where((element) {
       //     if(element.type.toLowerCase() == 'MUSIC'.toLowerCase()){
       //       // print(element.title);
       //       // print(element.link);
       //       return true;
       //     }
       //     return false;
       //   }).toList();
       //   holiday =   contents.where((element) {
       //     if(element.type.toLowerCase() == 'Holiday'.toLowerCase()){
       //       // print(element.title);
       //       // print(element.link);
       //       return true;
       //     }
       //     return false;
       //   }).toList();
       //   food =   contents.where((element) {
       //     if(element.type.toLowerCase() == 'Food'.toLowerCase()){
       //       // print(element.title);
       //       // print(element.link);
       //       return true;
       //     }
       //     return false;
       //   }).toList();
       //   wildlife =   contents.where((element) {
       //     if(element.type.toLowerCase() == 'Wildlife'.toLowerCase()){
       //       // print(element.title);
       //       // print(element.link);
       //       return true;
       //     }
       //     return false;
       //   }).toList();
       //   travel =   contents.where((element) {
       //     if(element.type.toLowerCase() == 'Travel'.toLowerCase()){
       //       // print(element.title);
       //       // print(element.link);
       //       return true;
       //     }
       //     return false;
       //   }).toList();
       //   reality =   contents.where((element) {
       //     if(element.type.toLowerCase() == 'Reality'.toLowerCase()){
       //       // print(element.title);
       //       // print(element.link);
       //       return true;
       //     }
       //     return false;
       //   }).toList();
       //   game =   contents.where((element) {
       //     if(element.type.toLowerCase() == 'Game'.toLowerCase()){
       //       // print(element.title);
       //       // print(element.link);
       //       return true;
       //     }
       //     return false;
       //   }).toList();
       //
       //   cooking =   contents.where((element) {
       //     if(element.type.toLowerCase() == 'Cooking'.toLowerCase()){
       //       // print(element.title);
       //       // print(element.link);
       //       return true;
       //     }
       //     return false;
       //   }).toList();
       //   cooking =   contents.where((element) {
       //     if(element.type.toLowerCase() == 'Entertainment'.toLowerCase()){
       //       // print(element.title);
       //       // print(element.link);
       //       return true;
       //     }
       //     return false;
       //   }).toList();
       //
       //
       //
       // }

     });

   });

   setState(() {
   });


    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return contents.isNotEmpty?

    PageView.builder(
    itemCount: contents.length,
    scrollDirection: Axis.vertical,
   controller: controller,
    onPageChanged: (int){

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
                height: Config.yMargin(context, 60),
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
                           print('$pageFocus index');
                          }

                        },
                        autofocus:indexL ==0 ??  1,
                        child:Builder(builder: (BuildContext context){

                          return Container(
                          height: Config.yMargin(context, 50),
                          width:  Config.xMargin(context, 23),
                          padding: EdgeInsets.all(8.0),
                          color: Colors.blueGrey.shade900,
                          child: Column(
                            children: [
                              contents[page1index].subhead[indexL].tvglogo.isNotEmpty
                                  ?  Container(
                                height: Config.yMargin(context, 25),
                                //  width: ,
                                  decoration: BoxDecoration(
                                    color: Colors.blueGrey.shade800,
                                      border: Border.all(color: Focus.of(context).hasPrimaryFocus ? Colors.white:Colors.transparent, width: 3),
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(18),topRight: Radius.circular(18),
                                          bottomRight: Radius.circular(18),bottomLeft: Radius.circular(18)
                                      ),

                                      image: DecorationImage(
                                          fit: BoxFit.contain,

                                          image: NetworkImage(contents[page1index].subhead[indexL].tvglogo)
                                      )

                                  ),
                                // child: Image.network(contents[page1index].subhead[indexL].tvglogo,
                                // fit: BoxFit.fill,),

                              ):
                              Container(
                                  height: Config.yMargin(context, 25),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                    border: Border.all(

                                        color:
                                        Focus.of(context).hasPrimaryFocus
                                            ? Colors.white:Colors.transparent,

                                        width: 3),
                                  )),
                              SizedBox(height: 10,),
                              Flexible(
                                child: Text(contents[page1index].subhead[indexL].title,style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),),
                              ),

                            ],
                          ),
                        );}),
                      );

                    },
                  )

              ),

              SizedBox(height: 10,),
              if(page1index+1 <contents.length) Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text('${contents[page1index+1].Headname }', style: appThemeDark.textTheme.title,),
              ),
              SizedBox(height: 10,),
              if(page1index+1 <contents.length)  Align(

                alignment: Alignment.bottomCenter,
                child: Container(
                    height: Config.yMargin(context, 19),
                   padding: EdgeInsets.all(8.0),
                    width: Config.xMargin(context, 100),
                  child: SingleChildScrollView(
                    child: Container(
                      height: Config.yMargin(context, 23),
                      width: Config.xMargin(context, 23),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          if(contents[page1index+1].subhead.length>0)     Container(
                            height: Config.yMargin(context, 23),
                            width: Config.xMargin(context, 23),
                            margin: const EdgeInsets.only(left: 8.0, right: 8.0),
                            decoration: BoxDecoration(
                                color: Colors.blueGrey.shade800,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(18),topRight: Radius.circular(18)),
                                image: DecorationImage(
                                    fit: BoxFit.contain,
                                    image: NetworkImage(contents[page1index+1].subhead[0].tvglogo)
                                )

                            ),
                            // child: Image.network(contents[page1index].subhead[indexL].tvglogo,
                            // fit: BoxFit.fill,),

                          ),
                          if(contents[page1index+1].subhead.length>1)     Container(
                            height: Config.yMargin(context, 23),
                            width: Config.xMargin(context, 23),
                            margin: const EdgeInsets.only(left: 8.0, right: 8.0),
                            decoration: BoxDecoration(
                                color: Colors.blueGrey.shade800,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(18),topRight: Radius.circular(18)),
                                image: DecorationImage(
                                    fit: BoxFit.contain,

                                    image: NetworkImage(contents[page1index+1].subhead[1].tvglogo,)
                                )

                            ),
                             // child: Image.network(contents[page1index+1].subhead[1].tvglogo,
                             // fit: BoxFit.contain,
                             //  width:  Config.xMargin(context, 23),
                             //  // width: ,
                             // ),

                          ),
                          if(contents[page1index+1].subhead.length>2)   Container(
                            height: Config.yMargin(context, 23),

                            width: Config.xMargin(context, 23),
                            margin: const EdgeInsets.only(left: 8.0, right: 8.0),
                            decoration: BoxDecoration(
                                color: Colors.blueGrey.shade800,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(18),topRight: Radius.circular(18)),
                                image: DecorationImage(
                                    fit: BoxFit.contain,
                                    image: NetworkImage(contents[page1index+1].subhead[2].tvglogo)
                                )

                            ),
                            // child: Image.network(contents[page1index].subhead[indexL].tvglogo,
                            // fit: BoxFit.fill,),

                          ),
                          if(contents[page1index+1].subhead.length>3)   Container(
                            height: Config.yMargin(context, 23),
                            width: Config.xMargin(context, 23),
                            margin: const EdgeInsets.only(left: 8.0, right: 8.0),
                            decoration: BoxDecoration(
                                color: Colors.blueGrey.shade800,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(18),topRight: Radius.circular(18)),
                                image: DecorationImage(
                                    fit: BoxFit.contain,
                                    image: NetworkImage(contents[page1index+1].subhead[3].tvglogo)
                                )

                            ),


                          ),
                        ],
                      ),
                    ),
                  )


                ),
              ),

            ]
        ),
      );

    }


      )
    :InkWell(
      child: Center(child: Text('Loading....', style: TextStyle(
          color: Colors.blueGrey
      ),),),
      onTap: (){
        print('tapped');
      // fetchit();
      },
    );
  }
}
