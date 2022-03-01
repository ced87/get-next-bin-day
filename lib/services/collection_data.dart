import 'package:http/http.dart';
import 'package:intl/intl.dart';

class CollectionData {
  late List collectionTypes;
  late String collectionDate;
  late String tempDate;
  late bool isErrorFree;

  Future<void> getCollectionData() async {
    try {
      Response response = await get(Uri.parse(
          'https://www.aylesburyvaledc.gov.uk/bin-collections/'));
      String body = response.body;
      collectionTypes = getCollectionTypes(body);
      tempDate = getCollectionDate(body)!;
      isErrorFree = true;
    } catch (e) {
      collectionTypes = [];
      tempDate = '';
      isErrorFree = false;
    }
    String today = DateFormat('EEEE d MMMM').format(DateTime.now()).toString();
    String tomorrow = DateFormat('EEEE d MMMM')
        .format(DateTime.now().add(const Duration(days: 1)))
        .toString();

    if (today == tempDate) {
      collectionDate = tempDate + ' (Today)';
    } else if (tomorrow == tempDate) {
      collectionDate = tempDate + ' (Tomorrow)';
    } else {
      collectionDate = tempDate;
    }
  }

  List getCollectionTypes(String body) {
    RegExp pattern = RegExp(
        r'<div\sclass="alert\salert-info\scollection-next">[\S\s]*?</div>');
    RegExp gardenPattern = RegExp(r'GARDEN');
    RegExp recyclingPattern = RegExp(r'>RECYCLING');
    String? match = pattern.stringMatch(body);
    List data = [];

    if (gardenPattern.hasMatch(match!)) {
      data = ['Recycling', 'Garden Waste', 'Food Waste'];
    } else if (recyclingPattern.hasMatch(match)) {
      data = ['Recycling', 'Food Waste'];
    } else {
      data = ['General Waste', 'Food Waste'];
    }

    return data;
  }

  String? getCollectionDate(String body) {
    RegExp pattern = RegExp(
        r'<div\sclass="alert\salert-info\scollection-next">[\S\s]*?</div>');
    RegExp datePattern = RegExp(r'<br\s/>[^<][\S\s]*?</strong>');
    String? match = pattern.stringMatch(body);
    String? dateMatch = datePattern.stringMatch(match!);
    dateMatch = dateMatch?.replaceAll(RegExp(r'</strong>'), '');
    dateMatch = dateMatch?.replaceAll(RegExp(r'<br\s/>'), '');
    return dateMatch;
  }
}
