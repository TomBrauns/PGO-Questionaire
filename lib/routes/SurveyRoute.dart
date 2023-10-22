import 'package:flutter/material.dart';
import 'package:mainproject/MyToast.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import '../dropdown.dart';

double _currentSliderValue = 5;
bool _checkalter = false;
bool _isVisible = false;

class SurveyRoute extends StatefulWidget {
  SurveyRoute({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _SurveyRouteState createState() => new _SurveyRouteState();
}

//--------------------- SURVEY ROUTE ---------------------
class _SurveyRouteState extends State<SurveyRoute> {
  List? _aktivitaeten;
  int? _auswahl;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Umfrage"),
              backgroundColor: Colors.green,
            ),
            body: SingleChildScrollView(
                child: Row(children: <Widget>[
              //---------- LEFT SPACEHOLDER ----------
              Expanded(flex: 35, child: SizedBox()),

              //---------- MAIN COLUMN ----------
              Expanded(
                  flex: 30,
                  child: Form(
                    key: _form,
                    child: Center(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                          SizedBox(height: 15),

                          //-----------  HEADER & PROGRESS BAR -----------
                          Row(children: <Widget>[
                            //----------- CAPTION -----------
                            Expanded(
                                flex: 45,
                                child: Text("Fragebogen",
                                    style: const TextStyle(fontSize: 26))),

                            //----------- PLACEHOLDER -----------
                            Expanded(flex: 10, child: Container()),

                            //----------- PROGRESS BAR -----------
                            Expanded(
                                flex: 45,
                                child: Align(
                                    alignment: Alignment.topRight,
                                    child: new LinearPercentIndicator(
                                      width: 100.0,
                                      lineHeight: 14.0,
                                      percent: 0.5,
                                      backgroundColor: Colors.grey,
                                      progressColor: Colors.lightBlue,
                                      animation: true,
                                      animationDuration: 2000,
                                      center: Text("50.0%"),
                                    )))
                          ]),

                          SizedBox(height: 40),

                          //----------- ALTER -----------
                          Text("Alter", style: const TextStyle(fontSize: 20)),
                          Row(children: <Widget>[
                            Expanded(
                              child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Alter',
                                  ),
                                  keyboardType: TextInputType.number,
                                  validator: (String? alterseingabe) {
                                    if (!(isNumeric(alterseingabe) &&
                                        alterseingabe!.isNotEmpty &&
                                        alterseingabe.length < 4)) {
                                      return "Bitte geben Sie ein gültiges Alter an";
                                    } else {
                                      _checkalter = true;
                                      return null;
                                    }
                                  }),
                            )
                          ]),

                          SizedBox(height: 40),

                          //----------- SPORT -----------
                          Text("Welchen Sport machen Sie?",
                              style: const TextStyle(fontSize: 20)),
                          Row(children: <Widget>[
                            Expanded(
                                child: Container(
                                    child: MultiSelectFormField(
                              //POPUP

                              autovalidate: false,
                              chipBackGroundColor: Colors.green,
                              chipLabelStyle: TextStyle(color: Colors.white),
                              dialogTextStyle: TextStyle(),
                              checkBoxActiveColor: Colors.green, //kästchen
                              checkBoxCheckColor: Colors.white, //kästchen

                              dialogShapeBorder: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(12.0))), //Formfield ende

                              title: Text(
                                "",
                                style: TextStyle(fontSize: 1),
                              ),
                              validator: (value) {
                                if (value == null || value.length == 0) {
                                  return 'Bitte wählen sie eine oder mehrere Sportarten aus';
                                }
                                return null;
                              },
                              dataSource: [
                                {
                                  "anzeige": "Joggen",
                                  "wert": "Joggen",
                                },
                                {
                                  "anzeige": "Klettern",
                                  "wert": "Klettern",
                                },
                                {
                                  "anzeige": "Spazieren",
                                  "wert": "Spazieren",
                                },
                                {
                                  "anzeige": "Schwimmen",
                                  "wert": "Schwimmen",
                                },
                                {
                                  "anzeige": "Fussballtraining",
                                  "wert": "Fussballtraining",
                                },
                                {
                                  "anzeige": "Baseballtraining",
                                  "wert": "Baseballtraining",
                                },
                                {
                                  "anzeige": "Footballtraining",
                                  "wert": "Footballtraining",
                                },
                                {
                                  "anzeige": "Kampfsportarten",
                                  "wert": "Kampfsportarten",
                                },
                                {
                                  "anzeige": "TaekWonDo",
                                  "wert": "TaekWonDo",
                                },
                                {
                                  "anzeige": "E-Sports",
                                  "wert": "Esports",
                                },
                              ],
                              textField: 'anzeige',
                              valueField: 'wert',

                              //Buttons im Popup

                              okButtonLabel: 'OK',
                              cancelButtonLabel: 'Abbrechen',

                              hintWidget: Text('Sportarten wählen...'),
                              initialValue: _aktivitaeten,
                              onSaved: (wert) {
                                if (wert == null) return;
                                setState(() {
                                  _aktivitaeten = wert;
                                });
                              },
                            )))
                          ]),

                          SizedBox(height: 40),

                          //------------- SPORT -------------
                          Text("Wie sportlich sind Sie?",
                              style: const TextStyle(fontSize: 20)),
                          SizedBox(height: 10),
                          Row(children: <Widget>[
                            Expanded(
                                child: Slider(
                                    value: _currentSliderValue,
                                    min: 1,
                                    max: 5,
                                    divisions: 5,
                                    label:
                                        _currentSliderValue.round().toString(),
                                    onChanged: (double wertuebergabe) {
                                      setState(() =>
                                          _currentSliderValue = wertuebergabe);
                                    }))
                          ]),

                          SizedBox(height: 40),

                          //------------- PET -------------
                          Text("Haben Sie Haustiere?",
                              style: const TextStyle(fontSize: 20)),

                          SizedBox(height: 10),

                          new Row(children: <Widget>[
                            Expanded(
                                flex: 20,
                                child: Row(children: <Widget>[
                                  //---------- JA ----------
                                  new Radio(
                                      groupValue: _auswahl,
                                      value: 1,
                                      onChanged: (int? value) {
                                        setState(() {
                                          _auswahl = value;
                                          _isVisible = true;
                                        });
                                      }),
                                  Text("Ja",
                                      style: const TextStyle(fontSize: 18))
                                ])),

                            Expanded(flex: 5, child: Container()),

                            //---------- NEIN ----------
                            Expanded(
                                flex: 20,
                                child: Row(children: <Widget>[
                                  new Radio(
                                      groupValue: _auswahl,
                                      value: 2,
                                      onChanged: (int? value) {
                                        setState(() {
                                          _auswahl = value;
                                          _isVisible = false;
                                        });
                                      }),
                                  Text("Nein",
                                      style: const TextStyle(fontSize: 18)),
                                ])),
                            Expanded(flex: 55, child: Container()),
                          ]),
                          SizedBox(height: 40),

                          //------------- PET-DROPDOWN -------------
                          Row(children: <Widget>[
                            Visibility(
                                visible: _isVisible,
                                child: Expanded(child: PetDropdown()))
                          ]),

                          SizedBox(height: 40),

                          //------------- BUTTONS -------------
                          Row(
                            children: [
                              //---- BACK ----
                              Expanded(
                                flex: 35,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(
                                        context, '/third');
                                  },
                                  child: Text('Zurück'),
                                ),
                              ),

                              //---- PLACEHOLDER ----
                              Expanded(flex: 30, child: Container()),

                              //---- SAVE ----
                              Expanded(
                                  flex: 35,
                                  child: ElevatedButton(
                                    onPressed: () => {
                                      _saveForm(),
                                      if (_checkalter == true)
                                        {
                                          Navigator.pushReplacementNamed(
                                              context, '/fourth'),
                                        }
                                      else
                                        {
                                          MyToast().ungueltigeZahl(),
                                        }
                                    },
                                    child: Text('Speichern'),
                                  )),
                            ],
                          )
                        ])),
                  )),
              //---------- RIGHT SPACEHOLDER ----------
              Expanded(flex: 35, child: SizedBox())
            ]))));
  }
}

final _form = GlobalKey<FormState>();
void _saveForm() {
  final isValid = _form.currentState!.validate();
  if (!isValid) {
    return;
  }
}

bool isNumeric(String? s) {
  if (s == null) {
    return false;
  }
  return double.tryParse(s) != null;
}
