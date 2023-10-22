import 'package:flutter/material.dart';
import '../dropdown.dart';
import '../MyToast.dart';
import '../GenderSelection.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../datetimepicker.dart';

bool? _isCheckedNews = false;
bool? _isCheckedAGB = false;
bool? _nachname = false;
bool? _vorname = false;
bool? _email = false;
final emailController = TextEditingController();
final firstnameController = TextEditingController();
final lastnameController = TextEditingController();

class RegistrationRoute extends StatefulWidget {
  RegistrationRoute({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _RegistrationRouteState createState() => new _RegistrationRouteState();
}

class _RegistrationRouteState extends State<RegistrationRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Anmeldeformular"),
          backgroundColor: Colors.green,
        ),

        //scrollable
        body: Scrollbar(
          isAlwaysShown: true,
          child: SingleChildScrollView(
              //formular
              child: Form(
                  key: _form,

                  //------- LAYOUT ROW -------
                  child: Row(children: <Widget>[
                    //------- LEFT SPACE -------
                    Expanded(
                      flex: 35,
                      child: SizedBox(),
                    ),

                    //------- MAIN MIDDLE COLUMN -------
                    Expanded(
                        flex: 30,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: 15, child: Container()),

                              Row(children: <Widget>[
                                //----------- CAPTION -----------
                                Expanded(
                                    flex: 70,
                                    child: Text("Anmeldung zur Umfrage",
                                        style: const TextStyle(fontSize: 26))),

                                //----------- PLACEHOLDER -----------
                                Expanded(flex: 5, child: Container()),

                                //----------- PROGRESS BAR -----------
                                Expanded(
                                    flex: 25,
                                    child: Align(
                                        alignment: Alignment.topRight,
                                        child: new LinearPercentIndicator(
                                          width: 120.0,
                                          lineHeight: 14.0,
                                          percent: 0.1,
                                          backgroundColor: Colors.grey,
                                          progressColor: Colors.lightBlue,
                                          animation: true,
                                          animationDuration: 2000,
                                          center: Text("10.0%"),
                                        )))
                              ]),

                              SizedBox(height: 40),

                              //------------- GENDER -------------
                              Text("Geschlecht",
                                  style: const TextStyle(fontSize: 20)),
                              SizedBox(height: 5),

                              GenderSelection(),

                              SizedBox(height: 40),

                              //------------- NAME -------------
                              Text("Name*",
                                  style: const TextStyle(fontSize: 20)),
                              new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    // --- Vorname ---
                                    Expanded(
                                      flex: 45,
                                      child: TextFormField(
                                          decoration: InputDecoration(
                                              labelText: 'Vorname'),
                                          controller: firstnameController,
                                          autofillHints: [
                                            AutofillHints.givenName
                                          ],
                                          keyboardType: TextInputType.name,
                                          validator: (String? text) {
                                            if (text != null &&
                                                !(text.length >= 2)) {
                                              return "Mindestens zwei Zeichen erforderlich";
                                            }
                                            _vorname = true;
                                            return null;
                                          }),
                                    ),

                                    Expanded(flex: 10, child: SizedBox()),

                                    // --- Nachname ---
                                    Expanded(
                                      flex: 45,
                                      child: TextFormField(
                                          decoration: InputDecoration(
                                              labelText: 'Nachname'),
                                          controller: lastnameController,
                                          autofillHints: [
                                            AutofillHints.familyName
                                          ],
                                          keyboardType: TextInputType.name,
                                          validator: (String? text) {
                                            if (text != null &&
                                                !(text.length >= 2)) {
                                              return "Mindestens zwei Zeichen erforderlich";
                                            }
                                            _nachname = true;
                                            return null;
                                          }),
                                    ),
                                  ]),
                              SizedBox(height: 40),

                              //  ------------- BIRTHDAY -------------
                              Text("Geburtsdatum eingeben",
                                  style: TextStyle(fontSize: 20)),
                              Row(children: <Widget>[
                                Expanded(child: DateTimePicker())
                              ]),

                              SizedBox(height: 10),

                              //------------- STATE -------------
                              Text("Bundesland",
                                  style: const TextStyle(fontSize: 20)),
                              Row(children: <Widget>[
                                Expanded(flex: 1, child: StateDropdown())
                              ]),

                              SizedBox(height: 40),

                              //------------- E-MAIL -------------
                              Row(children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: TextFormField(
                                      decoration:
                                          InputDecoration(labelText: 'E-Mail*'),
                                      controller: emailController,
                                      autofillHints: [AutofillHints.email],
                                      keyboardType: TextInputType.emailAddress,
                                      validator: (String? text) {
                                        if (text != null &&
                                            RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                .hasMatch(text)) {
                                          _email = true;
                                          return null;
                                        } else {
                                          return "Bitte geben Sie eine gültige E-Mail Adresse an!";
                                        }
                                      }),
                                )
                              ]),

                              SizedBox(height: 40),

                              new Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    //------------- NEWSLETTER CHECKBOX -------------
                                    CheckboxListTile(
                                      title: Text("Newsletter abonnieren"),
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      value: _isCheckedNews,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          _isCheckedNews = value;
                                        });
                                      },
                                      activeColor: Colors.white,
                                      checkColor: Colors.green,
                                    ),

                                    SizedBox(height: 10),

                                    //------------- AGB CHECKBOX -------------
                                    CheckboxListTile(
                                      title: Text("*AGB gelesen"),
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      value: _isCheckedAGB,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          _isCheckedAGB = value;
                                        });
                                      },
                                      activeColor: Colors.white,
                                      checkColor: Colors.green,
                                    ),
                                  ]),

                              SizedBox(height: 50),

                              new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // ------------- RETURN BUTTON -------------
                                    Expanded(
                                        flex: 30,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.pushReplacementNamed(
                                                context, '/');
                                          },
                                          child: Text('Zurück'),
                                        )),

                                    Expanded(flex: 15, child: SizedBox()),

                                    // ------------- SAVE BUTTON -------------
                                    Expanded(
                                        flex: 55,
                                        child: ElevatedButton(
                                          onPressed: () => {
                                            _saveForm(),
                                            if (_isCheckedAGB == true &&
                                                _vorname == true &&
                                                _nachname == true &&
                                                _email == true)
                                              {
                                                _saveForm(),
                                                MyToast().showToastMSG(),
                                                Navigator.pushReplacementNamed(
                                                    context, '/second'),
                                              }
                                            else
                                              {
                                                MyToast().toastMSGFailed(),
                                              }
                                          },
                                          child:
                                              Text('Speichern und fortfahren'),
                                        )),
                                    SizedBox(height: 100),
                                  ]),
                            ])),

                    //right space
                    Expanded(
                      flex: 35,
                      child: SizedBox(),
                    )
                  ]))),
        ));
  }
}

final _form = GlobalKey<FormState>();
void _saveForm() {
  final isValid = _form.currentState!.validate();
  if (!isValid) {
    return;
  }
}
