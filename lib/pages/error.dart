import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buckinghamshire Bin Days"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.grey[900],
        foregroundColor: Colors.green[100],
      ),
      body: Container(
        color: Colors.grey[800],
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 25, 8, 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Error retreiving data. Please try again later.',
                style: TextStyle(
                  color: Colors.green[100],
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
