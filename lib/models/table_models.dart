import 'package:flutter/material.dart';

class TableModel {
  final String name;
  final IconData icon;
  TableModel({required this.name, required this.icon});

  factory TableModel.fromJson(Map<String, dynamic> json) {
    return TableModel(name: json['name'], icon: json['icon']);
  }
}
