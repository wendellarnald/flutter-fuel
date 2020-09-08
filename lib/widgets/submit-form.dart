import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:fuel/widgets/input.widget.dart';

import 'loading-button.widget.dart';

class SubmitForm extends StatelessWidget {
  var dieselController = new MoneyMaskedTextController();
  var gasolineController = new MoneyMaskedTextController();
  var busy;
  Function submitFunc;

  SubmitForm({
    @required this.dieselController,
    @required this.gasolineController,
    @required this.busy,
    @required this.submitFunc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          child: Input(
            label: "Diesel",
            ctrl: dieselController,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          child: Input(
            label: "Gasoline",
            ctrl: gasolineController,
          ),
        ),
        SizedBox(
          height: 25,
        ),
        LoadingButton(
          busy: busy,
          func: submitFunc,
          invert: false,
          text: "Calculate",
        ),
      ],
    );
  }
}
