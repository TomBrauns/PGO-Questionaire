import 'package:flutter/material.dart';

class GenderSelection extends StatefulWidget {
  @override
  _GenderSelectionState createState() => new _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  int? _gender;
  int? get gender => _gender;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          //--------------- MÄNNLICH ---------------
          Expanded(
              child: Row(children: <Widget>[
            new Radio(
                groupValue: _gender,
                value: 1,
                onChanged: (int? value) {
                  setState(() {
                    _gender = value;
                  });
                }),
            Text("männlich", style: const TextStyle(fontSize: 18))
          ])),

          //--------------- WEIBLICH ---------------
          Expanded(
              child: Row(children: <Widget>[
            new Radio(
                groupValue: _gender,
                value: 2,
                onChanged: (int? value) {
                  setState(() {
                    _gender = value;
                  });
                }),
            Text("weiblich", style: const TextStyle(fontSize: 18))
          ])),

          //--------------- DIVERS ---------------
          Expanded(
              child: Row(children: <Widget>[
            new Radio(
                groupValue: _gender,
                value: 3,
                onChanged: (int? value) {
                  setState(() {
                    _gender = value;
                  });
                }),
            Text("divers", style: const TextStyle(fontSize: 18))
          ]))
        ]);
  }
}
