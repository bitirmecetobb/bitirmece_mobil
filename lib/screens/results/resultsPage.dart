import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logger_app/theme.dart';
import '../../resultInfo.dart';
import 'lastResultPopUp.dart';

List<ResultInfo> results = [
  ResultInfo(timestamp: DateTime.now(), fruitData: {
    FruitType.orange: 1,
    FruitType.apple: 1,
    FruitType.banana: 1
  }),
  ResultInfo(
      timestamp: DateTime.fromMillisecondsSinceEpoch(1000000),
      fruitData: {
        FruitType.orange: 2,
        FruitType.apple: 1,
        FruitType.banana: 0
      }),
  ResultInfo(
      timestamp: DateTime.fromMillisecondsSinceEpoch(1060000),
      fruitData: {
        FruitType.orange: 0,
        FruitType.apple: 3,
        FruitType.banana: 0
      }),
  ResultInfo(
      timestamp: DateTime.fromMillisecondsSinceEpoch(1020000),
      fruitData: {
        FruitType.orange: 1,
        FruitType.apple: 1,
        FruitType.banana: 1
      }),
];

class ResultsPage extends StatefulWidget {
  ResultsPage();

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Container(
              margin: EdgeInsets.all(CurrentAppTheme.height * 0.05),
              height: CurrentAppTheme.height * 0.2,
              child: Center(
                child: Text(
                  "Ölçüm Sonuçları",
                  style: TextStyle(color: Colors.white),
                ),
              )),
        ),
        body: Container(
          height: CurrentAppTheme.height * 0.7,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                  child: Text("Sonuçlar:",
                      style: TextStyle(color: Colors.blue, fontSize: 20))),
              Container(
                height: CurrentAppTheme.height * 0.5,
                margin: EdgeInsets.only(top: 10, left: CurrentAppTheme.width * 0.1, right: CurrentAppTheme.width * 0.1),
                child: ListView.builder(
                  itemCount: results.length,
                  itemBuilder: (context, index) {
                    if (index % 5 == 0) {
                      return Container(
                        child: Column(
                          children: [
                            Divider(),
                            resultListTile(context, results[index], index)
                          ],
                        ),
                      );
                    }
                    return resultListTile(context, results[index], index);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

ListTile resultListTile(context, ResultInfo result, int resultNo) {
  return ListTile(
    onTap: () async {
      await showResult(context, result);
    },
    leading: Icon(
      Icons.shopping_basket_outlined,
      color: Colors.red,
    ),
    trailing: Text(DateFormat('HH:mm').format(result.timestamp)),
    title: Text("Ölçüm no: " + (resultNo + 1).toString()),
  );
}
