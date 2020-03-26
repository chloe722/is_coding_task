import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:is_coding_task/model/bike_item.dart';

class Repository {

  Future<List<BikeItem>> loadBikes() async {
    final data = await rootBundle.loadString("assets/ISBikesData.json");
    final parsed = jsonDecode(data.toString());
    return parsed.map<BikeItem>((jsonData) => BikeItem.fromJson(jsonData)).toList();
  }

  void addBikeItem() {}


  void updateBikeItem(){
  }


  void deleteBikeItem(){}


  void saveBikes(List<BikeItem> bikes){}

}