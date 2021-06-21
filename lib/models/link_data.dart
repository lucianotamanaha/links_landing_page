import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LinkData {
  final String title;
  final String url;
  final String id;

  LinkData({
    @required this.title,
    @required this.url,
    this.id,
  });

  factory LinkData.fromDocument(QueryDocumentSnapshot data) {
    return LinkData(
      title: data['title'],
      url: data['url'],
      id: data.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'url': url,
    };
  }
}
