import 'package:flutter/material.dart';
import 'package:rubbish_collection/pages/error.dart';
import 'package:rubbish_collection/pages/home.dart';
import 'package:rubbish_collection/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const Loading(),
      '/home': (context) => const Home(),
      '/error': (context) => const ErrorPage(),
    },
  ));
}
