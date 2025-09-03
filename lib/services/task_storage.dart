import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';  
  
  
 class TaskStorage {
  static const _key ="tasks";

static Future<void> saveTasks(List<Map<String, dynamic>>tasks)  async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("tasks", jsonEncode(tasks));



}

static Future<List<Map<String, dynamic>>> loadTasks() async{
   final prefs = await SharedPreferences.getInstance();
    final String? tasksString =prefs.getString("tasks");
    if (tasksString != null){
      return List<Map<String, dynamic>>.from(jsonDecode(tasksString));
    }
    return [];

 } 


 }
  
  


