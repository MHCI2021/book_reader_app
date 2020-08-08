import 'package:flutter/material.dart';
dynamic safe(String key, Map map)=> map.containsKey(key)?map[key]:null;
 


dynamic safeGet({@required String key, @required Map map,@required dynamic alt}){
  try{
    return map.containsKey(key)?map[key]
    :map.containsKey(key.toLowerCase())?map[key.toLowerCase()]:alt;
  }catch(e){
    return alt;
  }
}

dynamic checkPath(var map, List path){
  int i = 0;
  if(map is Map){
    while (map.containsKey(path[i])){
      map = map[path[i]];
      i++;
      if(i==path.length)return [true, map];
    }
    return [false, null];
  }else return [false, null];
}



String progToPcnt(double prog)=>"${(prog*100).toStringAsFixed(0)}%";

bool isNull(dynamic v)=>v==null;
bool notNull(dynamic v)=>v!=null;