import 'package:flutter/material.dart';
import 'package:rubbish_collection/services/collection_data.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupCollectionData() async {
    CollectionData instance = CollectionData();
    await instance.getCollectionData();
    var targetLocation = instance.isErrorFree ? '/home' : '/error';
    Navigator.pushReplacementNamed(
      context,
      targetLocation,
      arguments: {
        'types': instance.collectionTypes,
        'date': instance.collectionDate,
      },
    );
  }

  @override
  void initState() {
    super.initState();
    setupCollectionData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.green[100],
        ),
      ),
    );
  }
}
