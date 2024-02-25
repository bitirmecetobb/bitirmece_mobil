import 'package:flutter/material.dart';

import '../../resultInfo.dart';
import '../../theme.dart';

Future<dynamic> showResult(context, ResultInfo result) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          elevation: 0,
          backgroundColor: Colors.white,
          child: Container(

            height: CurrentAppTheme.height * 0.4,
            width: CurrentAppTheme.width,
            child: Center(
              child: Container(
                width: CurrentAppTheme.width*0.5,
                child: Column(
                  children: [
                    Container(
                      height: CurrentAppTheme.height * 0.1,
                      alignment: Alignment.bottomCenter,
                      child: Text("Sonuçlar:",style: TextStyle(color: Colors.blue, fontSize: 24)),
                    ),
                    Divider(),
                    Container(
                      height: CurrentAppTheme.height * 0.25,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Text(FruitNames[result.fruitData.keys.toList()[index]]! + "  :  ", style: TextStyle(color: Colors.red, fontSize: 20)),
                              Text(result.fruitData.values.toList()[index].toString(), style: TextStyle(color: Colors.black, fontSize: 20)),
                            ],
                          );
                        },
                        itemCount: result.fruitData.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      });
}
