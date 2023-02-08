import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as flutter_service;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qtech_product_task/model/product_details_model.dart';
import 'package:qtech_product_task/pages/product_list_page.dart';
import 'package:qtech_product_task/provider/product_list_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductLtstPage(),
    );
  }
}
