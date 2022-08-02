import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Recommendation{
  final Icon icon;
  final String duration;
  final String title;
  final String author;
  final Color color;
  final Color colors;
  final int trackCount;
  final String url;



  const Recommendation({
    required this.icon,
    required this.duration,
    required this.title,
    required this.author,
    required this.color,
    required this.colors,
    required this.trackCount,
   required this.url,

  } );
}