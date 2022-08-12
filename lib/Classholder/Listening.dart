import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Listening {
  final String title;
  final String author;
  final String duration;
  final Color color;
  final Icon icon;
  final Color colors;
  final int trackCount;
  final String url;
  final int id;

  const Listening(
      {required this.title,
      required this.author,
      required this.duration,
      required this.color,
      required this.icon,
      required this.colors,
      required this.trackCount,
      required this.url,
        required this.id,
      });
}
