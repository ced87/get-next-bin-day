import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;

    getListIcon(index) {
      if (data['types'][index] == 'Recycling') {
        return FaIcon(
          FontAwesomeIcons.recycle,
          color: Colors.green[100],
        );
      } else if (data['types'][index] == 'General Waste') {
        return FaIcon(
          FontAwesomeIcons.trashAlt,
          color: Colors.green[100],
        );
      } else if (data['types'][index] == 'Food Waste') {
        return FaIcon(
          FontAwesomeIcons.utensils,
          color: Colors.green[100],
        );
      } else {
        return FaIcon(
          FontAwesomeIcons.leaf,
          color: Colors.green[100],
        );
      }
    }

    final typesList = Container(
      margin: const EdgeInsets.all(8),
      height: 250,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: data['types'].length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 0,
              color: Colors.grey[700],
              child: ListTile(
                title: Text(
                  data['types'][index],
                  style: TextStyle(
                    color: Colors.green[100],
                    fontSize: 32,
                  ),
                ),
                leading: getListIcon(index),
              ),
            ),
          );
        },
      ),
    );

    final date = Text(
      data['date'],
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.green[100],
        fontSize: 44,
        fontWeight: FontWeight.bold,
      ),
    );

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
                'Next Collection on:',
                style: TextStyle(
                  color: Colors.green[100],
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 20),
              date,
              const SizedBox(height: 20),
              typesList,
            ],
          ),
        ),
      ),
    );
  }
}
