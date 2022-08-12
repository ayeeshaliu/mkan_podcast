import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Recommendation{
  final Icon icon;
  final String duration;
  final String title;
  final String author;
  final Color color;
  final Color colors;
  final String url;
  final int id;
  final String trackTitle;
  final String permalinkUri;
  final String artworkUrl;
  final String streamUrl;



  const Recommendation({
    required this.icon,
    required this.duration,
    required this.title,
    required this.author,
    required this.color,
    required this.colors,
    required this.url,
    required this.id,
    required this.trackTitle,
    required this.permalinkUri,
    required this.artworkUrl,
    required this.streamUrl,



  } );
}