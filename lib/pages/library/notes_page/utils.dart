
import 'package:flutter/material.dart';

String timeToString({@required int start, int end}){
  int seconds = start%60, minutes = (start/60).floor();
  String sec = seconds<10? "0$seconds":seconds.toString();
  String startTime = "$minutes:$sec";
  if(end==null) return startTime;
  seconds = end%60;
  minutes = (end/60).floor();
  sec = seconds<10? "0$seconds":seconds.toString();
  String endTime = "$minutes:$sec";
  return "$startTime - $endTime";
  
  }