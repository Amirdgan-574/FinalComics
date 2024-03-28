import 'package:flutter/material.dart';
class Comic {
  final String title;
  final String description;
  final List<String> images;
  final String price;
  Comic({required this.title, required this.description, required this.images,required this.price});
}