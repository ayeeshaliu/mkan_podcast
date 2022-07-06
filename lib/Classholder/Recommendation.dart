import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Recommendation{
  final Icon icon;
  final String duration;
  final String title;
  final String author;
  final Color color;
  final Color colors;


  const Recommendation({
    required this.icon,
    required this.duration,
    required this.title,
    required this.author,
    required this.color,
    required this.colors,

  } );
}