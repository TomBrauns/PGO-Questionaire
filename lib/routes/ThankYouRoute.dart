import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mainproject/MyToast.dart';

class ThankYouRoute extends StatefulWidget {
  @override
  _ThankYouRoute createState() => new _ThankYouRoute();
}

var textValue = 'Nein';
bool isSwitched = false;

class _ThankYouRoute extends State<ThankYouRoute> {
  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'Ja';
      });
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'Nein';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Danke!"), backgroundColor: Colors.green),
        body: SingleChildScrollView(
          child: Row(children: <Widget>[
            //-------- LEFT SPACEHOLDER --------
            Expanded(flex: 30, child: Container()),

            //-------- MAIN COLUMN --------

            Expanded(
                flex: 40,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20),
                    Text("Vielen Dank für Ihre Teilnahme.",
                        style: const TextStyle(fontSize: 40)),
                    SizedBox(height: 30),

                    // ----------- PIC -----------
                    Image.network(
                      'https://images.pexels.com/photos/1887992/pexels-photo-1887992.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                      width: 300,
                    ),
                    SizedBox(height: 30),

                    // ------ RATING --------
                    Text("Wie würden Sie diese Umfrage bewerten?",
                        style: const TextStyle(fontSize: 20)),
                    SizedBox(height: 10),

                    RatingBar.builder(
                      initialRating: 2.5,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    SizedBox(height: 30),

                    // ---------- YES/NO -------------
                    Text("Würden Sie weitere Umfragen von uns beantworten?",
                        style: const TextStyle(fontSize: 20)),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Switch(
                          value: isSwitched,
                          onChanged: toggleSwitch,
                          activeTrackColor: Colors.yellow,
                          activeColor: Colors.orangeAccent,
                        ),
                        Text(
                          '$textValue',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    // ---------- BACK ----------
                    Row(children: <Widget>[
                      //LEFT
                      Expanded(flex: 30, child: Container()),

                      //BUTTON
                      Expanded(
                          flex: 40,
                          child: ElevatedButton(
                            onPressed: () => {
                              MyToast().abschlussMSG(),
                              Navigator.pushReplacementNamed(context, '/'),
                            },
                            child: Text('Zurück zur Startseite',
                                style: TextStyle(fontSize: 16)),
                          )),

                      //RIGHT
                      Expanded(flex: 30, child: Container()),
                    ]),
                  ],
                )),

            //--------- RIGHT SPACEHOLDER -------------
            Expanded(flex: 30, child: Container())
          ]),
        ));
  }
}
