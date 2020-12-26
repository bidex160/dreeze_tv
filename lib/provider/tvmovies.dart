import 'dart:convert';

import 'package:dreeze_tv/Model/attributeModel.dart';
import 'package:dreeze_tv/Model/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class TvShows {
  static Future<List<dynamic>> fetchtv() async {
    List<ListModel> list = [];


    var uri = Uri.https('www.dreezetv.com', '/channels.php');
    var res =
    await http.get(uri, headers: {'Content-Type': 'application/json'});

    if (res.statusCode == 200) {

      String stringre = res.body.toString();
      var parsedJson = jsonDecode(stringre) as Map<String, dynamic>;

      parsedJson.forEach((key, value) {


        var second = value['1'] as Map<String, dynamic>;

        List<AttributeModel>  subhead = [];
        second.forEach((key, value) {

        AttributeModel json =  AttributeModel.fromJson(value);
        subhead.add(json);
        });




        list.add(ListModel(Headname: value['0'], lenght: subhead.length, subhead: subhead));


      });



      return list;
    } else {
      return list;
    }
  }
}