import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:fuel/widgets/logo.widget.dart';
import 'package:fuel/widgets/submit-form.dart';
import 'package:fuel/widgets/success.widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _dieselController = new MoneyMaskedTextController();
  var _gasolineController = new MoneyMaskedTextController();
  var _busy = false;
  var _completed = false;
  var _resultText = "Use diesel";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: ListView(
        children: <Widget>[
          Logo(),
          _completed
              ? Success(
                  result: _resultText,
                  reset: () {},
                )
              : SubmitForm(
                  dieselController: _dieselController,
                  gasolineController: _gasolineController,
                  busy: _busy,
                  submitFunc: calculate,
                ),
        ],
      ),
    );
  }

  Future calculate() {
    double diesel = double.parse(
            _dieselController.text.replaceAll(new RegExp(r'[,.]'), '')) /
        100;
    double gasoline = double.parse(
            _gasolineController.text.replaceAll(new RegExp(r'[,.]'), '')) /
        100;
    double res = diesel / gasoline;

    setState(() {
      _completed = false;
      _busy = true;
    });

    if (res >= 0.7) {
      _resultText = "Use Diesel";
    } else {
      _resultText = "Use Gasoline";
    }

    _completed = true;
    _busy = false;
  }
}
