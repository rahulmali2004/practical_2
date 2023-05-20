import 'package:flutter/material.dart';

import 'dart:io';

class Contact {
  final String name;
  final String contact;
  final String? email;
  final File? image;
  final String? website;

  Contact({required this.name, required this.contact, this.image,required this.email,required this.website});

  factory Contact.fromMap({required Map data}) {
    return Contact(name: data['title'], contact: data['subtitle'],email: data['email'],website: data['website']);
  }
}



List contactname = [
  {
    "title": "rahul",
    "email" : "abc123@gmail.com",
    "subtitle": "8758413377",
    "imagess": "https://static.toiimg.com/thumb/msid-85425005,width-400,resizemode-4/85425005.jpg",
    "website": "https://pub.dev/packages?q=silder",
  },
  {
    "title": "Om",
    "email" : "abc123@gmail.com",
    "subtitle": "8558413377",
    "imagess": "https://static.toiimg.com/thumb/msid-85425005,width-400,resizemode-4/85425005.jpg",
    "website": "https://pub.dev/packages?q=silder",
  },
  {
    "title": "kirti",
    "email" : "abc123@gmail.com",
    "subtitle": "8758413388",
    "imagess": "https://static.toiimg.com/thumb/msid-85425005,width-400,resizemode-4/85425005.jpg",
    "website": "https://pub.dev/packages?q=silder",
  },
  {
    "title": "bhargav",
    "email" : "abc123@gmail.com",
    "subtitle": "8758413777",
    "imagess": "https://static.toiimg.com/thumb/msid-85425005,width-400,resizemode-4/85425005.jpg",
    "website": "https://pub.dev/packages?q=silder",
  },
  {
    "title": "parth",
    "email" : "abc123@gmail.com",
    "subtitle": "8758403377",
    "imagess": "https://static.toiimg.com/thumb/msid-85425005,width-400,resizemode-4/85425005.jpg",
    "website": "https://pub.dev/packages?q=silder",
  },
  {
    "title": "dilipjoshi",
    "email" : "abc123@gmail.com",
    "subtitle": "8708413377",
    "imagess": "https://static.toiimg.com/thumb/msid-85425005,width-400,resizemode-4/85425005.jpg",
    "website": "https://pub.dev/packages?q=silder",
  },
  {
    "title": "bhide",
    "email" : "abc123@gmail.com",
    "subtitle": "8058413377",
    "imagess": "https://static.toiimg.com/thumb/msid-85425005,width-400,resizemode-4/85425005.jpg",
    "website": "https://pub.dev/packages?q=silder",
  },
  {
    "title": "tapu",
    "email" : "abc123@gmail.com",
    "subtitle": "8758713377",
    "imagess": "https://static.toiimg.com/thumb/msid-85425005,width-400,resizemode-4/85425005.jpg",
    "website": "https://pub.dev/packages?q=silder",
  },
  {
    "title": "kishan",
    "email" : "abc123@gmail.com",
    "subtitle": "9958413377",
    "imagess": "https://static.toiimg.com/thumb/msid-85425005,width-400,resizemode-4/85425005.jpg",
    "website": "https://pub.dev/packages?q=silder",
  },
  {
    "title": "ram",
    "email" : "abc123@gmail.com",
    "subtitle": "8998413377",
    "imagess": "https://static.toiimg.com/thumb/msid-85425005,width-400,resizemode-4/85425005.jpg",
    "website": "https://pub.dev/packages?q=silder",
  },
  {
    "title": "bharat",
    "email" : "abc123@gmail.com",
    "subtitle": "8758410077",
    "imagess": "https://static.toiimg.com/thumb/msid-85425005,width-400,resizemode-4/85425005.jpg",
    "website": "https://pub.dev/packages?q=silder",
  },
  {
    "title": "krish",
    "email" : "abc123@gmail.com",
    "subtitle": "8758400377",
    "imagess": "https://static.toiimg.com/thumb/msid-85425005,width-400,resizemode-4/85425005.jpg",
    "website": "https://pub.dev/packages?q=silder",
  },
];