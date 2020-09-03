import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:fuel/widgets/input.widget.dart';
import 'package:fuel/widgets/loading-button.widget.dart';
import 'package:fuel/widgets/logo.widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Fuel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  var _dieselController = new MoneyMaskedTextController();
  var _gasolineController = new MoneyMaskedTextController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: ListView(
        children: <Widget>[
          Logo(),
          Container(
            margin: EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Use Diesel",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 40,
                    fontFamily: "Big Shoulders Display",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                LoadingButton(
                    busy: false,
                    func: () {},
                    invert: true,
                    text: "Recalculate"),
              ],
            ),
          ),
          Input(
            label: "Diesel",
            ctrl: _dieselController,
          ),
          Input(
            label: "Gasoline",
            ctrl: _gasolineController,
          ),
          LoadingButton(
              busy: true, func: () {}, invert: false, text: "Calculate"),
        ],
      ),
    );
  }
}
