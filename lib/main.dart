import 'package:flutter/material.dart';
import 'package:newsapp/views/homepage.dart';

void main() =>runApp(MaterialApp(
  debugShowCheckedModeBanner: false,

  initialRoute: '/',
  routes: {
    '/':(context)=>HomePage(),
},
));