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
  var _alcoolController = new MoneyMaskedTextController();
  var _gasolineController = new MoneyMaskedTextController();
  var _busy = false;
  var _completed = false;
  var _resultText = "Use Álcool";

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
                  reset: reset,
                )
              : SubmitForm(
                  alcoolController: _alcoolController,
                  gasolineController: _gasolineController,
                  busy: _busy,
                  submitFunc: calculate,
                ),
        ],
      ),
    );
  }

  Future calculate() {
    double alcool = double.parse(
            _alcoolController.text.replaceAll(new RegExp(r'[,.]'), '')) /
        100;
    double gasoline = double.parse(
            _gasolineController.text.replaceAll(new RegExp(r'[,.]'), '')) /
        100;
    double res = alcool / gasoline;

    setState(() {
      _completed = false;
      _busy = true;
    });

    return new Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        if (res >= 0.7) {
          _resultText = "Use Gasoline";
        } else {
          _resultText = "Use Álcool";
        }

        _completed = true;
        _busy = false;
      });
    });
  }

  reset() {
    setState(() {
      _alcoolController = new MoneyMaskedTextController();
      _gasolineController = new MoneyMaskedTextController();
      _busy = false;
      _completed = false;
    });
  }
}
